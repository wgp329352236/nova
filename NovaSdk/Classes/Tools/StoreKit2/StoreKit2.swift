import Foundation
import StoreKit

public enum StoreError: Error {
    case failedVerification
}


class StoreKit2 {

    public static let shared: StoreKit2 = {
        let instance = StoreKit2()
        return instance
    }()

    private init() {
        // 启动交易更新监听
//        listenForTransactionUpdates()
    }
    
    func checkStoreInfo() {
        fetchStoreInfo().then { (_, storeInfo) -> Any? in
            if let countryCode = storeInfo?.countryCode {
                kvStorage.set(key: PackageSettingsKey.shared.SF_CODE, data: countryCode)
                TrackingManager.manager.addGlobalCallbackParameter(countryCode, forKey: "store_front_code")
            }
            return nil
        }
    }

    func fetchStoreInfo() -> StorePromise<StoreInfo> {
        let promise = StorePromise<StoreInfo>(waitFor: nil)
        Task {
            do {
                let storefront = try await Storefront.current
                if let storeInfo = storefront {
                    promise.resolve(result: StoreInfo(storeInfo.id, storeInfo.countryCode))
                } else {
                    promise.reject(reason: Throwable("fetch storefront error!"))
                }
            } catch {
                promise.reject(reason: Throwable("fetch storefront error!"))
            }
        }
        return  promise
    }

    func fillOrder(_ order: PayOrder) -> StorePromise<PayOrder> {
        let promise = StorePromise<PayOrder>(waitFor: nil)
        Task {
            do {
                let storeProducts = try await Product.products(for: [order.productId])
                if let product = storeProducts.first(where: { $0.id == order.productId }) {
                    order.ownerType = .ios
                    order.productAmount = Double(truncating: product.price as NSNumber)
                    order.productCurrency = product.priceFormatStyle.currencyCode
                    order.productDescription = product.displayName
                    promise.resolve(result: order)
                } else {
                    promise.reject(reason: Throwable("product \(order.productId) not found!"))
                }
            } catch {
                promise.reject(reason: Throwable("product \(order.productId) not found!"))
            }
        }

        return promise
    }

    func finishPurchase() {

    }

    func start(_ order: PayOrder) -> StorePromise<PayOrder> {
        mdebug("[StoreKit2]: purchase start:\(order)")
        let promise = StorePromise<PayOrder>(waitFor: nil)
        guard order.orderId.isNotEmpty else {
            promise.reject(reason: Throwable("order error!"))
            return promise
        }

        fetchProduct(order).then { [self](_, purchaseData) in
            if let product = purchaseData?.product, let order = purchaseData?.order {
                Task {
//                    let storefront = await Storefront.current
//                    mdebug("[StoreKit2]: ID: \(storefront?.id ?? "未知")")
//                    mdebug("[StoreKit2]: countryCode: \(storefront?.countryCode ?? "Default(USA)")")
                    await purchase(product, order, promise)
                }
            } else {
                promise.reject(reason: Throwable("products not found!"))
            }
        }

        return promise
    }

    class PurchaseData {
        let order: PayOrder
        let product: Product

        init(order: PayOrder, product: Product) {
            self.order = order
            self.product = product
        }
    }

    func fetchProduct(_ order: PayOrder) -> StorePromise<PurchaseData> {
        let promise = StorePromise<PurchaseData>(waitFor: nil)
        Task {
            do {
                let storeProducts = try await Product.products(for: [order.productId])
                if let storeProduct = storeProducts.first(where: { $0.id == order.productId }) {
                    let product = PurchaseData(order: order, product: storeProduct)
                    promise.resolve(result: product)
                } else {
                    promise.reject(reason: Throwable("product \(order.productId) not found!"))
                }
            } catch {
                promise.reject(reason: Throwable("product \(order.productId) not found!"))
            }
        }
        return promise
    }

    func fetchProducts(productIds: Set<String>) -> StorePromise<NSArray> {
        let promise = StorePromise<NSArray>(waitFor: nil)
        Task {
            do {
                let products = try await Product.products(for: productIds)
                if products.count > 0 {
                    promise.resolve(result: products as NSArray)
                } else {
                    promise.reject(reason: Throwable("fetch products error!"))
                }
            } catch {
                promise.reject(reason: Throwable("fetch products error!"))
            }
        }

        return promise
    }

    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        // Check whether the JWS passes StoreKit verification.
        switch result {
        case .unverified:
            // StoreKit parses the JWS, but it fails verification.
            throw StoreError.failedVerification
        case .verified(let safe):
            // The result is verified. Return the unwrapped value.
            return safe
        }
    }

    func purchase(_ product: Product, _ order: PayOrder, _ promise: StorePromise<PayOrder>) async {
        mdebug("[StoreKit2]: purchase product=\(product), order=\(order)")

        func purchaseSuccess(_ transaction: Transaction, _ promise: StorePromise<PayOrder>) {
            order.orderId = exchangeOrderId(transaction.appAccountToken)
            order.purchaseId = "\(transaction.id)"
            order.purchaseStatus = .purchased
            mdebug("[StoreKit2]: purchase success=\(order)")
            promise.resolve(result: order)
        }

        func purchaseCancelled(_ promise: StorePromise<PayOrder>) {
            order.purchaseId = ""
            order.purchaseStatus = .cancelled
            order.message = "User cancelled"
            mdebug("[StoreKit2]: purchase userCancelled=\(order)")
            promise.resolve(result: order)
        }

        func purchasePending(_ promise: StorePromise<PayOrder>) {
            order.purchaseId = ""
            order.purchaseStatus = .pending
            mdebug("[StoreKit2]: purchase pending=\(order)")
            promise.resolve(result: order)
        }

        func purchaseError(_ message: String, _ promise: StorePromise<PayOrder>) {
            promise.reject(reason: Throwable(message))
        }

        do {
            let uuid = order.orderId.toUUID()!
            let appAccountToken = Product.PurchaseOption.appAccountToken(uuid)
//            let isInSandbox = Product.PurchaseOption.simulatesAskToBuyInSandbox(true)

            let result = try await product.purchase(options: [appAccountToken])
            mdebug("[StoreKit2]: purchase result=\(result)")

            switch result {
            case .success(let verification):
                let transaction = try checkVerified(verification)
                purchaseSuccess(transaction, promise)
            case .userCancelled:
                purchaseCancelled(promise)
            case .pending:
                purchasePending(promise)
            @unknown default:
                purchaseError("unknown", promise)
            }
        } catch (let error) {
            purchaseError(error.localizedDescription, promise)
        }
    }

    func consumeOrder(_ order: PayOrder) -> StorePromise<KotlinUnit> {
        let promise = StorePromise<KotlinUnit>(waitFor: nil)

        Task {
            for await result in Transaction.unfinished {
                do {
                    let transaction = try checkVerified(result)
                    let orderId = exchangeOrderId(transaction.appAccountToken)

                    if orderId != order.orderId {
                        continue
                    }

                    mdebug("[StoreKit2]: finish order:\(order.orderId), transaction=\(transaction)")
                    let result = await finish(transaction)
                  
                    mdebug("[StoreKit2]: finish order:\(order.orderId), result=\(result)")

                    if result {
                        promise.resolve(result: KotlinUnit())
                    } else {
                        promise.reject(reason: Throwable("finish error!"))
                    }
                } catch {
                    mdebug("[StoreKit2]: finish error:\(error.localizedDescription)")

                    promise.reject(reason: Throwable(error.localizedDescription))
                }
            }
        }

        return promise
    }

    @discardableResult
    func verifyTransaction(_ transaction: Transaction) -> StorePromise<VerifyStatus> {
        mdebug("[payment] verify transaction = \(transaction) transactionId = \(transaction.id)")

        let promise = StorePromise<VerifyStatus>.init(waitFor: nil)
        let orderId = exchangeOrderId(transaction.appAccountToken)
        let productId = transaction.productID
        let order = PayOrder(productId: productId, orderId: orderId)
        order.purchaseId = "\(transaction.id)"
        order.ownerType = .ios
        order.isOldOrder = true
        order.purchaseStatus = .purchased
        order.isAcknowledged = true
        if let price = transaction.price {
            order.productAmount = Double(truncating: price as NSNumber)
        }

        if #available(iOS 16.0, *) {
            if let currency = transaction.currency?.identifier {
                order.productCurrency = currency
            }
        } else {
            if let currency = transaction.currencyCode {
                order.productCurrency = currency
            }
        }

        mdebug("[StoreKit2]: verify transaction orderId= \(order.orderId), other = \(order)")
        BaseBridge.shared.verifyOrder(order: order).then { _, result in
                    promise.resolve(result: result)
                }
                .otherwise { _, throwable in
                    promise.reject(reason: throwable)
                }
        return promise
    }

}


extension StoreKit2 {

    func dealTransaction(_ transaction: Transaction) {

        func dealSuccess(_ transaction: Transaction, _ status: VerifyStatus?) {
            guard let status else {
                return
            }
            mdebug("[StoreKit2]: verifyTransaction status=\(status)")

            if transaction.productType == .autoRenewable {
                // transaction.renewalInfo.isInBillingRetryPeriod transaction.isAskToBuy wait handler
                Task {
                    let result = await finish(transaction)
                    mdebug("[StoreKit2]: autoRenewable dealSuccess finish result=\(result)")
                }
                return
            }

            if status != .couldRetry {
                Task {
                    let result = await finish(transaction)
                    mdebug("[StoreKit2]: dealSuccess finish result=\(result)")
                    if status == .success && result {
                        trackTransaction(transaction)
                    }
                }
            }
        }

        func dealFail(_ transaction: Transaction, _ throwable: Throwable) {
            mdebug("[StoreKit2]: verifyTransaction throwable=\(throwable)")
            Task {
                await finish(transaction)
            }
        }

        verifyTransaction(transaction)
                .then { (_, status) in
                    dealSuccess(transaction, status)
                }
                .otherwise { (_, throwable) in
                    mdebug("[StoreKit2]: verifyTransaction throwable=\(throwable)")
//                    finish(transaction) //历史订单不用finish，因为不确定是否已发送至服务端
                }
    }

    func handlePendingTransactions() {
        Task {
            mdebug("[StoreKit2]: handlePendingTransactions -》start")
            for await result in Transaction.unfinished {
                do {
                    let transaction = try checkVerified(result)
                    mdebug("[StoreKit2]: ReadAll pending transaction: \(transaction)")
                    runInMain { [self] in
                        dealTransaction(transaction)
                    }
                } catch {
                    mdebug("[StoreKit2]: Failed to verify transaction: \(error.localizedDescription)")
                }
            }
        }
    }

    func exchangeOrderId(_ appAccountToken: UUID?) -> String {
        if let uuidString = appAccountToken?.uuidString {
            let uuid = uuidString.replacingOccurrences(of: "-", with: "")
            var orderId = ""
            if let index = uuid.firstIndex(of: "A") {
                orderId = uuid.substring(from: uuid.index(after: index))
            }
            return orderId
        }
        return ""
    }

    func finish(_ transaction: Transaction) async -> Bool {
        do {
            try await transaction.finish()
            return true
        } catch {
            mdebug("[StoreKit2]: Failed to finish transaction: \(error.localizedDescription)")
            return false
        }
    }

    func trackTransaction(_ transaction: Transaction) {
        let orderId = exchangeOrderId(transaction.appAccountToken)
        let productId = transaction.productID
        if let productAmount = transaction.price {
            var currency = ""
            if #available(iOS 16.0, *) {
                currency = transaction.currency?.identifier ?? ""
            } else {
                currency = transaction.currencyCode ?? ""
            }

            if currency.isEmpty {
                return
            }

            let price = Double(truncating: productAmount as NSNumber)
            BaseBridge.shared.logRevenue(price, currency, orderId, productId)
        }
    }
}

//
//  Created on 2024/6/17.
//

import Foundation

import StoreKit
import MBProgressHUD

extension PayOrder {

    func append(_ transaction: SKPaymentTransaction) {
        guard let appStoreReceiptURL = Bundle.main.appStoreReceiptURL,
              let transactionId = transaction.transactionIdentifier
        else {
            merror("[payment]: current order is issue")
            purchaseStatus = .failed
            return
        }

        if FileManager.default.fileExists(atPath: appStoreReceiptURL.path) {
            do {
                let receiptData = try Data(contentsOf: appStoreReceiptURL, options: .alwaysMapped)
                purchaseToken = receiptData.base64EncodedString(options: [])
                purchaseId = transactionId
                purchaseStatus = .purchased
                isAcknowledged = true
            } catch {
                purchaseStatus = .failed
                merror("[payment]: Couldn't read receipt data with error: \(error.localizedDescription)")
            }
        }
    }

    func append(_ product: SKProduct) {
        ownerType = .ios
        productAmount = product.price.doubleValue
        productCurrency = product.priceLocale.currencyCode!
        productDescription = product.localizedDescription
//        localCountryCode = product.priceLocale.regionCode!
    }
}


class PaymentManager: NSObject {

    public static let manager: PaymentManager = {
        let instance = PaymentManager()
        return instance
    }()

    var currentOrder: PayOrder?
    var purchasePromise: Promise<PurchaseResult>?

    var productsRequest: ProductsRequest?
    var skProduct: SKProduct?
    var observer = TransactionObserve.shared
    var isPaying = false

    var canPurchase: Bool {
        SKPaymentQueue.canMakePayments() && !isPaying
    }

    var loading: MBProgressHUD?

    func startListen() {
        mdebug("[payment]: startListen")
        SKPaymentQueue.default().add(observer)
        dealPurchasedOrders()
    }

    func dealPurchasedOrders() {
        if let gameRole = BaseBridge.shared.currentGameRole, gameRole.roleId.isNotEmpty, gameRole.serverId.isNotEmpty {
            let transactions = SKPaymentQueue.default().transactions
            transactions.forEach { (transaction) in
                switch transaction.transactionState {
                case .purchased:
                    observer.verifyTransaction(transaction).then { [self](rejectable, result) in
                        observer.finishTransaction(transaction)
                    }
                    break
                case .failed:
                    observer.finishTransaction(transaction)
                    break
                default:
                    break
                }
            }
        }
    }

    // 查询历史订单
    func checkProduct(_ productId: String) -> PromiseInterface<PurchaseResult> {
        let promise = Promise<PurchaseResult>(waitFor: nil)
        let transactions = SKPaymentQueue.default().transactions

        func doneVerify(_ transaction: SKPaymentTransaction, _ status: VerifyStatus?, _ promise: PromiseInterface<PurchaseResult>) {
            observer.finishTransaction(transaction)
            let result = PurchaseResult.init(orderId: "")
            promise.resolve(result: result)
        }

        if let transaction = transactions.first(where: {
            $0.transactionState == .purchased && $0.transactionIdentifier == productId
        }) {
            observer.verifyTransaction(transaction)
                    .then { (rejectable, status) in
                        doneVerify(transaction, status, promise)
                    }
                    .otherwise { interface, throwable in
                        promise.reject(reason: throwable)
                    }
        } else {
            let result = PurchaseResult.init(orderId: "")
            promise.resolve(result: result)
        }

        return promise
    }


    @discardableResult
    func prepare(_ productId: String) -> PromiseInterface<KotlinUnit> {
        purchasePromise = Promise<PurchaseResult>(waitFor: nil)

        let promise = Promise<KotlinUnit>.init(waitFor: nil)
        isPaying = true
        if loading == nil {
            loading = Loading.showOverlay()
        }

        checkProduct(productId)
                .then { rejectable, result in
                    promise.resolve(result: KotlinUnit())
                }
                .otherwise { interface, throwable in
                    promise.reject(reason: throwable)
                }
        return promise
    }

    func fetchProducts(_ productIds: Set<String>) -> PromiseInterface<NSArray> {
        func doneRequest(_ response: ProductsResponse?, _ promise: PromiseInterface<NSArray>) {
            if let response {
                let products = response.products
                promise.resolve(result: products as NSArray)
            }
        }

        let promise = Promise<NSArray>(waitFor: nil)
        productsRequest = ProductsRequest()
        productsRequest?.fetch(productIds)
                .then { rejectable, response in
                    doneRequest(response, promise)
                }
                .otherwise { (interface, throwable) in
                    promise.reject(reason: throwable)
                }
                .eventually { [self] in
                    productsRequest = nil
                }

        return promise
    }

    func fillOrder(_ order: PayOrder) -> PromiseInterface<PayOrder> {
        currentOrder = order

        func doneRequest(_ response: ProductsResponse?, _ promise: PromiseInterface<PayOrder>) {
            if let response {
                let products = response.products
                if let product = products.first(where: { $0.productIdentifier == order.productId }) {
                    skProduct = product
                    currentOrder?.append(product)
                    promise.resolve(result: currentOrder)
                } else {
                    promise.reject(reason: Throwable("fetch products error!"))
                }
            }
        }

        let promise = Promise<PayOrder>(waitFor: nil)
        productsRequest = ProductsRequest()
        productsRequest?.fetch([order.productId])
                .then { rejectable, response in
                    doneRequest(response, promise)
                }
                .otherwise { (interface, throwable) in
                    promise.reject(reason: throwable)
                }
                .eventually { [self] in
                    productsRequest = nil
                }
        return promise
    }

    func start(_ order: PayOrder) -> PromiseInterface<PayOrder> {
        currentOrder = order
        let promise = Promise<PayOrder>(waitFor: nil)

        guard order.orderId.isNotEmpty else {
            promise.reject(reason: Throwable("order error!"))
            return promise
        }

        if let skProduct {
            listenProduct(skProduct, order.orderId, promise)
        } else {
            promise.reject(reason: Throwable("fetch products error!"))
        }
        return promise
    }

    private func listenProduct(_ product: SKProduct, _ orderId: String, _ promise: PromiseInterface<PayOrder>) {
        func doneObserver(_ transaction: SKPaymentTransaction?) {
            if let transaction, transaction.transactionState == .purchased {
                currentOrder?.append(transaction)
                if currentOrder!.purchaseStatus != .purchased {
                    promise.reject(reason: Throwable("pay fail"))
                } else {
                    promise.resolve(result: currentOrder)
                }
            } else {
                promise.reject(reason: Throwable("pay fail"))
            }
        }

        observer.add(product, orderId)
                .then { (rejectable, transaction) in
                    doneObserver(transaction)
                }
                .otherwise { (_, throwable) in
                    promise.reject(reason: throwable)
                }
    }

    func acknowledgeOrder(_ order: PayOrder) -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>(waitFor: nil)
        promise.resolve(result: KotlinUnit())
        return promise
    }

    func consumeOrder(_ order: PayOrder) -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>(waitFor: nil)
        let transactions = SKPaymentQueue.default().transactions
        transactions.reversed().forEach { transaction in
            if (transaction.payment.productIdentifier == order.productId)
                       && (transaction.transactionState != .purchasing) {
                observer.finishTransaction(transaction)
            }
        }
        promise.resolve(result: KotlinUnit())
        return promise
    }

    func finish() {
        observer.cancel()
        isPaying = false
        currentOrder = nil
        productsRequest = nil
        skProduct = nil
        purchasePromise = nil
        if loading != nil {
            loading?.hide()
            loading = nil
        }
    }
}


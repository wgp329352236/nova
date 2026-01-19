//
//  Created on 2024/6/19.
//

import Foundation
import StoreKit

/// Observer
class TransactionObserve: NSObject, SKPaymentTransactionObserver {

    public static let shared: TransactionObserve = {
        let instance = TransactionObserve()
        return instance
    }()

    var promise: PromiseInterface<SKPaymentTransaction>?

    private func resetObserve() {
        if promise != nil {
            promise = nil
        }
    }

    func add(_ product: SKProduct, _ orderId: String) -> PromiseInterface<SKPaymentTransaction> {
        resetObserve()
        promise = Promise<SKPaymentTransaction>(waitFor: nil)
        let payment = SKMutablePayment(product: product)
        payment.applicationUsername = orderId.toUUID()!.uuidString
//        payment.simulatesAskToBuyInSandbox = true
        SKPaymentQueue.default().add(payment)
        return promise!
    }

    @available(iOS 11.0, *)
    public func paymentQueue(_ queue: SKPaymentQueue, shouldAddStorePayment payment: SKPayment, for product: SKProduct) -> Bool {
        false
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                purchasing(transaction)
                break

            case .purchased:
                purchased(transaction)
                break

            case .failed:
                failed(transaction)
                break

            case .deferred:
                deferred(transaction)
                break

            case .restored:
                restored(transaction)
                break

            default:
                break
            }
        }
    }

    private func purchasing(_ transaction: SKPaymentTransaction) {
        mdebug("[payment] purchasing state = \(transaction.transactionState.rawValue) transactionId = \(transaction.transactionIdentifier ?? "")")
    }

    private func purchased(_ transaction: SKPaymentTransaction) {
        mdebug("[payment] purchased state = \(transaction.transactionState.rawValue) transactionId = \(transaction.transactionIdentifier ?? "")")
        dealTransaction(transaction)
    }

    private func failed(_ transaction: SKPaymentTransaction) {
        mdebug("[payment] failed state = \(transaction.transactionState.rawValue) transactionId = \(transaction.transactionIdentifier ?? "")")
        dealTransaction(transaction)
    }

    private func deferred(_ transaction: SKPaymentTransaction) {
        mdebug("[payment] deferred state = \(transaction.transactionState.rawValue) transactionId = \(transaction.transactionIdentifier ?? "")")
        dealTransaction(transaction)
    }

    private func restored(_ transaction: SKPaymentTransaction) {
        mdebug("[payment] restored state = \(transaction.transactionState.rawValue) transactionId = \(transaction.transactionIdentifier ?? "")")
    }

    func dealTransaction(_ transaction: SKPaymentTransaction) {
        if let dealPromise = promise {
            // todo: user send observer
            if transaction.transactionState == .purchased {
                if dealPromise.state == .pending {
                    dealPromise.resolve(result: transaction)
                }
            } else {
                if dealPromise.state == .pending {
                    let reason = Throwable(transaction.error?.localizedDescription)
                    dealPromise.reject(reason: reason)
                }
                finishTransaction(transaction)
            }
        } else {
            // todo: get transaction from service
            verifyTransaction(transaction).then { [self](rejectable, result) in
                finishTransaction(transaction)
            }
        }
    }

    // should delete local transaction
    func finishTransaction(_ transaction: SKPaymentTransaction) {
        mdebug("[payment] finish state = \(transaction.transactionState.rawValue) transactionId = \(transaction.transactionIdentifier ?? "")")
        if (transaction.transactionState != .purchasing) {
            SKPaymentQueue.default().finishTransaction(transaction)
        }
    }

    func cancel() {
        if promise != nil {
            promise = nil
        }
    }

    @discardableResult
    func verifyTransaction(_ transaction: SKPaymentTransaction) -> PromiseInterface<VerifyStatus> {
        mdebug("[payment] verify state = \(transaction.transactionState.rawValue) transactionId = \(transaction.transactionIdentifier ?? "")")
        let promise = Promise<VerifyStatus>.init(waitFor: nil)
        let orderId = transaction.payment.applicationUsername
        let productId = transaction.payment.productIdentifier
        let order = PayOrder(productId: productId, orderId: orderId ?? "")
        order.ownerType = .ios
        order.append(transaction)
        BaseBridge.shared.verifyOrder(order: order).takeDelegation(other: promise)
        return promise
    }

}


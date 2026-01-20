//
//  Created on 2024/6/17.
//

import Foundation
import StoreKit

class PaymentHandler: PaymentHandlerInterface {

    // MARK: Loading
    func onProcessEvent(event: PaymentEvent, order: PayOrder) {
    }

    func fillProductInfo(order: PayOrder) -> PromiseInterface<PayOrder> {
        if #available(iOS 15.0, *) {
            return StoreKit2.shared.fillOrder(order).raw
        } else {
            return PaymentManager.manager.fillOrder(order)
        }
    }

    //
    func startPurchase(order: PayOrder) -> PromiseInterface<PayOrder> {
        if #available(iOS 15.0, *) {
            return StoreKit2.shared.start(order).raw
        } else {
            return PaymentManager.manager.start(order)
        }
    }

    func acknowledgeOrder(order: PayOrder) -> PromiseInterface<KotlinUnit> {
        if #available(iOS 15.0, *) {
            return UnitPromise.resolve()
        } else {
            return PaymentManager.manager.acknowledgeOrder(order)
        }
    }

    func consumeOrder(order: PayOrder) -> PromiseInterface<KotlinUnit> {
        if #available(iOS 15.0, *) {
            return StoreKit2.shared.consumeOrder(order).raw
        } else {
            return PaymentManager.manager.consumeOrder(order)
        }
    }

    func promoteUserInteraction(reason: KotlinThrowable, order: PayOrder) -> PromiseInterface<KotlinUnit> {
        switch reason {
        case is VerifyOrderFailReason: return promptTryAgain(LocalizedString("verification_failed", "Order verification failed. Please try again"))
        case is CheckDeliveryResultFailReason: return promptTryAgain(LocalizedString("order_status_error", "Failed to obtain order status, please try again."))
//        case is UnknownReason: return promptOther()
        default:
            break
        }
        return UnitPromise.resolve()
    }

    func promptToast(type: PaymentProcessToastType, order: PayOrder) {
        if type == PaymentProcessToastType.consumeSuccessContinue {
            Toast(LocalizedString("order_notice_paid", "You\'ve got an order that\'s been paid for successfully and is being worked on for you."))
        }
    }

    func finishPurchase() {
        if #available(iOS 15.0, *) {
            StoreKit2.shared.finishPurchase()
        }
    }

    func getAppProductInfo(productIdList: [String]) -> PromiseInterface<NSArray> {
        var productIds: Set<String> = []
        productIdList.forEach { productId in
            productIds.insert(productId)
        }
        return PaymentManager.manager.fetchProducts(productIds)
    }

    func promptDialog(_ message: String) -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>(waitFor: nil)
        BaseUI.alert(message, done: LocalizedString("close", "Close")) { (index) in
            promise.resolve(result: KotlinUnit())
        }
        return promise
    }

    func promptTryAgain(_ message: String) -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>(waitFor: nil)
        BaseUI.alert(message,
                done: LocalizedString("try_again", "Try Again"),
                cancel: LocalizedString("close", "Close")) { (index) in
            if index > 0 {
                promise.resolve(result: KotlinUnit())
            } else {
                promise.reject(reason: Throwable.UserCancel)
            }
        }
        return promise
    }


    func promptOther() -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>(waitFor: nil)
        let done: String? = BaseBridge.shared.remoteGameConfig!.supportAllowed ? LocalizedString("contact_service", "Contact Customer Service") : nil
        BaseAlert.show(LocalizedString("pay_order_error", "An error is preventing the purchase of items."),
                done,
                LocalizedString("close", "Close")) { index in
            if index >= 1 {
                // todo: show custom
                BaseBridge.shared.showCustomerService().takeDelegation(other: promise)
            } else {
                promise.reject(reason: Throwable(""))
            }
        }
        return promise
    }

}

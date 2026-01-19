//
//  Created on 2024/6/16.
//

import Foundation
import SafariServices

public class BaseEngine: EngineInterface {

    public var toolFunctions: ToolFunctionInterface = ToolFunction()
    public var paymentHandler: PaymentHandlerInterface = PaymentHandler()
    public var packageSettings: ReadonlyKVStorage = IOSReadonlyKVStorage()
    public var persistentStorage: MutableKVStorage = PersistentMutableKVStorage()
    public var sessionStorage: MutableKVStorage = SessionMutableKVStorage()
    public var eventLogStorage: MutableKVStorage = EventLogMutableKVStorage()
    public var paymentOrderStorage: MutableKVStorage = PaymentOrderMutableKVStorage()

    public func getHttpEngine() -> RestfulHttpEngine {
        IOSRestfulHttpEngine.shared
    }

    public func getDnsClient() -> DnsClientEngine {
        return DnsClient.shared
    }

    public func getTimer() -> TimerEngine {
        IOSTimerEngine.shared
    }
    
    public func showLoginHistory(loginHistories: KotlinArray<LoginHistory>) -> PromiseInterface<Player> {
        let promise = Promise<Player>.init(waitFor: nil)
        if let infos = loginHistories.asArray() as? [LoginHistory] {
            BaseBridge.shared.showLoginHistoryView(infos).takeDelegation(other: promise)
        } else {
            promise.reject(reason: Throwable("loginHistories is nil"))
        }
        return promise
    }

    public func showLoginView() -> PromiseInterface<Player> {
        mdebug("BaseEngine -> showLoginView")

        return BaseBridge.shared.showLoginView()
    }

    public func showQuickLoginView() -> PromiseInterface<Player> {
//        return BaseBridge.shared.showQuickLoginView()
        PromiseInterface<Player>.init(waitFor: nil)
    }

    public func showDMAView() -> PromiseInterface<KotlinInt> {
        ThirdPartyFactory.shared.showMDAView()
    }


    // MARK: track
    public func trackLogin(params: [String: Any]?) {
        TrackingManager.manager.trackLogin(params)
    }

    public func trackUserSet(gameRole: GameRole) {
        TrackingManager.manager.trackGameRole(gameRole)
    }

    public func trackUserSet(params: [String: Any]?) {
        if let params {
            TrackingManager.manager.userSet(params)
        }
    }

    public func trackUserSetOnce(params: [String: Any]?) {
        if let params {
            TrackingManager.manager.userSetOnce(params)
        }
    }

    public func trackFirstEvent(name: String, firstCheckId: String, params: [String: Any]?) {
        TrackingManager.manager.trackFirstEvent(name, firstCheckId, params)
    }

    public func firebaseLogEvent(name: String, params: [String: Any]?) {
        TrackingManager.manager.trackEvent(.firebase, name, params)
    }

    public func firebaseLogRevenue(price: Double, currency: String, orderId: String) {
        TrackingManager.manager.trackRevenue(.firebase, "", price, currency, orderId)
    }

    public func facebookLogEvent(name: String, params: [String: Any]?) {
        TrackingManager.manager.trackEvent(.facebook, name, params)
    }

    public func facebookLogRevenue(price: Double, currency: String, orderId: String) {
        TrackingManager.manager.trackRevenue(.facebook, "", price, currency, orderId)
    }

    public func facebookLogAdRevenue(price: Double, currency: String) {
        TrackingManager.manager.trackAdRevenue(price, currency)
    }

    public func tdLogEvent(name: String, params: [String: Any]?) {
        TrackingManager.manager.trackEvent(.td, name, params)
    }

    public func trackUserAdd(params: [String: Any]) {
        TrackingManager.manager.trackUserAdd(params)
    }

    public func adjustLogEvent(eventToken: String, params: [String: Any]?) {
        TrackingManager.manager.trackEvent(.adjust, eventToken, params)
    }

    public func adjustLogRevenue(eventToken: String, price: Double, currency: String, orderId: String) {
        TrackingManager.manager.trackRevenue(.adjust, eventToken, price, currency, orderId)
    }
    
    public func adjustLogAdRevenue(mediationName: String, price: Double, currency: String, networkName: String, networkPlacement: String, unitId: String, customerDataStr: String) {
        TrackingManager.manager.trackAdRevenue(mediationName, networkName, networkPlacement, unitId, price, currency, customerDataStr)
    }

    public func tiktokLogEvent(name: String, params: [String: Any]?) {
        TrackingManager.manager.trackEvent(.tiktok, name, params)
    }

    public func tiktokLogRevenue(name: String, price: Double, currency: String, orderId: String) {
        TrackingManager.manager.trackRevenue(.tiktok, name, price, currency, orderId)
    }

    public func promptPlayerTokenExpired() -> PromiseInterface<KotlinUnit> {
        expiredAlert()
    }

    public func isEnterBack() -> Bool {
        return !BaseBridge.shared.isActive
    }

    public func promptNetworkError() {
        Toast(LocalizedString("reason_network_error", "Network Anomaly"))
    }

    public func promptDeviceBlock(expToken: String) -> PromiseInterface<KotlinUnit> {
        blockAlert(expToken, LocalizedString("blocked_login_detail_device", "Your device has been blocked due to prohibited operations!"))
    }

    public func promptPlayerBlock(expToken: String) -> PromiseInterface<KotlinUnit> {
        blockAlert(expToken, LocalizedString("blocked_login_detail_account", "Your account has been blocked due to prohibited operations!"), shouldExit: false)
    }

    public func promptIPBlock(expToken: String) -> PromiseInterface<KotlinUnit> {
        blockAlert(expToken, LocalizedString("blocked_login_detail_ip", "The IP you are using has been banned！"))
    }

    public func showConfirmAgreementView() -> PromiseInterface<KotlinUnit> {
//        return BaseBridge.shared.showConfirmAgreementView()
        return PromiseInterface<KotlinUnit>.init(waitFor: nil)
    }

    public func showConnectNoticeView() -> PromiseInterface<KotlinUnit> {
//        BaseBridge.shared.showNoticeConnectView()
        return PromiseInterface<KotlinUnit>.init(waitFor: nil)
    }

    public func promptIDFA() -> PromiseInterface<KotlinUnit> {
//        IDFAControl.shared.requestIDFA()
        return PromiseInterface<KotlinUnit>.init(waitFor: nil)
    }

    public func promptAccountDeletion(deregister: Deregister) -> PromiseInterface<KotlinUnit> {
//        let deletion = DeletionViewController(deregister)
//        BaseBridge.shared.presentModelView(deletion, false)
//        return deletion.viewPromise
        return PromiseInterface<KotlinUnit>.init(waitFor: nil)
    }

    public func promptFrozen(tipsInfo: TipsInfo) -> PromiseInterface<KotlinUnit> {
        return frozenAlert(tipsInfo)
    }


    public func promptTp(content: String, type: BrowserType) {
        mdebug("BaseEngine -> promptTp:\(content)")
        switch type {
        case .browser:
            BaseBridge.shared.showSafari(content)
        case .customer:
            BaseBridge.shared.showWebPay(content)
        default: break
        }
    }

    public func didShowAdCustomer(adParams: AdParams, customerData: String) -> PromiseInterface<AdResult> {
        if adParams.type == .rewarded {
            return ThirdPartyFactory.shared.showRewardedAd(adParams, customerData)
        } else {
            return ThirdPartyFactory.shared.showAppOpenAd(adParams, customerData)
        }
    }

    public func promptRealName(player: Player, type: RegionalAgent, contentUrl: String) -> PromiseInterface<KotlinUnit> {
        mdebug("BaseEngine -> promptRealName:\(player): contentUrl:\(contentUrl)")
        return BaseBridge.shared.showRealName(contentUrl)
    }

}

extension BaseEngine {
    private func blockAlert(_ expToken: String,
                            _ message: String,
                            _ done: String = LocalizedString("contact_service", "Contact Customer Service"),
                            _ cancel: String = LocalizedString("cancel", "Cancel"),
                            shouldExit: Bool = true) -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>(waitFor: nil)
        BaseAlert.show(message, done, cancel) { index in
            if index >= 1 {
                // show customer after alert dismiss
                BaseBridge.shared.showCustomerService().takeDelegation(other: promise)
            } else {
                promise.reject(reason: Throwable.UserCancel)
                if shouldExit {
                    exit(0)
                }
            }
        }
        return promise
    }


    private func exitAlert(message: String, promise: PromiseInterface<KotlinUnit>) {
        let shouldExit = (BaseBridge.shared.player != nil)
        let done = shouldExit ? LocalizedString("exit", "Exit") : LocalizedString("ok", "OK")
        BaseUI.alert(message, done: done) { (index) in
            promise.resolve(result: KotlinUnit())
            if shouldExit {
                exit(0)
            }
        }
    }

    func expiredAlert() -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>(waitFor: nil)
        BaseAlert.show(LocalizedString("prompt_playertoken_invalid", "Login expired, please login again!"),
                LocalizedString("login_now", "Login now"),
                LocalizedString("cancel", "Cancel")) { index in
            if index > 0 {
                promise.resolve(result: KotlinUnit())
            } else {
                promise.reject(reason: Throwable.UserCancel)
            }
        }
        return promise
    }

    func frozenAlert(_ tipsInfo: TipsInfo) -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>(waitFor: nil)

        func warning(_ message: String) {
            BaseAlert.show(message, cancel: cancel) { (index: NSInteger) in
                promise.resolve(result: KotlinUnit())
            }
        }

        func frozen(_ message: String) {
            let done = LocalizedString("frozen_button_text", "Repay now")
            BaseAlert.show(message, done, cancel) { (index: NSInteger) in
                if index > 0 {
                    if tipsInfo.link.isNotEmpty {
                        BaseBridge.shared.showSafari(tipsInfo.link)
                                .eventually {
                                    promise.reject(reason: Throwable("Player is frozen"))
                                }
                    } else {
                        promise.reject(reason: Throwable("Player is frozen"))
                    }
                } else {
                    promise.reject(reason: Throwable("Player is frozen"))
                }
            }
        }

        var message = ""
        if tipsInfo.status == TipsStatus.warning {
            message = LocalizedString("unfrozen_content", "Your account has recently issued refunds. This is an official warning.\\nRefunds: 2 \\nTotal amount: $29.99 \\nFurther refunds will result in account suspension.")
        } else {
            message = LocalizedString("frozen_content", "Your account has been suspended due to recent refunds. \\nRefunds: 2 \\nTotal amount: $29.99 \\nIt will be automatically reinstated within 1-2 business days after repayment.")
        }
        message = message.replacingOccurrences(of: "$count", with: "\(tipsInfo.count)")
        message = message.replacingOccurrences(of: "$amount", with: "\(tipsInfo.showSum)")

        let cancel = LocalizedString("unfrozen_button_text", "I got it")

        if tipsInfo.status == TipsStatus.warning {
            warning(message)
        } else {
            frozen(message)
        }

        return promise
    }
}


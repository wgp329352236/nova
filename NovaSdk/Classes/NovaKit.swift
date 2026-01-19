//
//  NovaKit.swift
//  NovaSDK
//
//

import UIKit
import Foundation

public class NovaKit: NSObject {

    @objc(sharedInstance)
    public static let shared: NovaKit = {
        let instance = NovaKit()
        return instance
    }()

    @discardableResult
    @objc
    public func initialize(isDebug: Bool, language: Language) -> InitPromise {
        MMKV.initialize(rootDir: nil, logLevel: .error)
        return InitPromise(
                BaseBridge.shared.doInit(isDebug, language)
        )
    }

//    @objc public func checkPermission(_ permission: String, _ showLeadPage: Bool) -> PermissionPromise {
//        return PermissionPromise(
//                PermissionManager.shared.checkPermission(permission, showLeadPage)
//        )
//    }

//    @objc public var releaseInfo: SdkReleaseInfo {
//        SdkReleaseInfo()
//    }

    @objc public var sharingData: SharingData {
        BaseBridge.shared.sharingData
    }

    @objc public func getSharingData() -> SharingData {
        sharingData
    }

//    @objc public var channelInfo: SdkChannelInfo {
//         return SdkChannelInfo()
//    }

    @objc public var currentPlayer: GamePlayer? {
        BaseBridge.shared.player?.reveal
    }

    @objc public var currentGameRole: GameRole? {
        BaseBridge.shared.currentGameRole
    }

    @objc public var clientInfo: ClientInfo? {
        BaseBridge.shared.clientInfo
    }

    @objc public var currentLanguage: Language {
        get {
            BaseBridge.shared.currentLanguage
        }
        set {
            BaseBridge.shared.changeLanguage(newValue)
        }
    }

    @objc public func showAgreement(_ type: AgreementType) {
        BaseBridge.shared.showAgreement(type)
    }

    // set only
    @objc public func setRoleInfo(roleId: String,
                                  roleName: String,
                                  serverId: String,
                                  serverName: String,
                                  serverType: ServerType,
                                  level: Int,
                                  vipLevel: Int,
                                  coins: Int,
                                  isFirstLogin: Bool) {
        BaseBridge.shared.setGameRole(roleId, roleName, serverId, serverName, serverType, level, vipLevel, coins, isFirstLogin)
    }

//    @discardableResult
//    @objc public func fetchGameRoleList() -> GameRoleListPromise {
//        return GameRoleListPromise(BaseBridge.shared.fetchGameRoleList())
//    }

    @objc public func changeLanguage(_ language: Language) {
        BaseBridge.shared.changeLanguage(language)
    }

    private func showMessage(_ promise: PromiseInterface<Player>, _ player: Player?) {
        ThirdPartyFactory.shared.loadAds()
        if let player {
            let model = LoginSuccessModel()
            model.promise.eventually {
                promise.resolve(result: player)
            }
            BaseBridge.shared.presentModelView(model, false)
        } else {
            promise.resolve(result: player)
        }
    }

    @discardableResult
    @objc public func login() -> PlayerPromise {
        let promise = Promise<Player>.init(waitFor: nil)
        BaseBridge.shared.login()
                .then { [self](_, player) in
                    showMessage(promise, player)
                }
                .otherwise { interface, throwable in
                    promise.reject(reason: throwable)
                }
        return PlayerPromise(promise)
    }

    @objc public var backgroundEvents: BackgroundEvents {
        get {
            BaseBridge.shared.backgroundEvents
        }
    }

    // MARK: ShowView
    @discardableResult
    @objc public func switchAccount() -> PlayerPromise {
        let promise = Promise<Player>.init(waitFor: nil)
        BaseBridge.shared.switchAccount()
                .then { [self](_, player) in
                    showMessage(promise, player)
                }
                .otherwise { interface, throwable in
                    promise.reject(reason: throwable)
                }
        return PlayerPromise(promise)
    }


    // MARK: Connect
    @discardableResult
    @objc public func connectAccount(platform: ConnectPlatform) -> PlayerPromise {
        PlayerPromise(
                BaseBridge.shared.connectAccount(platform)
        )
    }

    // MARK: -
    @objc public func showCustomerService() {
        BaseBridge.shared.showCustomerService()
    }

    @discardableResult
    @objc public func showUserCenter() -> UnitPromise {
        UnitPromise(
                BaseBridge.shared.showUserCenter()
        )
    }

    @discardableResult
    @objc public func showWebView(url: String) -> UnitPromise {
        UnitPromise(
                BaseBridge.shared.showWebView(url)
        )
    }


    @objc
    public func showOfficial() {
        BaseBridge.shared.showOfficial()
    }

    @objc
    public func showOfficialRecharge() {
        BaseBridge.shared.showOfficialRecharge()
    }

    @discardableResult
    @objc public func showWebPay(url: String) -> UnitPromise {
        UnitPromise(
                BaseBridge.shared.showWebPay(url)
        )
    }

    @objc
    public func showRewardedAd(adUnitName: String, placement: String, extensionParam: String) -> AdPromise {
        AdPromise(
                BaseBridge.shared.showRewardedAd(adUnitName, placement, extensionParam)
        )
    }

    @objc
    public func showAppOpenAd(adUnitName: String, placement: String) -> AdPromise {
        AdPromise(
                BaseBridge.shared.showAppOpenAd(adUnitName, placement)
        )
    }

    @objc
    public func openAgeLimitView(initialPoint: CGPoint) {
        runInMain {
            BaseBridge.shared.openAgeLimitView(initialPoint)
        }
    }

    @objc
    public func closeAgeLimitView() {
        runInMain {
            BaseBridge.shared.closeAgeLimitView()
        }
    }

    @objc
    public func deregisterAccount() {
        BaseBridge.shared.deregisterAccount()
    }

    // MARK: PAY
    @discardableResult
    @objc public func fetchProductCatalog(productIds: Set<String>) -> ProductPromise {
        ProductPromise(
                BaseBridge.shared.fetchProducts(productIds)
        )
    }

    // MARK: PAY
    @discardableResult
    @objc public func fetchStoreInfo() -> StoreInfoPromise {
        StoreInfoPromise(
                BaseBridge.shared.fetchStoreInfo()
        )
    }

//    @discardableResult
//    @objc public func getPaymentPackages() -> PackageSetPromise {
//        PackageSetPromise(
//                BaseBridge.shared.getPaymentPackages()
//        )
//    }
//
    @discardableResult
    @objc public func purchase(productId: String, extensionParam: String?) -> PurchasePromise {
        PurchasePromise(
                BaseBridge.shared.purchase(productId, extensionParam, PurchaseEvent.delivered)
        )
    }

    // MARK: Social
    @available(*, deprecated, message: "Use share(shareContents: [ShareContent]) instead")
    @objc public func share(shareContents: [ShareContent]) -> SharePromise {
        let sharePromise = Promise<ShareResult>(waitFor: nil)
        if let shareContent = shareContents.first {
            BaseBridge.shared.share(shareContent).takeDelegation(other: sharePromise)
        } else {
            sharePromise.reject(reason: Throwable("ShareContent is empty"))
        }
        return SharePromise(sharePromise)
    }

    @discardableResult
    @objc public func share(shareContent: ShareContent) -> SharePromise {
        SharePromise(
                BaseBridge.shared.share(shareContent)
        )
    }

    // MARK: - TRACK
    @objc public func userSet(params: [String: Any]) {
        TrackingManager.manager.userSet(params)
    }

    @objc public func userSetOnce(params: [String: Any]) {
        TrackingManager.manager.userSetOnce(params)
    }

    @objc public func logEvent(name: String, params: [String: Any]?, consumer: Int32) {
//        let maps = params?.mapValues { value in
//            if value is String || value is Int || value is Double || value is Float || value is Bool {
//                return value
//            }
//            return String(describing: value)
//        }
        BaseBridge.shared.logEvent(name, params, consumer)
    }
}

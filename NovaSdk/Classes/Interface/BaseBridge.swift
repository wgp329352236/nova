//
//  Created on 2024/6/16.
//

import Foundation
import UIKit
import SafariServices
import MessageUI

class BaseBridge: NSObject {

    public static let shared: BaseBridge = {
        let instance = BaseBridge()
        return instance
    }()

    var initialized: Bool = false

    var sharingData: SharingData {
        let sharingData = TrackingManager.manager.sharingData
        sharingData.deviceId = SystemTools.deviceADID()
        return sharingData
    }

    private var _isDebug = false
    var isDebug: Bool {
        get {
            _isDebug
        }
        set {
            if baseGameKit != nil {
                baseGameKit?.isDebug = newValue
            }
            _isDebug = newValue
        }
    }

    private var baseGameKit: BaseGameKit?

    private var trackingKit: TrackingKit? {
        guard baseGameKit != nil else {
            merror("SDK hasn't initialize")
            return nil
        }
        return baseGameKit?.trackingKit
    }

    private var adEventTracking: AdEventTracking? {
        guard baseGameKit != nil else {
            merror("SDK hasn't initialize")
            return nil
        }
        return trackingKit?.adEventTracking
    }

    var clientInfo: ClientInfo? {
        baseGameKit?.clientInfo
    }

    var baseGameTheme: GameTheme? {
        baseGameKit?.gameTheme
    }

    var isActive: Bool = true

    func onEnterBack() {
        runInMain { [self] in
            if let baseGameKit = baseGameKit {
                baseGameKit.onEnterBack()
            }
        }
    }

    func onBecomeActive() {
        runInMain { [self] in
            if let baseGameKit = baseGameKit {
                baseGameKit.onBecomeActive()
            }
        }
    }

    fileprivate let notification = DefaultNotification()
    let reachability = Reachability(hostName: "www.apple.com")

    // MARK: - BaseGameKit
    lazy var backgroundEvents: BackgroundEvents = baseGameKit!.backgroundEvents

    var player: Player? {
        baseGameKit?.currentPlayer
    }

    public var remoteGameConfig: RemoteGameConfig? {
        baseGameKit?.remoteGameConfig
    }

    var currentLanguage: Language {
        baseGameKit?.currentLanguage ?? Language.english
    }

    var currentGameRole: GameRole? {
        get {
            baseGameKit?.currentGameRole
        }
        set {
            baseGameKit?.currentGameRole = newValue
        }
    }

    
    func setGameRole(_ roleId: String,
                     _ roleName: String,
                     _ serverId: String,
                     _ serverName: String,
                     _ serverType: ServerType?,
                     _ level: Int?,
                     _ vipLevel: Int?,
                     _ coins: Int?,
                     _ isFirstLogin: Bool) {
        baseGameKit?.setGameRole(roleId: roleId,
                roleName: roleName,
                serverId: serverId,
                serverName: serverName,
                serverType: serverType ?? .all,
                level: Int32(level ?? 0),
                vipLevel: Int32(vipLevel ?? 0),
                coins: Int32(coins ?? 0),
                isFirstLogin: isFirstLogin)
        if roleId.isNotEmpty && serverId.isNotEmpty {
            if #available(iOS 15.0, *) {
//                StoreKit2.shared.listenForTransactionUpdates()
            } else {
                PaymentManager.manager.dealPurchasedOrders()
            }
        }
    }

    // MARK: Action
    private func beforeInit(_ isDebug: Bool, _ language: Language) {
        if baseGameKit != nil { return }

        baseGameKit = BaseGameKit(engine: BaseEngine(), language: language)
        self.isDebug = isDebug

        ThirdPartyFactory.shared.initOthers()
        StoreKit2.shared.checkStoreInfo()
        TrackingManager.manager.initialize()
         //
        notification.startListen()
        reachability?.startListen()
    }

    private func afterInit() {

        logDevice()
    }

    var initPromise: PromiseInterface<KotlinUnit>?

    func doInit(_ isDebug: Bool, _ language: Language) -> PromiseInterface<KotlinUnit> {
        if initialized {
            return UnitPromise.resolve()
        }

        let promise = Promise<KotlinUnit>(waitFor: nil)

        func initSuccess(_ p1: PromiseInterface<KotlinUnit>) {
            initialized = true

            p1.resolve(result: KotlinUnit())
            if #available(iOS 15.0, *) {
                StoreKit2.shared.handlePendingTransactions()
            } else {
                PaymentManager.manager.startListen()
            }
        }

        func initFailed(_ throwable: KotlinThrowable, _ p1: PromiseInterface<KotlinUnit>) {
            initialized = false
            p1.reject(reason: throwable)
        }

        beforeInit(isDebug, language)

        do {
            try baseGameKit?.doInit()
                    .then { (_, _) in
                        initSuccess(promise)
                    }
                    .otherwise { (_, throwable) in
                        initFailed(throwable, promise)
                    }
                    .eventually { [self] in
                        afterInit()
                    }
        } catch {
            var message: String?
            if error is KotlinThrowable {
                let throwable = error as! KotlinThrowable
                message = throwable.message
            } else {
                message = error.localizedDescription
            }
            mdebug("[doInit]: Exception = \(message ?? "unKnow error")")
            initialized = false
            promise.reject(reason: Throwable(message))
        }
        
//        backgroundEvents.fetchConfigFinished.then { _ in
//            ThirdPartyFactory.shared.loadAds()
//        }

        return promise
    }

    func changeLanguage(_ language: Language) {
        baseGameKit?.currentLanguage = language
        TrackingManager.manager.switchLanguage(language.lang)
    }

    @discardableResult
    func login() -> PromiseInterface<Player> {
        baseLogin(false)
    }

    @discardableResult
    func switchAccount() -> PromiseInterface<Player> {
        let promise = Promise<Player>(waitFor: nil)
        if let gameRole = currentGameRole, gameRole.roleId.isNotEmpty {
            let confirmView = ConfirmSwitchViewController()
            presentModelView(confirmView)

            confirmView.promise.then { [self](_, _) in
                        baseLogin(true).takeDelegation(other: promise)
                    }
                    .otherwise { (_, throwable) in
                        promise.reject(reason: throwable)
                    }
        } else {
            baseLogin(true).takeDelegation(other: promise)
        }
        return promise
    }

    var isLogging: Bool = false

    private func baseLogin(_ isSwitchEnforced: Bool) -> PromiseInterface<Player> {
        func loginSuccess(_ promise: PromiseInterface<Player>) {
            promise.resolve(result: player)
            if !isSwitchEnforced {
                // 登录提示消失后再登录GC避免UI冲突
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    ThirdPartyFactory.shared.authorize(.gameCenter)
                }
            }
        }

        let loginPromise = Promise<Player>(waitFor: nil)
        if (isLogging && !isSwitchEnforced) {
            loginPromise.reject(reason: Throwable("User is logging"))
            return loginPromise
        }
        isLogging = true
        var loadingOverlay: MBProgressHUD?
        if !isSwitchEnforced {
            loadingOverlay = Loading.showOverlay()
        }

        do {
            try baseGameKit?.login(isSwitchEnforced: isSwitchEnforced)
                    .then { _, player in
                        loginSuccess(loginPromise)
                    }
                    .otherwise { _, throwable in
                        loginPromise.reject(reason: throwable)
                    }
                    .eventually { [self] in
                        isLogging = false
                        if loadingOverlay != nil {
                            loadingOverlay!.hide()
                        }
                    }
        } catch {
            isLogging = false
            if loadingOverlay != nil {
                loadingOverlay!.hide()
            }
            loginPromise.reject(reason: Throwable("Login Error"))
        }

        return loginPromise
    }

    func thirdpartyLogin(_ platform: Platform) -> PromiseInterface<Player> {
        func authSuccess(_ platform: Platform, _ credentials: PlatformCredentials?, _ promise: PromiseInterface<Player>) {
            if let credentials {
                login(platform, credentials).takeDelegation(other: promise)
            }
        }

        let promise = Promise<Player>(waitFor: nil)
        ThirdPartyFactory.shared.authorize(platform)
                .then { _, credentials in
                    authSuccess(platform, credentials, promise)
                }
                .otherwise { _, throwable in
                    promise.reject(reason: throwable)
                }
        return promise
    }

    func login(_ platform: Platform, _ credentials: PlatformCredentials) -> PromiseInterface<Player> {
        let promise = Promise<Player>(waitFor: nil)
        let loadingOverlay: MBProgressHUD = Loading.showOverlay()

        do {
            try baseGameKit?.loginForPlatform(platform: platform, credentials: credentials, thirdUuid: "")
                    .then { rejectable, player in
                        promise.resolve(result: player)
                    }
                    .otherwise { interface, throwable in
                        promise.reject(reason: throwable)
                    }
                    .eventually {
                        loadingOverlay.hide()
                    }
        } catch {
            loadingOverlay.hide()
            promise.reject(reason: Throwable("Login Error"))
        }

        return promise
    }

    @discardableResult
    func sendVerificationCode(_ email: String = "",
                              _ phone: String = "",
                              _ codeType: VerificationCodeType) -> PromiseInterface<KotlinBoolean> {
        let promise = Promise<KotlinBoolean>(waitFor: nil)
        do {
            try baseGameKit?.sendVerificationCode(email: email, phone: phone, codeType: codeType)
        } catch {
            promise.reject(reason: Throwable("fetchHistoryAccounts Error"))
        }
        return promise
    }

//    func revokeDeregister() -> PromiseInterface<AnyObject> {
//        do {
//            return try baseGameKit!.revokeAccountDeletion()
//        } catch {
//            return Promise.Companion().rejectedPromise(reason: Throwable(error.localizedDescription))
//        }
//    }

    func register(credentials: PlatformCredentials) -> PromiseInterface<Player> {
        login(.registration, credentials)
    }

    func fetchHistoryAccounts() -> PromiseInterface<KotlinArray<LoginHistory>> {
        let promise = Promise<KotlinArray<LoginHistory>>(waitFor: nil)
        do {
            try baseGameKit?.getHistoryAccounts().takeDelegation(other: promise)
        } catch {
            promise.reject(reason: Throwable("fetchHistoryAccounts Error"))
        }

        return promise
    }

    func showLoginHistoryView(_ loginHistories: Array<LoginHistory>) -> PromiseInterface<Player> {
        let loginView = LoginHistoryViewController(loginHistories)
        presentModelView(loginView)
        return loginView.promise
    }

    // MARK: show view
    func showLoginView(_ data: LoginHistory? = nil) -> PromiseInterface<Player> {
        let loginView = LoginViewController()
        presentModelView(loginView)
        return loginView.promise
    }


    func showQuickLoginView() -> PromiseInterface<Player> {
        Promise<Player>(waitFor: nil)
    }

    func getAgreement(_ type: AgreementType) -> String {
        baseGameKit?.getAgreement(type: type) ?? ""
    }


    func presentModelView(_ viewController: UIViewController, _ animated: Bool = true) {
        viewController.modalPresentationStyle = .overFullScreen
        let presented = viewController
//        if inherit {
//            let navigationController = BaseNavigationController(rootViewController: viewController, true)
//            navigationController.modalPresentationStyle = .overFullScreen
//            presented = navigationController
//        }

        appTopViewController.providesPresentationContextTransitionStyle = true
        appTopViewController.definesPresentationContext = true
        appTopViewController.present(presented, animated: animated)
    }

    func presentView(_ viewController: UIViewController, _ inherit: Bool = true) {
        viewController.modalPresentationStyle = .fullScreen
        let navigationController = BaseNavigationController(rootViewController: viewController)
//        navigationController.navigationBar.isTranslucent = false
        navigationController.modalPresentationStyle = .fullScreen
        appTopViewController.definesPresentationContext = true
        appTopViewController.present(navigationController, animated: true, completion: nil)
    }

    func showAgreement(_ type: AgreementType) {
        if let agreement = baseGameKit?.getAgreement(type: type),
           let encodingString = agreement.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let url = URL(string: encodingString) {
                let safari = SFSafariViewController(url: url)
                appTopViewController.present(safari, animated: true, completion: nil)
            }
        } else {
            merror("url is error")
        }
    }

    @discardableResult
    func showCustomerService() -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>(waitFor: nil)

        guard let remoteGameConfig = remoteGameConfig, remoteGameConfig.supportAllowed else {
            promise.reject(reason: Throwable("Not Open"))
            return promise
        }

        ThirdPartyFactory.shared.showSobot().takeDelegation(other: promise)
        return promise
    }

    @discardableResult
    func accountDeletion() -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>(waitFor: nil)
        do {
            try baseGameKit?.accountDeletion().takeDelegation(other: promise)
        } catch {
            promise.reject(reason: Throwable("Error"))
        }
        return promise
    }

    @discardableResult
    func deregisterAccount() -> PromiseInterface<KotlinUnit> {
        let deregisterVC = DeregisterViewController(nil)
        presentModelView(deregisterVC)
        return deregisterVC.viewPromise
    }

    public func logEvent(_ name: String, _ params: [String: Any], _ consumer: Int32) {
        if let trackingKit {
            trackingKit.logEvent(name: name, params: params, consumer: consumer)
        } else {
            merror("TrackingKit is nil")
        }
    }

    var safariPromise: Promise<KotlinUnit>?

    func showUserCenter() -> PromiseInterface<KotlinUnit> {
        let userCenterVC = UserCenterViewController()
        presentModelView(userCenterVC)
        return userCenterVC.viewPromise
    }

    func showRewardedAd(_ adUnitName: String, _ placement: String, _ extensionParam: String = "") -> PromiseInterface<AdResult> {
        let promise = Promise<AdResult>.init(waitFor: nil)
        if isLogging {
            promise.reject(reason: Throwable("SDK is Logging"))
            return promise
        }

        do {
            try baseGameKit?.showAdCustomer(adUnitName: adUnitName, adType: AdType.rewarded, placement: placement, extensionParam: extensionParam).takeDelegation(other: promise)
        } catch {
            promise.reject(reason: Throwable("fetch error"))
        }
        return promise
    }

    @discardableResult
    func showAppOpenAd(_ adUnitName: String, _ placement: String, _ extensionParam: String = "") -> PromiseInterface<AdResult> {
        let promise = Promise<AdResult>.init(waitFor: nil)
        if isLogging {
            promise.reject(reason: Throwable("SDK is Logging"))
            return promise
        }

        do {
            try baseGameKit?.showAdCustomer(adUnitName: adUnitName, adType: AdType.appopen, placement: placement, extensionParam: extensionParam).takeDelegation(other: promise)
        } catch {
            promise.reject(reason: Throwable("fetch error"))
        }
        return promise
    }

    func fetchAllAdUnitIds(_ adType: AdType, _ adMediation: AdMediation) -> [String] {
        guard let array = baseGameKit?.getAllAdUnitIds(adType: adType, adMediation: adMediation) else {
            return []
        }

        return (0..<array.size).compactMap {
            array.get(index: $0) as? String
        }
    }

    var floatingWindow: FloatingWindow?

    public func openAgeLimitView(_ initialPoint: CGPoint = .zero) {

        let pointKey = "floating_window_point_key"
        var floatPoint: CGPoint
        let pointValue = kvStorage.get(key: pointKey)
        if pointValue.isEmpty {
            floatPoint = initialPoint
        } else {
            let pointArray = pointValue.split(separator: ",")
            let x = Double(String(pointArray[0])) ?? 0
            let y = Double(String(pointArray[1])) ?? 0
            floatPoint = CGPoint(x: x, y: y)
        }

        if floatingWindow != nil {
            floatingWindow!.isHidden = false
            return
        }

        let screenBounds = UIScreen.main.bounds

        // 获取安全区域
        let safeAreaTop = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        let safeAreaBottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0

        // 限制X轴在屏幕范围内
        let targetX = max(0, min(floatPoint.x, screenBounds.width - 50))
        let targetY = max(safeAreaTop, min(floatPoint.y, screenBounds.height - 50 - safeAreaBottom))
        floatPoint = CGPoint(x: targetX, y: targetY)

        floatingWindow = FloatingWindow(floatPoint)
        appTopViewController.view.addSubview(floatingWindow!)
    }

    public func closeAgeLimitView() {
        if let floatingWindow = floatingWindow {
            floatingWindow.isHidden = true
        }
    }

}

// MARK: Connect
extension BaseBridge {
    @discardableResult
    func fetchConnectedPlatforms() -> PromiseInterface<KotlinArray<PlatformConnectionInfo>> {
        let promise = Promise<KotlinArray<PlatformConnectionInfo>>.init(waitFor: nil)
        do {
            try baseGameKit?.fetchConnectedPlatforms().takeDelegation(other: promise)
        } catch {
            promise.reject(reason: Throwable("fetch error"))
        }
        return promise
    }

    @discardableResult
    func fetchTotalConnectPlatforms() -> PromiseInterface<KotlinArray<PlatformConnectionInfo>> {
        let promise = Promise<KotlinArray<PlatformConnectionInfo>>.init(waitFor: nil)
        do {
            try baseGameKit?.fetchTotalConnectPlatforms().takeDelegation(other: promise)
        } catch {
            promise.reject(reason: Throwable("fetch error"))
        }
        return promise
    }

    //
    func connect(_ platform: Platform, _ credentials: PlatformCredentials) -> PromiseInterface<Player> {
        let promise = Promise<Player>(waitFor: nil)
        let loadingOverlay = Loading.showOverlay()
        do {
            try baseGameKit?.connect(platform: platform, credentials: credentials)
                    .then { rejectable, player in
                        promise.resolve(result: player)
                    }
                    .otherwise { interface, throwable in
                        promise.reject(reason: throwable)
                    }
                    .eventually {
                        loadingOverlay.hide()
                    }
        } catch {
            promise.reject(reason: Throwable("connect Error"))
            loadingOverlay.hide()
        }
        return promise
    }

    @discardableResult
    func connectAccount(_ platform: ConnectPlatform) -> PromiseInterface<Player> {
        func thirdConnect(_ platform: ConnectPlatform) -> PromiseInterface<Player> {
            let platform = Platform.companion.getEnumByValue(platform: platform.platform)
            let promise = Promise<Player>.init(waitFor: nil)

            guard PlatformUtil.shared.supportConnect(platform: platform) else {
                promise.reject(reason: Throwable.UnOpen)
                return promise
            }

            ThirdPartyFactory.shared.authorize(platform)
                    .then { (_, credentials) in
                        BaseBridge.shared.connect(platform, credentials!).takeDelegation(other: promise)
                    }
                    .otherwise { (_, throwable) in
                        promise.reject(reason: throwable)
                    }
            return promise
        }

        func checkInfos(_ infos: KotlinArray<PlatformConnectionInfo>) -> PromiseInterface<Player> {
            let promise = Promise<Player>(waitFor: nil)

            var total: [PlatformConnectionInfo] = []
            exchange(infos, &total)

            guard total.count > 0 else {
                let message = LocalizedString("connect_no_available", "Currently, there are no association methods available.")
                Toast(message)
                promise.reject(reason: Throwable(message))
                return promise
            }

            guard (total.first(where: { $0.uuid.isEmpty }) != nil) else {
                let message = LocalizedString("connect_no_need", "Since your account is already highly secure, this operation is not required.")
                Toast(message)
                promise.reject(reason: Throwable(message))
                return promise
            }

            switch platform {
            case .all:
                showConnectView(total).takeDelegation(other: promise)
            case .email:
                showEmailConnectView().takeDelegation(other: promise)
            default:
                thirdConnect(platform).takeDelegation(other: promise)
            }
            return promise
        }

        let promise = Promise<Player>.init(waitFor: nil)
        let loadingOverlay = Loading.showOverlay()
        fetchTotalConnectPlatforms()
                .then { _, array in
                    checkInfos(array!).takeDelegation(other: promise)
                }
                .otherwise { (_, throwable) in
                    promise.reject(reason: throwable)
                }
                .eventually {
                    loadingOverlay.hide()
                }
        return promise
    }

    private func showConnectView(_ infos: [PlatformConnectionInfo]) -> PromiseInterface<Player> {
        let promise = Promise<Player>(waitFor: nil)
        let connectView = ConnectViewController(infos)
        connectView.promise.takeDelegation(other: promise)
        presentModelView(connectView)
        return promise
    }

    func showEmailConnectView() -> PromiseInterface<Player> {
        let promise = Promise<Player>(waitFor: nil)
        guard PlatformUtil.shared.supportConnect(platform: .email) else {
            promise.reject(reason: Throwable.UnOpen)
            return promise
        }

        let connectView = EmailConnectViewController()
        connectView.promise.takeDelegation(other: promise)
        presentModelView(connectView)
        return promise
    }

}


let EventName = TrackingEventName()

// MARK: LogEvent
extension BaseBridge {
    // MARK: Tracking
    public func logEvent(_ name: String, _ params: [String: Any]? = nil) {
        DispatchQueue.main.async { [self] in
            if let trackingKit {
                trackingKit.logEvent(name: name, params: params)
            } else {
                merror("TrackingKit is nil")
            }
        }
    }

    public func logEvent(_ name: String, _  params: [String: Any]?, _  consumer: Int32) {
        DispatchQueue.main.async { [self] in
            if let trackingKit {
                trackingKit.logEvent(name: name, params: params, consumer: consumer)
            } else {
                merror("TrackingKit is nil")
            }
        }
    }

//    func logChannel() {
//        DispatchQueue.main.async {[self] in
//            trackingKit.logChannel()
//        }
//    }

    func logDevice() {
//        let params: [String: Any] = ["device_ram": SystemTools.deviceTotalRam(),
//                                     "device_runram": SystemTools.deviceRunRam(),
//                                     "game_useram": SystemTools.gameUseRam(),
//                                     "Remaining_storage_space": SystemTools.freeStorageSpace(),
//                                     "cpu_type": "",
//                                     "cpu_chipset": "",
//                                     "device_ppi": ""]
//        logEvent(name: TrackingEventName().SDK_LOG_DEVICE, params: params, consumer: TrackingConsumer.MDATA)
    }

    func logRevenue(_ price: Double, _ currency: String, _ purchaseId: String, _ productId: String) {
        runInMain { [self] in
            if let trackingKit {
                mdebug("[StoreKit2]: logRevenue: \(purchaseId)")
                trackingKit.logRevenue(price: price, currency: currency, purchaseId: purchaseId, productId: productId)
            }
        }
    }

    func onAdLoaded(_ eventInfo: AdEventInfo?, _ retryAttempt: Int, _ loadingTime: Double) {
        runInMain { [self] in
            if let adEventTracking, let eventInfo {
                adEventTracking.onAdLoaded(eventInfo: eventInfo, retryAttempt: Int32(retryAttempt), loadingTime: loadingTime)
            }
        }
    }

    func onAdFailedToLoad(
            _ eventInfo: AdEventInfo?,
            _ errorCode: Int,
            _ errorMessage: String,
            _ retryAttempt: Int,
            _ otherInfo: [String: Any]? = nil) {
        runInMain { [self] in
            if let adEventTracking, let eventInfo {
                adEventTracking.onAdLoadFailed(eventInfo: eventInfo, errorCode: Int32(errorCode), errorMessage: errorMessage, retryAttempt: Int32(retryAttempt), otherInfo: otherInfo)
            }
        }
    }


    func onAdClicked(_ eventInfo: AdEventInfo?) {
        runInMain { [self] in
            if let adEventTracking, let eventInfo {
                adEventTracking.onAdClicked(eventInfo: eventInfo, otherInfo: nil)
            }
        }
    }

    func onAdDisplayed(_ eventInfo: AdEventInfo?) {
        runInMain { [self] in
            if let adEventTracking, let eventInfo {
                adEventTracking.onAdDisplayed(eventInfo: eventInfo)
            }
        }
    }

    func onAdDisplayFailed(
            _ eventInfo: AdEventInfo?,
            _ errorCode: Int,
            _ errorMessage: String,
            _ otherInfo: [String: Any]? = nil) {
        runInMain { [self] in
            if let adEventTracking, let eventInfo {
                adEventTracking.onAdDisplayFailed(eventInfo: eventInfo, errorCode: Int32(errorCode), errorMessage: errorMessage, otherInfo: otherInfo)
            }
        }
    }

    func onAdViewClose(
            _ eventInfo: AdEventInfo?,
            _ otherInfo: [String: Any]? = nil) {
        runInMain { [self] in
            if let adEventTracking, let eventInfo {
                adEventTracking.onAdViewClosed(eventInfo: eventInfo, otherInfo: otherInfo)
            }
        }
    }

    func onAdRewarded(
            _ eventInfo: AdEventInfo?,
            _ amount: Int,
            _ rewardType: String,
            _ otherInfo: [String: Any]
    ) {
        runInMain { [self] in
            if let adEventTracking, let eventInfo {
                adEventTracking.onAdRewarded(eventInfo: eventInfo, rewardAmount: Int32(amount), rewardType: rewardType, otherInfo: otherInfo)
            }
        }
    }

    func onAdRevenuePaid(
            _ eventInfo: AdEventInfo?,
            _ revenue: Double,
            _ currency: String,
            _ otherInfo: [String: Any],
            _ firebaseParameter: [String: Any]
    ) {
        runInMain { [self] in
            if let adEventTracking, let eventInfo {
                adEventTracking.onAdRevenuePaid(eventInfo: eventInfo, revenue: revenue, currency: currency, otherInfo: otherInfo, firebaseParameters: firebaseParameter)
            }
        }
    }

    func onGameRequest(
            _ adParams: AdParams,
            _ customerData: String
    ) {
        runInMain { [self] in
            if let adEventTracking {
                adEventTracking.onGameRequest(mediation: adParams.mediation, adType: adParams.type, adUnitName: adParams.unitName, placement: adParams.placement, extensionParam: customerData)
            }
        }
    }

    func onGameRequestResult(
            _ eventInfo: AdEventInfo?,
            _ errorCode: String,
            _ errorMessage: String
    ) {
        runInMain { [self] in
            if let adEventTracking, let eventInfo {
                adEventTracking.onGameRequestResult(eventInfo: eventInfo, errorCode: errorCode, errorMessage: errorMessage)
            }
        }
    }

}

// MARK: Share
extension BaseBridge {

    @discardableResult
    func share(_ shareContent: ShareContent) -> PromiseInterface<ShareResult> {
        let promise = Promise<ShareResult>(waitFor: nil)
        let shareElements = SocialPlatformUtils.shared.shareElements()
        if shareElements.isEmpty {
            promise.reject(reason: Throwable.Unknown)
        } else if shareElements.count == 1 {
            let platform = shareElements.first!.platform
            var text = shareContent.text
            if shareContent.image == nil && shareContent.text == nil && shareContent.url == nil {
                text = shareElements.first?.text
            }

            let image = shareContent.image as? UIImage
            let url = URL(string: (shareContent.url ?? ""))
            ThirdPartyFactory.shared.share(platform, text: text, image: image, url: url).then { rejectable, result in
                        shareSuccess(result, promise)
                    }
                    .otherwise { interface, throwable in
                        shareFail(throwable, promise)
                    }
        } else {
            let shareView = ShareViewController(shareElements, shareContent)
            shareView.promise.then { rejectable, result in
                        shareSuccess(result, promise)
                    }
                    .otherwise { interface, throwable in
                        shareFail(throwable, promise)
                    }
            presentModelView(shareView)
        }

        func shareSuccess(_ result: ShareResult?, _ promise: PromiseInterface<ShareResult>) {
            if let result = result {
                let params: [String: Any] = [
                    "share_platform": "\(result.platform.name)",
                    "share_result": "\(result.status.name)",
                    "message": "\(result.message)",
                    "share_text": (shareContent.text ?? ""),
                    "share_link": (shareContent.url ?? ""),
                    "share_image_path": "\((shareContent.image != nil) ? "image" : "")"
                ]
                BaseBridge.shared.logEvent(TrackingEventName.shared.SDK_SHARE, params, TrackingKit.TrackingConsumer.companion.TD)
            }
            promise.resolve(result: result)
        }

        func shareFail(_ throwable: KotlinThrowable, _ promise: PromiseInterface<ShareResult>) {
            let params: [String: Any] = [
                "share_platform": "unknown",
                "share_result": "fail",
                "message": "\(throwable.message ?? "fail")",
                "share_text": (shareContent.text ?? ""),
                "share_link": (shareContent.url ?? ""),
                "share_image_path": "\((shareContent.image != nil) ? "image" : "")"
            ]
            BaseBridge.shared.logEvent(TrackingEventName.shared.SDK_SHARE, params, TrackingKit.TrackingConsumer.companion.TD)
            promise.reject(reason: throwable)
        }

        return promise
    }

}

// MARK: Purchase
extension BaseBridge {

    func fetchStoreInfo() -> PromiseInterface<StoreInfo> {
        let promise = Promise<StoreInfo>(waitFor: nil)
        if #available(iOS 15.0, *) {
            StoreKit2.shared.fetchStoreInfo().raw.takeDelegation(other: promise)
        } else {
            promise.reject(reason: Throwable.Unsupported)
        }
        return promise
    }


    func fetchProducts(_ productIds: Set<String>) -> PromiseInterface<NSArray> {
        if #available(iOS 15.0, *) {
            return StoreKit2.shared.fetchProducts(productIds: productIds).raw
        } else {
            return PaymentManager.manager.fetchProducts(productIds)
        }
    }

    func purchase(_ productId: String, _ extensionParam: String?, _ finishEvent: PurchaseEvent) -> PromiseInterface<PurchaseResult> {
        let promise = Promise<PurchaseResult>(waitFor: nil)

        guard #available(iOS 15.0, *), PaymentManager.manager.canPurchase else {
            promise.reject(reason: Throwable("User can't purchase"))
            return promise
        }

        let loadingOverlay = Loading.showOverlay()
        storePurchase(productId, extensionParam ?? "{}", finishEvent)
                .then { _, result in
                    promise.resolve(result: result)
                }
                .otherwise { (_, throwable) in
                    promise.reject(reason: throwable)
                }
                .eventually {
                    loadingOverlay.hide()
                    PaymentManager.manager.finish()
                }
        return promise
    }

    @discardableResult
    private func storePurchase(_ productId: String,
                               _ extensionParam: String,
                               _ finishEvent: PurchaseEvent
    ) -> PromiseInterface<PurchaseResult> {
        let promise = Promise<PurchaseResult>(waitFor: nil)

        if #available(iOS 15.0, *) {
            basePurchase(productId, extensionParam, finishEvent).takeDelegation(other: promise)
        } else {
            PaymentManager.manager.prepare(productId)
                    .then { [self] (rejectable, result) in
                        basePurchase(productId, extensionParam, finishEvent).takeDelegation(other: promise)
                    }
                    .otherwise { (_, reason) in
                        promise.reject(reason: reason)
                    }
        }
        return promise
    }

    private func basePurchase(_ productId: String, _  extensionParam: String, _  finishEvent: PurchaseEvent) -> PromiseInterface<PurchaseResult> {
        let promise = Promise<PurchaseResult>(waitFor: nil)
        do {
            try baseGameKit?.purchase(
                    productId: productId,
                    extensionParam: extensionParam,
                    finishEvent: finishEvent
            ).takeDelegation(other: promise)
        } catch {
            promise.reject(reason: Throwable("verify error"))
        }
        return promise
    }


    @discardableResult
    func verifyOrder(order: PayOrder) -> PromiseInterface<VerifyStatus> {
        let promise = Promise<VerifyStatus>(waitFor: nil)
        do {
            try baseGameKit?.verifyOrder(order: order).takeDelegation(other: promise)
        } catch {
            promise.reject(reason: Throwable("verify error"))
        }
        return promise
    }

    @discardableResult
    func showWebPay(_ link: String) -> PromiseInterface<KotlinUnit> {
        mdebug("[showWebPay]: link=\(link)")
        let promise = Promise<KotlinUnit>(waitFor: nil)
        if let url = link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            let webView = WebPayViewController(url: url)
            webView.viewPromise.takeDelegation(other: promise)
            presentView(webView)
        } else {
            promise.reject(reason: Throwable("Invalid url"))
        }

        return promise
    }

    func showRealName(_ link: String) -> PromiseInterface<KotlinUnit> {
        mdebug("[showRealName]: - showRealName:\(link)")
        let promise = Promise<KotlinUnit>(waitFor: nil)
        if let url = link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            let webView = RealNameViewController(url: url)
            webView.viewPromise.takeDelegation(other: promise)
            presentView(webView)
        } else {
            promise.reject(reason: Throwable("Invalid url"))
        }

        return promise
    }

}

// MARK: SFSafariViewController
extension BaseBridge: SFSafariViewControllerDelegate, MFMailComposeViewControllerDelegate {

    func showOfficial() {
        if let baseGameKit = baseGameKit {
            baseGameKit.showOfficial()
        }
    }

    func showOfficialRecharge() {
        if let baseGameKit = baseGameKit {
            baseGameKit.showOfficialRecharge()
        }
    }

    @discardableResult
    func showWebView(_ link: String) -> PromiseInterface<KotlinUnit> {
        mdebug("[showWebView]: link=\(link)")
        let promise = Promise<KotlinUnit>(waitFor: nil)
        if let url = link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            let webView = WebViewViewController(url: url)
            webView.viewPromise.takeDelegation(other: promise)
            presentView(webView)
        } else {
            promise.reject(reason: Throwable("Invalid url"))
        }

        return promise
    }

    @discardableResult
    func showSafari(_ link: String) -> PromiseInterface<KotlinUnit> {
        mdebug("[showSafari]: link=\(link)")
        safariPromise = Promise<KotlinUnit>(waitFor: nil)
        if let encodingString = link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodingString) {
            let safari = SFSafariViewController(url: url)
            safari.delegate = self
            appTopViewController.present(safari, animated: true)
        } else {
            safariPromise?.reject(reason: Throwable("Invalid url"))
        }
        return safariPromise!
    }

    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        if let promise = safariPromise, promise.state == PromiseState.pending {
            promise.resolve(result: KotlinUnit())
        }
    }

    func sendMail(_ recipient: String) {
        mdebug("showMail:\(recipient)")
        if let url = URL(string: "mailto:\(recipient)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    // MARK: - MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

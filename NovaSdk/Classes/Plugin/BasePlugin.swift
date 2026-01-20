//
//

open class BasePlugin: NSObject {

    public required override init() {
        super.init()
    }

    open var name: String {
        ""
    }

    open var initialized: Bool = false

    public let localConfig: LocalConfig = LocalConfig.shared

    public let remoteGameConfig: RemoteGameConfig? = BaseBridge.shared.remoteGameConfig

    public let handle: AdHandle = AdHandle()

    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return true
    }

    open func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any?) -> Bool {
        return true
    }

    open func applicationDidBecomeActive(_ application: UIApplication) {
    }

    open func applicationDidEnterBackground(_ application: UIApplication) {
    }

    open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    }

    open func initSdk() {
    }

    open var uuid: String?

    open var authPromise: Promise<PlatformCredentials>? = nil

    open var sharePromise: Promise<ShareResult>? = nil


    // MARK: - ads
    open func loadAds() {

    }

    open func showRewardedAd(_ params: AdParams, _ customerData: String) -> PromiseInterface<AdResult> {
        let promise = Promise<AdResult>.init(waitFor: nil)
        promise.reject(reason: AdErrorReason(errorType: AdErrorType.notfoundunitid.name, message: "not found"))
        return promise
    }

    open func showAppOpenAd(_ params: AdParams, _ customerData: String) -> PromiseInterface<AdResult> {
        let promise = Promise<AdResult>.init(waitFor: nil)
        promise.reject(reason: AdErrorReason(errorType: AdErrorType.notfoundunitid.name, message: "not found"))
        return promise
    }

    // MARK: - auth
    open func authorize(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        self.uuid = uuid
        authPromise = nil
        authPromise = Promise<PlatformCredentials>.init(waitFor: nil)
        return authPromise!
    }

    open func authSuccess(_ credentials: PlatformCredentials) {
        if let promise = authPromise, promise.state == .pending {
            promise.resolve(result: credentials)
        }
    }

    open func authFailure(_ message: String) {
        if let promise = authPromise, promise.state == .pending {
            promise.reject(reason: Throwable(message))
        }
    }

    // MARK: - share
    open func share(_ shareContent: ShareContent) -> PromiseInterface<ShareResult> {
        sharePromise = nil
        sharePromise = Promise<ShareResult>.init(waitFor: nil)
        return sharePromise!
    }

    open func shareSuccess(_ result: ShareResult) {
        if let promise = sharePromise, promise.state == .pending {
            promise.resolve(result: result)
        }
    }

    open func shareFailure(_ exception: Throwable) {
        if let promise = sharePromise, promise.state == .pending {
            promise.reject(reason: exception)
        }
    }

    // MARK: - track
    open func trackLogin(_ params: [String: Any]?, _ player: Player) {

    }

    open func trackEvent(_ eventName: String, _ params: [String: Any]? = nil) {

    }

    open func trackRevenue(_ eventName: String, _ price: Double, _ currency: String, _ orderId: String) {

    }

}

extension ShareContent {

    public func isInvalid() -> Bool {
        image == nil && imagePath == nil && text == nil && url == nil
    }

}


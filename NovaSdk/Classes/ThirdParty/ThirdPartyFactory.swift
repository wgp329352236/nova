//
//  Created on 2024/6/17.
//

import UIKit
import Foundation
import BackgroundTasks

class ThirdPartyFactory {
    static let shared: ThirdPartyFactory = {
        let instance = ThirdPartyFactory()
        return instance
    }()

    @discardableResult
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        Facebook.application(app, open: url, options: options)
        PluginManager.manager.application(app, open: url, options: options)
        return true
    }

    @discardableResult
    func application(_ app: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Facebook.application(app, didFinishLaunchingWithOptions: launchOptions)

        // 注册后台任务
//        registerBackgroundTasks()
        // 首次调度任务（应用启动时）
//        scheduleBackgroundTasks()

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func registerBackgroundTasks() {
        let identifier = "com.nova.background.refreshTask"
        // 注册应用刷新任务
        BGTaskScheduler.shared.register(forTaskWithIdentifier: identifier, using: nil) { task in
            self.handleRefreshTask(task: task as! BGAppRefreshTask)
        }
    }

    /// 调度应用刷新任务（短时间刷新）
    private func scheduleBackgroundTasks() {
        let identifier = "com.nova.background.refreshTask"
        // 创建刷新任务请求
        let request = BGAppRefreshTaskRequest(identifier: identifier)
        // 设置任务最早执行时间（单位：秒，这里设置为10秒后）
        request.earliestBeginDate = Date(timeIntervalSinceNow: 60)

        do {
            // 提交任务请求
            try BGTaskScheduler.shared.submit(request)
            print("应用刷新任务调度成功")
        } catch {
            print("应用刷新任务调度失败：\(error.localizedDescription)")
        }
    }

    /// 处理应用刷新任务
    private func handleRefreshTask(task: BGAppRefreshTask) {
        print("开始执行应用刷新任务...")

        // 标记任务为“需要继续执行”（防止系统提前终止）
        task.expirationHandler = {
            // 任务即将过期时的收尾操作
            task.setTaskCompleted(success: false)
            print("应用刷新任务过期，强制结束")
        }

        // 模拟：执行短时间刷新操作（如网络请求获取最新数据）
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            print("应用刷新任务执行完成：获取到最新数据")
            self.initAdMediation()

            // 必须调用 setTaskCompleted，否则系统会惩罚应用
            task.setTaskCompleted(success: true)

            // 任务完成后，可重新调度下一次任务（可选）
//            self.scheduleRefreshTask()
        }
    }


    private let cmp = Cmp()
    private let sobot = Sobot()
    private let whatsApp = WhatsApp.init()
    private let messenger = Messenger.init()

    func initOthers() {
        cmp.initialize()
        sobot.initialize()
        initAdMediation()
    }

    func initAdMediation() {
        PluginManager.manager.initSdk()
        PluginManager.manager.loadAds()
    }

    func loadAds() {
        PluginManager.manager.loadAds()
    }

    func showRewardedAd(_ params: AdParams, _ customerData: String) -> PromiseInterface<AdResult> {
        PluginManager.manager.showRewardedAd(params, customerData)
    }

    func showAppOpenAd(_ params: AdParams, _ customerData: String) -> PromiseInterface<AdResult> {
        PluginManager.manager.showAppOpenAd(params, customerData)
    }

    func showMDAView() -> PromiseInterface<KotlinInt> {
        cmp.showView()
    }

    // MARK: authorize
    func authorize(_ type: Platform, _ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        let promise = Promise<PlatformCredentials>(waitFor: nil)
        switch type {
        case .apple:
            authByApple(uuid).takeDelegation(other: promise)
            break
        case .facebook:
            authByFB(uuid).takeDelegation(other: promise)
            break
        case .google:
            authByGoogle(uuid).takeDelegation(other: promise)
            break
        case .vk:
            authByVK(uuid).takeDelegation(other: promise)
            break
        case .line:
            authByLine(uuid).takeDelegation(other: promise)
            break
        case .gameCenter:
            authByGC(uuid).takeDelegation(other: promise)
            break
        case .kakao:
            authByKakao(uuid).takeDelegation(other: promise)
            break
        default:
            promise.reject(reason: Throwable.Unsupported)
        }
        return promise
    }

    // MARK: for gc
    private let gc = GC.init()

    private func authByGC(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        let promise = Promise<PlatformCredentials>.init(waitFor: nil)
        gc.authorize(uuid).takeDelegation(other: promise)
        return promise
    }

    // MARK: Apple
    private let apple = Apple.init()

    private func authByApple(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        let promise = Promise<PlatformCredentials>.init(waitFor: nil)
        apple.authorize(uuid).takeDelegation(other: promise)
        return promise
    }

    // MARK: FB
    private var fb: Facebook?

    private func authByFB(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        let promise = Promise<PlatformCredentials>.init(waitFor: nil)
        fb = Facebook.init()
        fb?.authorize(uuid).takeDelegation(other: promise)
        return promise
    }

    // MARK: Google
    private var google: Google?

    private func authByGoogle(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        let promise = Promise<PlatformCredentials>.init(waitFor: nil)
        google = Google.init()
        google?.authorize(uuid).takeDelegation(other: promise)
        return promise
    }

    // MARK: VK
    private func authByVK(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        PluginManager.manager.authorize(.vk, uuid)
    }

    // MARK: Line
    private func authByLine(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        PluginManager.manager.authorize(.line, uuid)
    }

    // MARK: Kakao
    private func authByKakao(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        PluginManager.manager.authorize(.kakao, uuid)
    }

    // MARK: share
    @discardableResult
    func share(_ platform: SocialPlatform = .facebook, text: String?, image: UIImage?, url: URL?) -> PromiseInterface<ShareResult> {
        switch platform {
        case .vk, .line, .kakao:
            let shareContent = ShareContent(platform: platform)
            shareContent.text = text
            shareContent.image = image
            shareContent.url = url?.absoluteString
            return PluginManager.manager.share(shareContent)
        case .facebook:
            return shareToFB(text: text, image: image, url: url)
        case .whatsapp:
            return shareToWhatsApp(text: text, image: image, url: url)
        case .whatsapp:
            return shareToWhatsApp(text: text, image: image, url: url)
        case .messenger:
            return shareToMessenger(text: text, image: image, url: url)
        default:
            return Promise<ShareResult>.init(waitFor: nil)
        }
    }

    private func shareToFB(text: String?, image: UIImage?, url: URL?) -> PromiseInterface<ShareResult> {
        fb = Facebook.init()
        return fb!.share(text: text, image: image, url: url)
    }

    private func shareToWhatsApp(text: String?, image: UIImage?, url: URL?) -> PromiseInterface<ShareResult> {
        whatsApp.share(text: text, image: image, url: url)
    }

    private func shareToMessenger(text: String?, image: UIImage?, url: URL?) -> PromiseInterface<ShareResult> {
        messenger.share(text: text, image: image, url: url)
    }

    ///
    /// Customer Service
    // MARK: sobot
    func showSobot() -> PromiseInterface<KotlinUnit> {
        sobot.show()
    }

}

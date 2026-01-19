//
//

import Foundation

class PluginManager {

    static let manager = PluginManager()

    private var plugins: [String] = ["AppLovinPlugin", "AdmobPlugin", "VKPlugin", "LinePlugin", "KakaoPlugin", "TikTokPlugin"]
    private var maps: [String: BasePlugin] = [:]

    func initSdk() {
        plugins.forEach { name in
            if let pluginClass = NSClassFromString(name + ".Plugin") as? BasePlugin.Type {
                let plugin = pluginClass.init()
                maps[name] = plugin
                plugin.initSdk()
            }
        }
    }

    // MARK: - Auth
    func authorize(_ platform: Platform, _ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        let promise = Promise<PlatformCredentials>.init(waitFor: nil)

        switch platform {
        case .vk:
            if let vk = maps["VKPlugin"] {
                vk.authorize(uuid).takeDelegation(other: promise)
            } else {
                promise.reject(reason: Throwable.Unsupported)
            }
        case .line:
            if let line = maps["LinePlugin"] {
                line.authorize(uuid).takeDelegation(other: promise)
            } else {
                promise.reject(reason: Throwable.Unsupported)
            }
        case .kakao:
            if let kakao = maps["KakaoPlugin"] {
                kakao.authorize(uuid).takeDelegation(other: promise)
            } else {
                promise.reject(reason: Throwable.Unsupported)
            }
        default:
            promise.reject(reason: Throwable.Unsupported)
        }

        return promise
    }

    // MARK: - Share
    func share(_ shareContent: ShareContent) -> PromiseInterface<ShareResult> {
        let promise = Promise<ShareResult>.init(waitFor: nil)
        switch shareContent.platform {
        case .vk:
            if let vk = maps["VKPlugin"] {
                vk.share(shareContent).takeDelegation(other: promise)
            } else {
                promise.reject(reason: Throwable.Unsupported)
            }
        case .line:
            if let line = maps["LinePlugin"] {
                line.share(shareContent).takeDelegation(other: promise)
            } else {
                promise.reject(reason: Throwable.Unsupported)
            }
        case .kakao:
            if let kakao = maps["KakaoPlugin"] {
                kakao.share(shareContent).takeDelegation(other: promise)
            } else {
                promise.reject(reason: Throwable.Unsupported)
            }
        default:
            promise.reject(reason: Throwable.Unsupported)
        }
        return promise
    }


    // MARK: - Ads
    func loadAds() {
        guard let remoteGameConfig = BaseBridge.shared.remoteGameConfig, let adMediationRandom = remoteGameConfig.adMediationRandom else {
            return
        }

        if let admob = maps["AdmobPlugin"], adMediationRandom.getWeight(mediation: .admob) > 0 {
            admob.loadAds()
        }

        if let applovin = maps["AppLovinPlugin"], adMediationRandom.getWeight(mediation: .applovinMax) > 0 {
            applovin.loadAds()
        }
    }

    func showRewardedAd(_ params: AdParams, _ customerData: String) -> PromiseInterface<AdResult> {
        print("[RewardedAd]: params:\(params)| customer:\(customerData)")
        let promise = Promise<AdResult>.init(waitFor: nil)
        switch params.mediation {
        case .admob:
            if let admob = maps["AdmobPlugin"] {
                admob.showRewardedAd(params, customerData).takeDelegation(other: promise)
            } else {
                print("[RewardedAd]: Admob is nil")
                promise.reject(reason: Throwable.Unsupported)
            }
        case .applovinMax:
            if let applovin = maps["AppLovinPlugin"] {
                applovin.showRewardedAd(params, customerData).takeDelegation(other: promise)
            } else {
                print("[RewardedAd]: AppLovin is nil")
                promise.reject(reason: Throwable.Unsupported)
            }
        default:
            print("[RewardedAd]: default")
            promise.reject(reason: Throwable.Unsupported)
        }
        return promise
    }

    func showAppOpenAd(_ params: AdParams, _ customerData: String) -> PromiseInterface<AdResult> {
        mdebug("[AppOpenAd]: params:\(params)| customer:\(customerData)")
        let promise = Promise<AdResult>.init(waitFor: nil)
        let mediation = params.mediation
        switch mediation {
        case .admob:
            if let admob = maps["AdmobPlugin"] {
                admob.showAppOpenAd(params, customerData).takeDelegation(other: promise)
            } else {
                print("[AppOpenAd]: AppLovin is nil")
                promise.reject(reason: Throwable.Unsupported)
            }
        case .applovinMax:
            if let applovin = maps["AppLovinPlugin"] {
                applovin.showAppOpenAd(params, customerData).takeDelegation(other: promise)
            } else {
                promise.reject(reason: Throwable.Unsupported)
            }
        default:
            promise.reject(reason: Throwable.Unsupported)
        }
        return promise
    }

    // MARK: - track
    func trackLogin(_ params: [String: Any]?, _ player: Player) {
        maps.values.forEach { plugin in
            plugin.trackLogin(params, player)
        }
    }

    func trackEvent(_ consumer: TrackingConsumer, _ eventName: String, _ params: [String: Any]? = nil) {
        switch consumer {
        case .tiktok:
            if let tiktok = maps["TikTokPlugin"] {
                tiktok.trackEvent(eventName, params)
            } else {
                print("[Plgin]: TikTok uninstall")
            }
        default:
            break
        }
    }

    func trackRevenue(_ consumer: TrackingConsumer, _ eventToken: String = "", _ price: Double, _ currency: String, _ orderId: String) {
        switch consumer {
        case .tiktok:
            if let tiktok = maps["TikTokPlugin"] {
                tiktok.trackRevenue(eventToken, price, currency, orderId)
            } else {
                print("[Plgin]: TikTok uninstall")
            }
        default:
            break
        }
    }

}

// MARK: - Application
extension PluginManager {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        maps.forEach { _, plugin in
            plugin.application(app, open: url, options: options)
        }
        return true
    }
}

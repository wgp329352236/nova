//
//  Created on 2024/7/9.
//

import Foundation

class TrackingManager {

    private let adjust = AdjustTracking()
    private let td = TDTracking()
    private let firebase = FirebaseTracking()

//    private let trackingNames = ["Adjust", "TD", "Firebase"]
    static let manager = TrackingManager()

    var isInitialized = false

    let sharingData = SharingData()

    func initialize() {
        if isInitialized {
            return
        }
        isInitialized = true
        td.initialize()

        adjust.initialize()
        adjust.attributionBlock = { [unowned self] dictionary in
            td.userSet(dictionary)
        }
        let distinctId = td.distinctId
        addGlobalCallbackParameter(distinctId, forKey: "ta_distinct_id")
        let udid = SystemTools.deviceUDID()
        addGlobalCallbackParameter(udid, forKey: "nsdid")
        addGlobalCallbackParameter("\(LocalConfig.shared.gameCode ?? "")", forKey: "game_code")
        addGlobalCallbackParameter("\(LocalConfig.shared.sCode ?? "")", forKey: "store_code")
        addGlobalCallbackParameter(SystemTools.appIdentifier(), forKey: "bundle_id")
        addGlobalCallbackParameter(SdkReleaseInfo.shared.SDK_VERSION, forKey: "ns_sdk_version")

        sharingData.tdDistinctId = distinctId

        firebase.initialize()
        firebase.fcmTokenBlock = { [unowned self] (fcmToken, error) in
            if let fcmToken = fcmToken {
                td.userSet(["fcm_token": fcmToken])
            }
        }
        
    }
    
    func addGlobalCallbackParameter(_ value: String, forKey key: String) {
        adjust.addGlobalCallbackParameter(value, forKey: key)
    }

    func switchLanguage(_ language: String) {
        td.switchLanguage(language)
    }

    func setAPNSToken(_ apnsToken: Data) {
        adjust.setAPNSToken(apnsToken)
        firebase.setAPNSToken(apnsToken) { [self](fcmToken, error) in
            if let fcmToken = fcmToken {
                td.userSet(["fcm_token": fcmToken])
            }
        }
    }

    func trackUserAdd( _ params: [String: Any]) {
        td.userAdd(params)
    }

    func trackEvent(_ consumer: TrackingConsumer, _ eventName: String, _ params: [String: Any]? = nil) {
        switch consumer {
        case .adjust:
            adjust.trackEvent(eventName, params)
        case .td:
            td.trackEvent(eventName, params)
        case .firebase:
            firebase.trackEvent(eventName, params)
        case .facebook:
            Facebook.track(eventName, params)
        case .tiktok:
            PluginManager.manager.trackEvent(consumer, eventName, params)
        default: break
        }
    }

    func trackRevenue(_ consumer: TrackingConsumer, _ eventToken: String = "", _ price: Double, _ currency: String, _ orderId: String) {
        switch consumer {
        case .adjust:
            adjust.trackRevenue(eventToken, price, currency, orderId)
        case .firebase:
            firebase.trackRevenue(price, currency, orderId)
        case .facebook:
            Facebook.trackRevenue(price, currency, orderId)
        case .tiktok:
            PluginManager.manager.trackRevenue(consumer, eventToken, price, currency, orderId)
        default: break
        }
    }

    func trackAdRevenue(_ revenue: Double,
                        _ currency: String
    ) {
        Facebook.trackAdRevenue(revenue, currency)
    }

    func trackAdRevenue(_ mediation: String,
                        _ source: String = "",
                        _ placement: String = "",
                        _ adUnitId: String = "",
                        _ revenue: Double,
                        _ currency: String,
                        _ customerDataStr: String = ""
    ) {
        adjust.trackAdRevenue(mediation, source, placement, adUnitId, revenue, currency, customerDataStr)
    }

    func trackLogin(_ params: [String: Any]?) {
        if let player = BaseBridge.shared.player {
            td.login(params, player)
            firebase.login(player)
            PluginManager.manager.trackLogin(params, player)
            Facebook.setUserData(player)

            let userId = kvStorage.get(key: "fb_login_id")
            if userId.isNotEmpty {
                adjust.addGlobalCallbackParameter(userId, forKey: "fb_login_id")
            }

            if let email = player.email {
                adjust.addGlobalCallbackParameter(email, forKey: "em")
            }
        }
    }

    func trackGameRole(_ gameRole: GameRole) {
        td.setGameRole(gameRole)
    }

    func trackFirstEvent(_ name: String, _ firstCheckId: String, _ params: [String: Any]?) {
        td.trackFirstEvent(name, firstCheckId, params)
    }

    func userSet(_ params: [String: Any]) {
        td.userSet(params)
    }

    func userSetOnce(_ params: [String: Any]) {
        td.userSetOnce(params)
    }

    func setConsent(
            _ adStorage: Bool,
            _ analyticsStorage: Bool,
            _ adUserData: Bool,
            _ adPersonalization: Bool
    ) {
        firebase.setConsent(adStorage, analyticsStorage, adUserData, adPersonalization)
        adjust.trackThirdPartySharing(adPersonalization, adUserData)
    }
}

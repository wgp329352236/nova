//
//  Created on 2024/7/6.
//

import Foundation

// 10.23.0

import FirebaseCore
import FirebaseAnalytics
import FirebaseCrashlytics
import FirebaseMessaging


typealias FcmTokenBlock = (String?, Error?) -> Void

class FirebaseTracking: BaseTracking {
    override var trackingName: String {
        "Firebase"
    }

    var fcmTokenBlock: FcmTokenBlock?

    override func initialize() {
        if isInitialized {
            return
        }

        FirebaseApp.configure()
        
        if let appInstanceID = Analytics.appInstanceID(), appInstanceID.isNotEmpty {
            mdebug("appInstanceID=\(appInstanceID)")
            kvStorage.set(key: PackageSettingsKey.Firebase.shared.APP_INSTANCE_ID, data: appInstanceID)
        }

        isInitialized = true
    }

    func setAPNSToken(_ apnsToken: Data, _ block:@escaping(String?, Error?) -> Void) {
        Messaging.messaging().apnsToken = apnsToken
        Messaging.messaging().token { (fcmToken, error) in
            print("Messaging fcmToken = \(fcmToken ?? "") error = \(error.debugDescription)")
            block(fcmToken, error)
        }
    }

    func login(_ player: Player) {
        Analytics.logEvent(AnalyticsEventLogin, parameters: [AnalyticsParameterMethod: player.platform.platform])
        if let fcmToken = Messaging.messaging().fcmToken, let fcmTokenBlock {
            fcmTokenBlock(fcmToken, nil)
        }

        if player.playerId.isNotEmpty {
            Analytics.setUserID(player.playerId)
        }
    }

    override func trackEvent(_ eventName: String, _ params: [String: Any]?) {
        runAfterInitialized {
            do {
                let safeParams = self.filteredFirebaseParams(params)
                Analytics.logEvent(eventName, parameters: safeParams)
            } catch {
                mdebug("[Tracking]: Firebase - track - Params is error")
            }
        }
    }

    func filteredFirebaseParams(_ params: [String: Any]?) -> [String: Any]? {
        guard let params = params else { return nil }

        var result: [String: Any] = [:]

        for (key, value) in params {
            guard !key.isEmpty else { continue }

            switch value {
            case let string as String:
                result[key] = string
            case let number as NSNumber:
                result[key] = number
            case let array as [Any]:
                result[key] = array.filter { $0 is String || $0 is NSNumber }
            default:
                continue // 丢弃不合法类型，比如 NSDictionary、nil、NSNull、自定义对象
            }
        }

        return result.isEmpty ? nil : result
    }


    func trackRevenue(_ price: Double, _ currency: String, _ orderId: String) {
        mdebug("[Firebase]: trackRevenue price=\(price), currency=\(currency), orderId=\(orderId)")
        runAfterInitialized {
            Analytics.logEvent(FirebaseAnalytics.AnalyticsEventPurchase,
                    parameters: [
                        FirebaseAnalytics.AnalyticsParameterTransactionID: orderId,
                        FirebaseAnalytics.AnalyticsParameterCurrency: currency,
                        FirebaseAnalytics.AnalyticsParameterValue: price
                    ])
        }
    }


    func setConsent(_ adStorage: Bool,
                    _ analyticsStorage: Bool,
                    _ adUserData: Bool,
                    _ adPersonalization: Bool) {
        func status(from consent: Bool) -> ConsentStatus {
            if consent {
                return ConsentStatus.granted
            } else {
                return ConsentStatus.denied
            }
        }

        Analytics.setConsent([
            ConsentType.adStorage: status(from: adStorage),
            ConsentType.analyticsStorage: status(from: analyticsStorage),
            ConsentType.adUserData: status(from: adUserData),
            ConsentType.adPersonalization: status(from: adPersonalization)
        ])

    }

}

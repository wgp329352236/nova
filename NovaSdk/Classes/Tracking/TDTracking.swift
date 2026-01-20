//
//  Created on 2024/7/5.
//

import Foundation

import ThinkingSDK
import ThinkingDataCore
import ThinkingDataCore.TDApp
import TDRemoteConfig
import TDStrategy.TDStrategyResult
import TDStrategy.TDStrategySettings
import TDStrategy.TDStrategyTriggerDelegate
import FirebaseMessaging
import AdjustSdk

// Thinking Data 3.1.0
class TDTracking: BaseTracking {

    override var trackingName: String {
        "TD"
    }

    var distinctId: String {
        get {
            TDAnalytics.getDistinctId(withAppId: LocalConfig.shared.tdAppId)
        }
    }

    override func initialize() {
        if let appId = LocalConfig.shared.tdAppId,
           let serverUrl = LocalConfig.shared.tdServerUrl {
            let config = TDConfig(appId: appId, serverUrl: serverUrl)
            TDAnalytics.start(with: config)
            isInitialized = true

            TDAnalytics.enableAutoTrack(.all)
            TDAnalytics.enableThirdPartySharing(.adjust)

            if distinctId.isNotEmpty {
                mdebug("distinctId=\(distinctId)")
                kvStorage.set(key: PackageSettingsKey.TD.shared.TD_DISTINCT_ID, data: distinctId)
            }

            if let clientInfo = BaseBridge.shared.clientInfo {
                let superProperties: [String: Any] = [
                    "device_id": clientInfo.deviceId,
                    "game_code": clientInfo.gameCode,
                    "sCode": clientInfo.sCode,
                    "region_code": clientInfo.regionCode,
                    "sdk_version": clientInfo.sdkVersion,
                    "os": clientInfo.os,
                    "device_brand": clientInfo.deviceBrand,
                    "client_build_version": clientInfo.clientBuildVersion,
                    "game_lang": clientInfo.gameLanguage,
                    "package_name": clientInfo.packageName
                ]
                TDAnalytics.setSuperProperties(superProperties)
            }

            // 创建 TDSettings 实例并设置属性
            let settings = TDSettings()
            settings.mode = TDSDKMode.nomal
            settings.appId = appId
            settings.serverUrl = serverUrl

            TDApp.start(withSetting: settings)

            let handler = CustomStrategyHandler()
            TDStrategy.setTriggerDelegate(handler)
        }
    }

    class CustomStrategyHandler: NSObject, TDStrategyTriggerDelegate {
        func tdStrategyDidTrigger(_ result: TDStrategyResult) {

            if let content = result.content {
                mdebug("Custom implementation: \(content)")
                if let json = content.toJson() {
                    let messageObject = Message(jsonString: json)
                    if (messageObject.messageHandler == MessageHandler.sdk) {
                        let cancel = LocalizedString("unfrozen_button_text", "I got it")
                        let done = LocalizedString("common_button_go_now", "Go Now")

                        let message = (messageObject.messageType == .disc) ? LocalizedString("message_content_discord", "Join our Discord for the latest news, exciting events, and weekly gift codes!") : LocalizedString("message_content_wp", "Dear Player, An exciting website event is now live! Top up to receive a 5%–10% bonus, and accumulate top-ups to earn an exclusive gift code. Check the details here >>>")

                        if message.isNotEmpty {
                            BaseAlert.show(message, done, cancel) { index in
                                var clickResult = "close"
                                if index > 0 {
                                    clickResult = "go_link"
                                    if messageObject.link.isNotEmpty {
                                        BaseBridge.shared.showSafari(messageObject.link)
                                    } else {
                                        mdebug("Error: link is empty or invalid")
                                    }
                                }

                                self.trackMessageEvent(result, clickResult, messageObject)
                            }
                        }

                    }
                }
            }
        }

        private func trackMessageEvent(_ result: TDStrategyResult, _ clickResult: String, _ messageObject: Message) {
            TDAnalytics.track(EventName.MESSAGE_RESULT, properties: [
                "handler": messageObject.messageHandler.name,
                "type": messageObject.messageType.name,
                "result": clickResult,
                "task_id": result.taskId,
                "user_params": result.userParams ?? [],
                "ops_properties": result.opsProperties["#ops_receipt_properties"] ?? [],
            ])
        }

    }


    func switchLanguage(_ language: String) {
        let superProperties: [String: Any] = [
            "game_lang": language
        ]
        TDAnalytics.setSuperProperties(superProperties)
    }

    func login(_ params: [String: Any]?, _ player: Player) {
//        TDAnalytics.setDistinctId(player.playerId)
//        Messaging.messaging().token { (fcmToken, error) in
//            print("Messaging fcmToken = \(fcmToken) error = \(error)")
//            if let fcmToken = fcmToken {
//                TDAnalytics.userSet(["fcm_token": fcmToken])
//            }
//        }
    }

    func setGameRole(_ gameRole: GameRole) {
//        let player = BaseBridge.shared.player
//        let deviceId = BaseBridge.shared.clientInfo?.deviceId ?? ""
//        let userProperties: [String: Any] = [
//            "device_id": deviceId,
//            "player_id": player?.playerId ?? "",
//            "player_platform": player?.platform.platform ?? "",
//            "role_id": gameRole.roleId,
//            "role_name": gameRole.roleName,
//            "server_id": gameRole.serverId,
//            "server_name": gameRole.serverName,
//            "level": gameRole.level,
//            "vip_level": gameRole.vipLevel
//        ]
//        TDAnalytics.userSet(userProperties)

        let roleId = gameRole.roleId
        if roleId.count > 0 {
            TDAnalytics.login(roleId)
            TDAnalytics.enableThirdPartySharing(.adjust)
            Adjust.addGlobalCallbackParameter(roleId, forKey: "ta_account_id")
        }
    }

    func userSet(_ params: [String: Any]) {
        TDAnalytics.userSet(params)
    }

    func userSetOnce(_ params: [String: Any]) {
        TDAnalytics.userSetOnce(params)
        TDAnalytics.enableThirdPartySharing(.adjust)
    }

    func trackFirstEvent(_ name: String, _ firstCheckId: String, _ params: [String: Any]?) {
        let firstModel = TDFirstEventModel(eventName: name, firstCheckID: firstCheckId)
        if let params {
            firstModel.properties = params
        }
        TDAnalytics.track(with: firstModel)
    }

    func userAdd(_ params: [String: Any]) {
        TDAnalytics.userAdd(params)
    }

    override func trackEvent(_ eventName: String, _ params: [String: Any]?) {
        runAfterInitialized {
            do {
                TDAnalytics.track(eventName, properties: params)
            } catch {
                mdebug("[Tracking]: TDAnalytics - track - Params is error")
            }
        }
    }
}

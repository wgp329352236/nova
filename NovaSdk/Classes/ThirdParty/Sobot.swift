//
//

import Foundation

import SobotKit
import SobotCommon
import SobotChatClient

// v4.2.8
class Sobot {

    private var initialized = false
    private func tryInit(_ success:@escaping () -> Void, failure: ((Any) -> Void)? = nil) {
        if initialized {
            success()
            return
        }

        if let appKey = LocalConfig.shared.sobotAppKey, let host = LocalConfig.shared.sobotHost {
            mdebug("ZCSobot appKey = \(appKey), host = \(host)")

            ZCSobotApi.setAutoMatchTimeZone(true)
            ZCSobotApi.initSobotSDK(appKey, host: host) { [self] result in
                initialized = ZCLibClient.getZCLibClient().getInitState()
                if initialized {
                    success()
                } else if let failure = failure {
                    failure(result)
                }
            }
        }
    }

    func runAfterInitialized(_ block: @escaping () -> Void) {
        tryInit {
            block()
        }
    }

    func initialize() {
        tryInit({
            mdebug("ZCSobotApi init success")
        }, failure: { result in
            mdebug("ZCSobotApi init result = \(result)")
        })
    }

    /// open chat
    func show() -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>.init(waitFor: nil)
        runAfterInitialized {
            guard let initInfo = ZCLibClient.getZCLibClient().libInitInfo else {
                mdebug("ZCLibClient.getZCLibClient().libInitInfo = nil")
                promise.reject(reason: Throwable("ZCLibClient.getZCLibClient().libInitInfo = nil"))
                return
            }

            if let player = BaseBridge.shared.player {
                initInfo.partnerid = player.playerId
                initInfo.user_name = player.platform.platform
            } else {
                initInfo.partnerid = SystemTools.deviceUDID()
                initInfo.user_name = ""
            }
            
            if let gameRole = BaseBridge.shared.currentGameRole {
                initInfo.isVip = "\((gameRole.vipLevel > 0) ? 1 : 0)"
                initInfo.vip_level = "\(gameRole.vipLevel)"

                initInfo.customer_fields = [
                    "f96f32ee46dd47d8b46901ffc840d74b": "\(gameRole.serverId)",
                    "eddf134331af4c73ac49e10222333f71": gameRole.serverName,
                    "2a6eaf249fa84aafb7ced23cca97f771": gameRole.roleId,
                    "733c8418f18343c8ac089da1f2d7b7f3": gameRole.roleName,
                    "7c6b4774378c4d38b1734e45e778c5e2": "\(gameRole.level)"
                ]
            } else {
                initInfo.isVip = "0"
                initInfo.vip_level = ""

                initInfo.customer_fields = [
                    "f96f32ee46dd47d8b46901ffc840d74b": "",
                    "eddf134331af4c73ac49e10222333f71": "",
                    "2a6eaf249fa84aafb7ced23cca97f771": "",
                    "733c8418f18343c8ac089da1f2d7b7f3": "",
                    "7c6b4774378c4d38b1734e45e778c5e2": ""
                ]
            }

            if let clientInfo = BaseBridge.shared.clientInfo {
                let language = BaseBridge.shared.currentLanguage.lang.lowercased()
                initInfo.user_label = "\(language),\(clientInfo.gameCode),\(clientInfo.os)"
//                let languages = ZCSobotApi.getCurLanguagePreHeader()
                initInfo.default_language = "en_lproj"
                if language == "zh" {
                    initInfo.default_language = "zh-Hans_lproj"
                } else if language == "tw" {
                    initInfo.default_language = "zh-Hant_lproj"
                } else {
                    initInfo.absolute_language = "\(language)_lproj"
                }

                initInfo.params = [
                    "lang": language,
                    "gameCode": clientInfo.gameCode,
                    "os": clientInfo.os,
                    "bundleId" : clientInfo.packageName
                ]
            }

            ZCLibClient.getZCLibClient().libInitInfo = initInfo

            let uiInfo = ZCKitInfo()
//            uiInfo.topViewBgColor = UIColor.red
            uiInfo.isOpenRecord = false
            uiInfo.isOpenRobotVoice = false
            uiInfo.isShowTansfer = true
            uiInfo.themeStyle = 2

            ZCSobotApi.openZCChat(uiInfo, with: appTopViewController) { (result, type) in
                mdebug("ZCSobotApi open result = \(result)| type = \(type.rawValue)")
                if promise.state == PromiseState.pending {
                    if type == ZCPageStateType.viewShow {
                        promise.resolve(result: KotlinUnit())
                    } else {
                        promise.reject(reason: Throwable("\(result)"))
                    }
                }
            }
        }
        return promise
    }
}


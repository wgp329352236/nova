//
//  Created on 2024/6/16.
//

import Foundation
import HandyJSON

public enum ConfigOrientation {
    case portrait
    case landscape
}

var isPortrait: Bool {
    UIApplication.shared.statusBarOrientation.isPortrait
}

var isLandscape: Bool {
    UIApplication.shared.statusBarOrientation.isLandscape
}

let sdkLocalConfigData: NSDictionary? = {
    guard let configPath = Bundle.main.path(forResource: "SdkConfig", ofType: "plist") else {
        merror("Can't search SdkConfig file ")
        return nil
    }
    return NSDictionary(contentsOfFile: configPath)
}()

public class LocalConfig: HandyJSON {

    public static let shared: LocalConfig = {
        if sdkLocalConfigData != nil {
            return LocalConfig.deserialize(from: sdkLocalConfigData)!
        }
        return LocalConfig()
    }()

    public var orderVerifySecret: String?
    public var deeplinkUrlScheme: String?
    public var gameCode: String?
    public var sCode: String?
    public var regionCode: String?
    public var facebookAppId: String?
    public var facebookSharingUrl: String?
    public var sharingUrl: String?
    //  portrait landscape
    public var layoutOrientation: String?

    public var orientation: ConfigOrientation {
        if layoutOrientation == "portrait" {
            return .portrait
        }
        return .landscape
    }

    public var appleAppId: String?
    var domains: Dictionary<String, String>?

    var adjustAppToken: String?
    var adjustDefaultTracker: String?
    var adjustSecretId: String?
    var adjustInfo1: String?
    var adjustInfo2: String?
    var adjustInfo3: String?
    var adjustInfo4: String?
    var adjustWaitingInterval: String?

    var tdAppId: String?
    var tdServerUrl: String?

    var cmpId: String?
    var cmpDomain: String?

    var developerMode: String?
    var developerEnvironment: String?
    var sdkTag: String?
    var sobotAppKey: String?
    var sobotHost: String?

    public var maxSdkKey: String?
    public var maxRewardedUnitIds: String?
    public var maxAppOpenUnitIds: String?
    public var admobRewardedUnitIds: String?
    public var admobAppOpenUnitIds: String?

    public var vkClientId: String?
    public var vkClientSecret: String?

    public var lineChannelId: String?

    public var ttAppId: String?
    public var ttAppSecret: String?

    var hhGameToken: String?

    public var kakaoAppKey: String?


    required public init() {
    }

}



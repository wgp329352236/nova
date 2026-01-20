import Foundation

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

let sdkLocalConfigData: [String: Any]? = {
    guard let configPath = Bundle.main.path(forResource: "SdkConfig", ofType: "plist") else {
        merror("Can't search SdkConfig file ")
        return nil
    }
    return NSDictionary(contentsOfFile: configPath) as? [String: Any]
}()

public class LocalConfig: Codable {

    public static let shared: LocalConfig = {
        if let data = sdkLocalConfigData,
           let jsonData = try? JSONSerialization.data(withJSONObject: data),
           let config = try? JSONDecoder().decode(LocalConfig.self, from: jsonData) {
            return config
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

    // 如果需要自定义编码/解码逻辑，可以实现以下方法
    private enum CodingKeys: String, CodingKey {
        case orderVerifySecret
        case deeplinkUrlScheme
        case gameCode
        case sCode
        case regionCode
        case facebookAppId
        case facebookSharingUrl
        case sharingUrl
        case layoutOrientation
        case appleAppId
        case domains
        case adjustAppToken
        case adjustDefaultTracker
        case adjustSecretId
        case adjustInfo1
        case adjustInfo2
        case adjustInfo3
        case adjustInfo4
        case adjustWaitingInterval
        case tdAppId
        case tdServerUrl
        case cmpId
        case cmpDomain
        case developerMode
        case developerEnvironment
        case sdkTag
        case sobotAppKey
        case sobotHost
        case maxSdkKey
        case maxRewardedUnitIds
        case maxAppOpenUnitIds
        case admobRewardedUnitIds
        case admobAppOpenUnitIds
        case vkClientId
        case vkClientSecret
        case lineChannelId
        case ttAppId
        case ttAppSecret
        case hhGameToken
        case kakaoAppKey
    }
}

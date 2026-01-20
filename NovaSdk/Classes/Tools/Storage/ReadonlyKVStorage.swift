//
//  Created on 2024/6/16.
//

import Foundation

class IOSReadonlyKVStorage: ReadonlyKVStorage {

    let packageSetting = PackageSettingsKey.shared
    lazy var client: Dictionary<String, String> = {
        let clientKey = PackageSettingsKey.Client()
        return [clientKey.DEVICE_ID: SystemTools.deviceUDID(),
                clientKey.PACKAGE_NAME: SystemTools.appIdentifier(),
                clientKey.SDK_VERSION: SdkReleaseInfo.shared.SDK_VERSION,
                clientKey.OS: "ios",
                clientKey.OS_VERSION: SystemTools.deviceSystemVersion(),
                clientKey.IDFV: SystemTools.deviceIDFV(),
                clientKey.DEVICE_MODEL: SystemTools.deviceModel(),
                clientKey.DEVICE_BRAND: "APPLE",
                clientKey.CLIENT_VERSION: SystemTools.appVersion(),
                clientKey.CLIENT_BUILD_VERSION: SystemTools.buildVersion(),
                clientKey.JAILBREAK: "",
                clientKey.ADID: "",
                clientKey.ANDROIDID: "",
                packageSetting.REGION_CODE: LocalConfig.shared.regionCode ?? "NA"
        ]
    }()

//    var attribution: Dictionary<String, String> {
//        return Common.main.attribution
//    }

    func getDynamicSetting(_ key: String) -> String? {
        switch (key) {
        case PackageSettingsKey.Client().IDFA: return SystemTools.deviceIDFA()
        case packageSetting.NETWORK_ENVIRONMENT: return SystemTools.networkType()
        case packageSetting.NETWORK_OPERATOR: return SystemTools.networkOperator()
        case packageSetting.NETWORK_CLIENT_IP: return SystemTools.clientIP()
        default: return nil
        }
    }

    var dynamicSetting: Dictionary<String, String> {
        let network_environment = SystemTools.networkType()
        let network_operator = SystemTools.networkOperator()
        let network_client_ip = SystemTools.clientIP()
        return [packageSetting.NETWORK_ENVIRONMENT: network_environment,
                packageSetting.NETWORK_OPERATOR: network_operator,
                packageSetting.NETWORK_CLIENT_IP: network_client_ip]
    }

    lazy var staticSettings: Dictionary<String, String> = {
        let size = UIScreen.main.bounds.size
        let scale = UIScreen.main.scale
        let screen = "\(Int(size.width * scale))x\(Int(size.height * scale))"
        return [packageSetting.SCREEN: screen,
                packageSetting.MANUFACTURER: ""]
    }()

    func get(key: String) -> String {

        if sdkLocalConfigData == nil {
            merror("Can't search SdkConfig file")
            return ""
        }

        if key.isEmpty {
            merror("read key is empty")
            return ""
        }

        if (key == PackageSettingsKey.Client().IDFA) {
            return SystemTools.deviceIDFA()
        }

        //
        if let value = client[key] {
            return value
        }

        if let value = sdkLocalConfigData?[key] {
            var string = (value as! String)
            if key == "domain_config" {
                string = string.replacingOccurrences(of: "\\\"", with: "\"")
            }
            return string
        }

        if let value = getDynamicSetting(key), value.isNotEmpty {
            return value
        }

        if let value = staticSettings[key] {
            return value
        }
        
        if (key == PackageSettingsKey.shared.SF_CODE) {
            return kvStorage.get(key: key)
        }

//        if let value = attribution[key] {
//            return value
//        }

        return ""
    }
}


//
//  Created on 2024/6/18.
//

import Foundation

class LocalResource: NSObject {

    static let bundlePath: String = {
        let bundlePath = Bundle.main.path(forResource: "SdkResources", ofType: "bundle")
        assert(bundlePath != nil, "SdkResources.bundle file can't be find")
        return bundlePath!
    }()

    static var imagePath: String {
        get {
            "\(LocalResource.bundlePath)/image"
        }
    }

    static func languagesPath() -> String {
        "\(LocalResource.bundlePath)/language"
    }

    static func uiConfigFile() -> String {
        "\(LocalResource.bundlePath)/sdk_view_config.plist"
    }

    static var iconFontFile: String {
        get {
            "\(LocalResource.bundlePath)/font/iconfont.ttf"
        }
    }
}


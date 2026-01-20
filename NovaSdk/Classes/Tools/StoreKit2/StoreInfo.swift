//
// Created by on 2025/5/8.
//

import Foundation

open class StoreInfo: NSObject {
    @objc public var appId: String
    @objc public var countryCode: String

    init(_ appId: String, _ countryCode: String) {
        self.appId = appId
        self.countryCode = countryCode
        super.init()
    }
}

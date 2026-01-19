//
//  Created on 2024/7/6.
//

import Foundation


@objc
public class UnInstalledApp: Throwable {
}

@objc
public class ShareException: NSObject {
    @objc static public let cancelException = Throwable("share be canceled")
    @objc static public let failedException = Throwable("share failed")
    @objc static public let imageTypeException = Throwable("image type note support")
    @objc static public let notResourceException = Throwable("all resources(image link text) is empty")
    @objc static public let authException = Throwable("auth failed")
    @objc static public let unknownException = Throwable("share unknown error")
    @objc static public let shareException = Throwable("share failed")
    @objc static public let unknownPlatform = Throwable("platforms is empty")
    @objc static public let nonsupportPlatform = Throwable("not support platform")
    @objc static public let notInstalledApp = Throwable("not installed facebook app")
}

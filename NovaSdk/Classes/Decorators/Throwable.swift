//
//  Created on 2024/6/16.
//

import Foundation


import Foundation

extension Throwable {
    static public let UserCancel = Throwable("User Cancel")
    static public let Unsupported = Throwable("Unsupported")
    static public let UnInstall = Throwable("UnInstall")
    static public let UnLogin = Throwable("User UnLogin")
    static public let UnOpen = Throwable("Not turned on")
    static public let AlertException = Throwable("Alert has shown")
    static public let Unknown = Throwable("Unknown")
    static public let Exit = Throwable("Exit")
}

class UserDismissReason: Throwable {
}

class UserCloseReason: Throwable {
}

class GameCenterUnLoginReason: Throwable {
}

class PlayerAlreadyConnectedReason: Throwable {
}

public class Throwable: KotlinThrowable {

    public var code: Int = -1

    public init(_ throwable: KotlinThrowable) {
        super.init(message: throwable.message)
    }

    public init(_ message: String?) {
        super.init(message: message ?? "")
    }

    public init(_ code: Int, _ message: String?) {
        self.code = code
        super.init(message: message ?? "")
    }
}



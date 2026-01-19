//
//  Created on 2024/6/16.
//


import UIKit
import Foundation

let sdkMmapId: String = "NOVA_MMAP_ID"

// MARK: -
let appKeyWindow: UIWindow = {
    if #available(iOS 13.0, *) {
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
            return window
        }
        if let window = UIApplication.shared.windows.first(where: { ($0.windowLevel == UIWindow.Level(rawValue: 0)) }) {
            return window
        }
        return UIWindow()
    } else {
        return UIApplication.shared.keyWindow!
    }
}()

let appSafeAreaInsets: UIEdgeInsets = {
    if #available(iOS 11.0, *) {
        return appKeyWindow.safeAreaInsets
    }
    return .zero
}()

let appRootViewController: UIViewController = appKeyWindow.rootViewController!

var screenWidth: CGFloat {
    if isPortrait {
        return min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    }
    return max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
}

var screenHeight: CGFloat {
    if isPortrait {
        return max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
    }
    return min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
}

public var appTopViewController: UIViewController {
    var topController: UIViewController
    if #available(iOS 13.0, *) {
        topController = appRootViewController
    } else {
        topController = appKeyWindow.rootViewController!
    }

    if topController is UINavigationController {
        topController = (topController as! UINavigationController).visibleViewController!
    }

    while let presentedController = topController.presentedViewController {
        topController = presentedController
    }

    return topController
}

let DEVICE_IDIOM_IPAD: Bool = {
    if #available(iOS 13.0, *) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        }
    } else {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return true
        }
    }
    return false
}()

public func LocalizedString(_ key: String, _ value: String) -> String {
    let language = BaseBridge.shared.currentLanguage.lang.lowercased()
    let languageFileName = "\(language).lproj"
    let bundlePath = "\(LocalResource.languagesPath())/\(languageFileName)"
    if let bundle = Bundle(path: bundlePath) {
        return NSLocalizedString(key, tableName: "sdktext", bundle: bundle, value: value, comment: value)
    }
    return value
}


func Toast(_ message: String, _ afterDelay: TimeInterval = 2.5) {
    let HUD = MBProgressHUD.showAdded(to: appKeyWindow, animated: true)
    HUD.mode = .text
    HUD.detailsLabel.text = message
    HUD.removeFromSuperViewOnHide = true
    DispatchQueue.main.async {
        HUD.hide(animated: true, afterDelay: afterDelay)
    }
}

let replaceMark: String = "$mark$"

let gameTheme = BaseBridge.shared.baseGameTheme!

let sdkLanguage = BaseBridge.shared.currentLanguage

let kvStorage = PersistentMutableKVStorage()

func runInMain(_ block: @escaping () -> Void) {
    DispatchQueue.main.async {
        block()
    }
}




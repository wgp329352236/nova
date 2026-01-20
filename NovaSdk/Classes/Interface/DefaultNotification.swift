//
//  Created on 2024/6/16.
//

import UIKit
import Foundation

class DefaultNotification {

    func startListen() {
//        addObserver(selector: #selector(didFinishLaunching), name: UIApplication.didFinishLaunchingNotification)
        addObserver(selector: #selector(didBecomeActive), name: UIApplication.didBecomeActiveNotification)
        addObserver(selector: #selector(didEnterBackground), name: UIApplication.didEnterBackgroundNotification)
    }

    func addObserver(selector: Selector, name: NSNotification.Name?) {
        NotificationCenter.default.addObserver(self,
                selector: selector,
                name: name,
                object: nil)
    }

    @objc func didFinishLaunching(_ notification: Notification) {

    }

    @objc func didBecomeActive() {
        // MARK: - for iOS15+
        BaseBridge.shared.isActive = true
        IDFAControl.shared.requestTracking()
        BaseBridge.shared.onBecomeActive()
    }

    /// enter background
    @objc func didEnterBackground() {
        BaseBridge.shared.isActive = false
        BaseBridge.shared.onEnterBack()
    }

}

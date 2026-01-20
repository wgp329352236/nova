//
//  Created on 2024/6/18.
//

import Foundation
import MBProgressHUD

public struct Loading {

    public static func show(_ onView: UIView) -> MBProgressHUD {
        let loading = MBProgressHUD.showAdded(to: onView, animated: true)
        loading.removeFromSuperViewOnHide = true
        loading.mode = .indeterminate
        return loading
    }

    public static func overlayView() -> UIView {
        if let layer = appTopViewController.view {
            return layer
        }

        return appKeyWindow
    }

    @discardableResult
    public static func showOverlay() -> MBProgressHUD {
        let loading = MBProgressHUD.showAdded(to: overlayView(), animated: true)
        loading.mode = .indeterminate
        return loading
    }

    public static func hide() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: overlayView(), animated: true)
        }
    }
}


extension MBProgressHUD {
    public func hide() {
        DispatchQueue.main.async {
            self.hide(animated: true)
        }
    }
}




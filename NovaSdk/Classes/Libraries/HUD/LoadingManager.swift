//
//

import Foundation
import MBProgressHUD

class LoadingManager: NSObject {

    public static let manager: LoadingManager = {
        let instance = LoadingManager()
        return instance
    }()

    private var loadings: [MBProgressHUD] = []

    func show(_ onView: UIView?) {
        let loading = MBProgressHUD.init(view: onView ?? appRootViewController.view)
        loading.removeFromSuperViewOnHide = true
        loading.mode = .indeterminate
        (onView ?? appRootViewController.view)?.addSubview(loading)
        loading.isHidden = true

        display(loading)
    }

    private func display(_ loading: MBProgressHUD) {
        // 当前有loading
        if loadings.count > 0 {
            if let last = loadings.last {
                last.show(animated: true)
            }
            loadings.append(loading)
        } else {
            loading.isHidden = false
            loading.show(animated: true)
        }
    }

    func hide() {
        if let loading = loadings.last {
            loading.hide()
        }
    }

    func hideAll() {
        loadings.forEach { (loading) in
            loading.hide()
        }
    }
}


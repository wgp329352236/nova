//
//  Created on 2024/7/7.
//

import Foundation

class BaseNavigationController: UINavigationController {
    //Hide Statusbar
    override var prefersStatusBarHidden: Bool {
        true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }

    // MARK: orientation
    override var shouldAutorotate: Bool {
        if supportedOrientation == .portrait {
            return false
        } else {
            return true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if supportedOrientation == .portrait {
            return .portrait
        } else {
            return .landscape
        }
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if supportedOrientation == .portrait {
            return .portrait
        } else {
            return .landscapeRight
        }
    }

}

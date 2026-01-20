//
//  Created on 2024/6/20.
//

import Foundation
import UIKit

let onDismissReason = Throwable("View Dismiss")
let onCloseReason = Throwable("View Close")

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func onViewDismiss(_ animated: Bool) {

    }

    @objc func onViewClose() {

    }
}

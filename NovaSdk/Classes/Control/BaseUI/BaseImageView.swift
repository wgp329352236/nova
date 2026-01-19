//
//  Created on 2024/6/21.
//

import Foundation

class BaseImageView: UIImageView {

    private var tapGestureRecognizer = UITapGestureRecognizer()
    var canTap: Bool {
        get {
            isUserInteractionEnabled
        }
        set {
            isUserInteractionEnabled = newValue
            if newValue {
                addGestureRecognizer(tapGestureRecognizer)
            }
        }
    }

    func addTarget(_ target: Any, action: Selector) {
        if !isUserInteractionEnabled {
            mdebug("This control can't tap")
            return
        }
        tapGestureRecognizer.removeTarget(target, action: action)
        tapGestureRecognizer.addTarget(target, action: action)
    }
}

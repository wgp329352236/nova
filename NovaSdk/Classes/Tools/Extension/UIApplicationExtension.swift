//
//  Created on 2024/6/16.
//

import Foundation

extension UIApplication {
    static var safeAreaInsets: UIEdgeInsets {
        get {
            if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                return window.safeAreaInsets
            } else {
                return .zero
            }
        }
    }
}

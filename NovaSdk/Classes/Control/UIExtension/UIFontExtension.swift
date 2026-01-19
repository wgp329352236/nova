//
//  Created on 2024/6/20.
//

import Foundation

extension UIFont {
    // default button title font
    class var titleFont: UIFont {
        if DEVICE_IDIOM_IPAD {
            return UIFont.systemFont(ofSize: 17)
        }
        return UIFont.systemFont(ofSize: 14)
    }

    // default text font
    class var textFont: UIFont {
        UIFont.systemFont(ofSize: 16)
    }

    class var font20: UIFont {
        UIFont.systemFont(ofSize: 10)
    }
    class var font22: UIFont {
        UIFont.systemFont(ofSize: 11)
    }
    class var font24: UIFont {
        UIFont.systemFont(ofSize: 12)
    }
    class var font26: UIFont {
        UIFont.systemFont(ofSize: 13)
    }
    class var font28: UIFont {
        UIFont.systemFont(ofSize: 14)
    }
    class var font30: UIFont {
        UIFont.systemFont(ofSize: 15)
    }
    class var font32: UIFont {
        UIFont.systemFont(ofSize: 16)
    }
    class var font34: UIFont {
        UIFont.systemFont(ofSize: 17)
    }
    class var font36: UIFont {
        UIFont.systemFont(ofSize: 18)
    }
    class var font38: UIFont {
        UIFont.systemFont(ofSize: 19)
    }
    class var font40: UIFont {
        UIFont.systemFont(ofSize: 20)
    }
    class var font48: UIFont {
        UIFont.systemFont(ofSize: 24)
    }

    class var boldFont32: UIFont {
        UIFont.boldSystemFont(ofSize: 16)
    }
    class var boldFont36: UIFont {
        UIFont.boldSystemFont(ofSize: 18)
    }
    class var boldFont40: UIFont {
        UIFont.boldSystemFont(ofSize: 20)
    }

}


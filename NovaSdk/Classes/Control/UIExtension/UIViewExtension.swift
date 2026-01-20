//
//  Created on 2024/6/20.
//

import Foundation
import UIKit

extension UIView {
    var height: CGFloat {
        get {
            self.frame.size.height
        }
        set {
            self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: self.frame.size.width, height: newValue))
        }
    }

    var width: CGFloat {
        get {
            self.frame.size.width
        }
        set {
            self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: newValue, height: self.frame.size.height))
        }
    }

    var x: CGFloat {
        get {
            self.frame.origin.x
        }
        set {
            self.frame = CGRect(origin: CGPoint(x: newValue, y: self.frame.origin.y), size: self.frame.size)
        }
    }

    var y: CGFloat {
        get {
            self.frame.origin.y
        }
        set {
            self.frame = CGRect(origin: CGPoint(x: self.frame.origin.x, y: newValue), size: self.frame.size)
        }
    }

    var minX: CGFloat {
        x
    }

    var maxX: CGFloat {
        x + width
    }

    var minY: CGFloat {
        y
    }

    var maxY: CGFloat {
        y + height
    }

    var centerX: CGFloat {
        get {
            self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }

    var centerY: CGFloat {
        get {
            self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }

    var viewController: UIViewController? {
        var next = next
        while next != nil {
            if next is UIViewController {
                return next as? UIViewController
            }
            next = next?.next
        }
        return nil
    }

    func setCornerRadius(cornerRadius: CGFloat) {
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }

    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }

    var screenshot: UIImage? {
        get {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, UIScreen.main.scale)
            layer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext();
            return image;
        }
    }

    func addCorner(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }

}


//
//  Created on 2024/6/20.
//

import UIKit

extension UIButton {

    func setTitleFont(font: UIFont) {
        titleLabel?.font = font
    }

    func setNormalTitle(title: String) -> Void {
        setTitle(title, for: .normal)
    }

    func setSelectedTitle(title: String) -> Void {
        setTitle(title, for: .selected)
    }

    func setNormalTitleColor(color: UIColor) -> Void {
        setTitleColor(color, for: .normal)
    }

    func setSelectedTitleColor(color: UIColor) -> Void {
        setTitleColor(color, for: .selected)
    }

    func setSelectedBackgroundImage(image: UIImage) -> Void {
        setBackgroundImage(image, for: .normal)
    }

    func setNormalBackgroundImage(image: UIImage) -> Void {
        setBackgroundImage(image, for: .selected)
    }

    func setContext(_ title: String?, _ titleColor: UIColor?, _ backgroundImage: UIImage? = nil, for state: UIControl.State) {
        if title != nil {
            setTitle(title, for: state)
        }

        if titleColor != nil {
            setTitleColor(titleColor, for: state)
        }

        if backgroundImage != nil {
            setBackgroundImage(backgroundImage, for: state)
        }
    }

    func setNormalBackgroundImage(_ borderWidth: CGFloat?, _ borderColor: UIColor?, _ cornerRadius: CGFloat?) {
        if (borderWidth == nil) && (borderColor == nil) && (cornerRadius == nil) {
            return
        }

        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        if borderWidth != nil {
            layer.borderWidth = borderWidth!
        }
        if borderColor != nil {
            layer.borderColor = borderColor!.cgColor
        }
        if cornerRadius != nil {
            layer.cornerRadius = cornerRadius!
        }
        layer.masksToBounds = true
    }

    func defaultBorder() {
        // 创建一个仅用于遮罩的 layer
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds // 设置 frame
        maskLayer.path = UIBezierPath(roundedRect: maskLayer.bounds, cornerRadius: 5).cgPath
        self.layer.mask = maskLayer
//        setCornerRadius(cornerRadius: 5)
    }
}

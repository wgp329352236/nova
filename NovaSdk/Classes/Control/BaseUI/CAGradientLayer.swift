//
//  Created on 2024/6/21.
//

import Foundation

// MARK: LinearGradient
extension CAGradientLayer {
    func linearGradient() -> CAGradientLayer {
        let leftColor = UIColor.hexColor("0x4DA2FF")
        let rightColor = UIColor.hexColor("0x0083D5")
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = [leftColor, rightColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        return gradientLayer

//        gradientLayer.frame = self.view.frame
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

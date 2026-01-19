//
//  Created on 2024/6/21.
//

import Foundation

extension ThemeTitle {
    var font: UIFont {
        get {
            bold ? .boldSystemFont(ofSize: CGFloat(fontSize)) : .systemFont(ofSize: CGFloat(fontSize))
        }
    }

    var boldFont: UIFont {
        get {
            .boldSystemFont(ofSize: CGFloat(fontSize))
        }
    }
}

extension ThemeButton {
    var font: UIFont {
        get {
            bold ? .boldSystemFont(ofSize: CGFloat(fontSize)) : .systemFont(ofSize: CGFloat(fontSize))
        }
    }

    var boldFont: UIFont {
        get {
            .boldSystemFont(ofSize: CGFloat(fontSize))
        }
    }
}

extension ThemeBorderTextField {
    var font: UIFont {
        get {
            .systemFont(ofSize: CGFloat(fontSize))
        }
    }

    var boldFont: UIFont {
        get {
            .boldSystemFont(ofSize: CGFloat(fontSize))
        }
    }
}

extension ThemeCell {
    var titleFont: UIFont {
        get {
            titleTextBold ? .boldSystemFont(ofSize: CGFloat(titleFontSize)) : .systemFont(ofSize: CGFloat(titleFontSize))
        }
    }

    var selectedTitleFont: UIFont {
        get {
            titleTextSelectedBold ? .boldSystemFont(ofSize: CGFloat(titleFontSize)) : .systemFont(ofSize: CGFloat(titleFontSize))
        }
    }
}

extension UIColor {
    /// return light or dark theme color
    /// - Parameters:
    ///   - themeColor: ThemeColor(light or dark)
    /// - Returns: adaptive color
    static func dynamicColor(_ themeColor: ThemeColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { traitCollection in
                if traitCollection.userInterfaceStyle == .dark {
                    return .hexColor(themeColor.dark)
                } else {
                    return .hexColor(themeColor.light)
                }
            })
        } else {
            return .hexColor(themeColor.light)
        }
    }
}


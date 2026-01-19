//
//  Created on 2024/6/21.
//

import Foundation
import CoreGraphics

enum IconUnicodeValue: String {
    case back = "\u{e633}"
    case next = "\u{e645}"
    case close = "\u{e8b6}"
    case addUser = "\u{e634}"
    case eyeOpen = "\u{e610}"
    case eyeClose = "\u{e679}"

    case add = "\u{e64e}"
    case drop = "\u{e654}"
    case connect = "\u{e62e}"
}

fileprivate let iconFontName = "iconfont"
fileprivate var fontRegistered = false

extension UIFont {
    static func iconFont(fontSize: CGFloat) -> UIFont? {
        if !fontRegistered {
            for family in UIFont.familyNames {
                if !UIFont.fontNames(forFamilyName: family).contains(where: { $0 == iconFontName }) {
                    var errorRef: Unmanaged<CFError>? = nil
                    if let data = try? Data(contentsOf: URL(fileURLWithPath: LocalResource.iconFontFile)) as CFData,
                       let dataProvider = CGDataProvider(data: data),
                       let font = CGFont(dataProvider) {
                        CTFontManagerRegisterGraphicsFont(font, &errorRef)
                        if (errorRef != nil) {
                            merror("register sdk font failed, info: \(errorRef.debugDescription).")
                        }
                    } else {
                        merror("register sdk font failed info: font file error.")
                    }
                    fontRegistered = true
                    break
                }
            }
        }
        return UIFont(name: iconFontName, size: fontSize)
    }
}


let iconFontDefaultSize: CGFloat = 24
let iconImageDefaultSize: CGSize = CGSize(width: 24, height: 24)

extension UIImage {

//    fileprivate let ICON_FONT_DEFAULT_SIZE: CGFloat = 24
//    fileprivate let ICON_IMAGE_DEFAULT_SIZE = CGSize(width: 24, height: 24)


    static func iconImage(
            iconFont: IconUnicodeValue,
            size: CGSize = iconImageDefaultSize,
            fontSize: CGFloat = iconFontDefaultSize,
            textColor: UIColor = .black,
            backgroundColor: UIColor = .clear,
            cornerRadius: CGFloat = 0
    ) -> UIImage? {
        if let font = UIFont.iconFont(fontSize: fontSize) {
            let drawText = iconFont.rawValue
            UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
            backgroundColor.setFill()
            UIBezierPath(
                    roundedRect: CGRect(origin: .zero, size: size),
                    cornerRadius: cornerRadius
            ).fill()
            let rect = CGRect(
                    x: (size.width - fontSize) / 2,
                    y: (size.height - fontSize) / 2,
                    width: size.width,
                    height: size.height
            )
            drawText.draw(
                    in: rect,
                    withAttributes: [
                        .font: font,
                        .foregroundColor: textColor,
                        .backgroundColor: UIColor.clear,
                    ]
            )
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
        return nil
    }
}



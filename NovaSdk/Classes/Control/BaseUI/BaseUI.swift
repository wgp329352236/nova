//
//  Created on 2024/6/20.
//

import Foundation

// MARK: control size
let controlWidth: CGFloat = 280
let controlHeight: CGFloat = 44
let controlCornerRadius: CGFloat = 5


// MARK: - button
let buttonTitleFont: UIFont = UIFont.font32
let buttonWidth: CGFloat = 44
let buttonHeight: CGFloat = 44
let buttonSize: CGSize = CGSize(width: buttonWidth, height: buttonHeight)

let buttonBGColor = UIColor.hexColor("0x1989fa")


enum SdkOrientation {
    case portrait
    case landscape
}

var supportedOrientation: SdkOrientation {
    guard let infoDict = Bundle.main.infoDictionary else { return SdkOrientation.portrait}

    if let iPhoneOrientations = infoDict["UISupportedInterfaceOrientations~iphone"] as? [String] {
        if iPhoneOrientations.contains("UIInterfaceOrientationLandscapeLeft") || iPhoneOrientations.contains("UIInterfaceOrientationLandscapeRight") {
            return SdkOrientation.landscape
        }
        return SdkOrientation.portrait
    }

    if let iPadOrientations = infoDict["UISupportedInterfaceOrientations~ipad"] as? [String] {
        if iPadOrientations.contains("UIInterfaceOrientationLandscapeLeft") || iPadOrientations.contains("UIInterfaceOrientationLandscapeRight") {
            return SdkOrientation.landscape
        }
        return SdkOrientation.portrait
    }
    return .portrait
}



// MARK: - TextField
let textFieldTextFont: UIFont = UIFont.font32
let textFieldWidth: CGFloat = 280
let textFieldHeight: CGFloat = 44
let textFieldSize: CGSize = CGSize(width: textFieldWidth, height: textFieldHeight)

let gameLogoSize = CGSize(width: 36, height: 36)

// text
let TEXT_FONT_24 = UIFont.systemFont(ofSize: 12)
let TEXT_FONT_26 = UIFont.systemFont(ofSize: 13)
let TEXT_FONT_28 = UIFont.systemFont(ofSize: 14)
let TEXT_FONT_30 = UIFont.systemFont(ofSize: 15)
let TEXT_FONT_32 = UIFont.systemFont(ofSize: 16)
let TEXT_FONT_34 = UIFont.systemFont(ofSize: 17)
let TEXT_FONT_36 = UIFont.systemFont(ofSize: 18)
let TEXT_FONT_38 = UIFont.systemFont(ofSize: 19)
let TEXT_FONT_40 = UIFont.systemFont(ofSize: 20)

let TEXT_FONT_BOLD_24 = UIFont.boldSystemFont(ofSize: 12)
let TEXT_FONT_BOLD_26 = UIFont.boldSystemFont(ofSize: 13)
let TEXT_FONT_BOLD_28 = UIFont.boldSystemFont(ofSize: 14)
let TEXT_FONT_BOLD_32 = UIFont.boldSystemFont(ofSize: 16)
let TEXT_FONT_BOLD_34 = UIFont.boldSystemFont(ofSize: 17)
let TEXT_FONT_BOLD_36 = UIFont.boldSystemFont(ofSize: 18)

class BaseUI {

    // MARK: - View
    static let contentView: BaseView = BaseView(.clear)

    static func view(_ backgroundColor: UIColor = .clear) -> BaseView {
        BaseView(backgroundColor)
    }

    static func company() -> BaseView {
        CompanyLogoView()
    }

    static func separate(_ text: String, _ hideLine: Bool = false) -> BaseView {
        SeparateView(text, hideLine)
    }

    // MARK: - ImageView
    static func imageView(_ imageName: String? = nil) -> BaseImageView {
        if imageName != nil {
            return BaseImageView(image: UIImage.imageName(name: imageName!))
        }
        return BaseImageView()
    }


    static func normalTextView(_ text: String? = nil, _ font: UIFont? = nil, _ textColor: UIColor? = nil) -> BaseTextView {
        let textView = BaseTextView.init(.normal)
        if text != nil {
            textView.text = text
        }
        if font != nil {
            textView.font = font
        }
        if textColor != nil {
            textView.textColor = textColor
        }
        return textView
    }

}

extension BaseUI {
    // MARK: - Label
    static func line(_ backgroundColor: UIColor = .dynamicColor(gameTheme.splitLine.backgroundColor)) -> BaseLabel {
        BaseLabel(text: nil, font: nil, textColor: nil, backgroundColor: backgroundColor, textAlignment: nil)
    }

    static func label(_ text: String? = nil, _ font: UIFont? = nil) -> BaseLabel {
        BaseLabel(text: text, font: font, textColor: nil, backgroundColor: nil, textAlignment: nil)
    }

    static func label(textColor: UIColor? = nil, backgroundColor: UIColor? = nil) -> BaseLabel {
        BaseLabel(text: nil, font: nil, textColor: textColor, backgroundColor: nil, textAlignment: nil)
    }

    static func label(font: UIFont) -> BaseLabel {
        BaseLabel(text: nil, font: font, textColor: nil, backgroundColor: nil, textAlignment: nil)
    }

    static func label(text: String? = nil, font: UIFont? = nil, textColor: UIColor? = nil, textAlignment: NSTextAlignment? = .left) -> BaseLabel {
        BaseLabel(text: text, font: font, textColor: textColor, backgroundColor: nil, textAlignment: textAlignment)
    }

    static func label(text: String?, font: UIFont?, textColor: UIColor?, backgroundColor: UIColor?, textAlignment: NSTextAlignment?) -> BaseLabel {
        BaseLabel(text: text, font: font, textColor: textColor, backgroundColor: backgroundColor, textAlignment: textAlignment)
    }

    static func icon(_ unicode: String, size: CGFloat?, color: UIColor?) -> BaseLabel {
        BaseLabel(text: unicode, font: UIFont.iconFont(fontSize: size ?? iconFontDefaultSize), textColor: color, backgroundColor: nil, textAlignment: .center)
    }
}

extension BaseUI {
    // MARK: -  Button
    static func button() -> BaseButton {
        let button = BaseButton()
        return button
    }

    static func normalButton(title: String? = "",
                             textFont: UIFont? = gameTheme.button.font,
                             textColor: UIColor? = UIColor.dynamicColor(gameTheme.button.textColor),
                             normalBGImage: UIImage? = UIImage.color(color: UIColor.dynamicColor(gameTheme.button.backgroundColor)),
                             highlightedBGImage: UIImage? = UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor)),
                             selectedBGImage: UIImage? = UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor))) -> BaseButton {
        let button = BaseButton(title: title,
                textFont: textFont,
                textColor: textColor,
                normalBGImage: normalBGImage,
                highlightedBGImage: highlightedBGImage,
                selectedBGImage: selectedBGImage)
        return button
    }

    static func roundedRectButton(title: String? = "",
                                  textFont: UIFont? = gameTheme.button.font,
                                  textColor: UIColor? = UIColor.dynamicColor(gameTheme.button.textColor),
                                  normalBGImage: UIImage? = UIImage.color(color: UIColor.dynamicColor(gameTheme.button.backgroundColor)),
                                  highlightedBGImage: UIImage? = UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor)),
                                  selectedBGImage: UIImage? = UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor))) -> BaseButton {
        let button = BaseButton(title: title,
                textFont: textFont,
                textColor: textColor,
                normalBGImage: normalBGImage,
                highlightedBGImage: highlightedBGImage,
                selectedBGImage: selectedBGImage)
        button.defaultBorder()
        return button
    }

    static func imageButton(normalImage: UIImage? = nil,
                            highlightedImage: UIImage? = nil,
                            selectedImage: UIImage? = nil,
                            disabledImage: UIImage? = nil,
                            normalBGImage: UIImage? = nil,
                            highlightedBGImage: UIImage? = nil,
                            selectedBGImage: UIImage? = nil
    ) -> BaseButton {
        BaseButton(normalImage: normalImage,
                highlightedImage: highlightedImage,
                selectedImage: selectedImage,
                disabledImage: disabledImage,
                normalBGImage: normalBGImage,
                highlightedBGImage: highlightedBGImage,
                selectedBGImage: selectedBGImage)
    }

    static func roundButton(_ normalBGImage: UIImage?, _ highlightedBGImage: UIImage?, _ selectedBGImage: UIImage?) -> BaseButton {
        let button = BaseButton(
                normalBGImage: normalBGImage,
                highlightedBGImage: highlightedBGImage,
                selectedBGImage: selectedBGImage)
        button.setCornerRadius(cornerRadius: button.width / 2)
        return button
    }

    static func confirmButton(_ title: String = LocalizedString("ok", "Ok")) -> BaseButton {
        let button = BaseButton(title: title,
                textFont: gameTheme.button.font,
                textColor: .dynamicColor(gameTheme.button.textColor),
                normalBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.backgroundColor)),
                highlightedBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor)),
                selectedBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor)))
        button.defaultBorder()
        return button
    }

    static func loginButton(_ title: String = LocalizedString("login_submit", "Login")) -> BaseButton {
        let button = BaseButton(title: title,
                textFont: gameTheme.button.font,
                textColor: .dynamicColor(gameTheme.button.textColor),
                normalBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.backgroundColor)),
                highlightedBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor)),
                selectedBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor)))
        button.defaultBorder()
        return button
    }

    static func quickLoginButton(_ title: String = LocalizedString("quick_login", "Play Now")) -> BaseButton {
        let button = BaseButton(title: title,
                textFont: gameTheme.button.font,
                textColor: .dynamicColor(gameTheme.button.textColor),
                normalBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.backgroundColor)),
                highlightedBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor)),
                selectedBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor)),
                disabledBGImage: nil)
        button.defaultBorder()

        let rocketImage = UIImage.imageName(name: "quicklogin_rocket")
        let rocketImageView = UIImageView(image: rocketImage)
        button.addSubview(rocketImageView)
        rocketImageView.isUserInteractionEnabled = false
        rocketImageView.snp.makeConstraints { maker in
            maker.centerY.equalTo(button)
            maker.right.equalTo(button.titleLabel!.snp.left).offset(-25)
        }
        return button
    }

    static func logoButton(_ iconName: String? = nil, _ title: String? = nil) -> BaseButton {
        let button = LogoButton(iconName, title)
        return button
    }

}

extension BaseUI {
    // MARK: TextField
    static func normalTextField(_ placeholder: String) -> BaseTextField {
        BaseTextField(font: nil, textColor: nil, placeholder: placeholder, keyboardType: .asciiCapable, type: .none)
    }

    static func contentTextField(_ placeholder: String = LocalizedString("hint_username", "Email/Cellphone")) -> BaseTextField {
        BaseTextField(font: nil, textColor: nil, placeholder: placeholder, keyboardType: .asciiCapable, type: .clear)
    }

    static func emailTextField(_ placeholder: String = LocalizedString("hint_email", "Email")) -> BaseTextField {
        BaseTextField(font: nil, textColor: nil, placeholder: placeholder, keyboardType: .emailAddress, type: .clear)
    }

    static func phoneTextField(_ placeholder: String = LocalizedString("hint_phone", "Cellphone")) -> BaseTextField {
        let textField = BaseTextField(font: nil, textColor: nil, placeholder: placeholder, keyboardType: .numberPad, type: .clear)
        textField.showLeftView()
        return textField
    }

    static func passwordTextField(_ placeholder: String = LocalizedString("input_password", "Password")) -> BaseTextField {
        BaseTextField(font: nil, textColor: nil, placeholder: placeholder, keyboardType: .asciiCapable, type: .secure)
    }

    static func authCodeTextField(_ placeholder: String = LocalizedString("hint_code", "Verification Code")) -> BaseTextField {
        BaseTextField(font: nil, textColor: nil, placeholder: placeholder, keyboardType: .numberPad, type: .code)
    }


}

extension BaseUI {
    // MARK: - Alert
    @discardableResult
    static func alert(_ message: String, done: String, _ callback: @escaping (_ index: NSInteger) -> Void) -> BaseAlert {
        BaseAlert.show(message, done, nil, callback)
    }

    @discardableResult
    static func alert(_ message: String, cancel: String, _ callback: @escaping (_ index: NSInteger) -> Void) -> BaseAlert {
        BaseAlert.show(message, nil, cancel, callback)
    }


    @discardableResult
    static func alert(_ message: String, done: String, cancel: String, _ callback: @escaping (_ index: NSInteger) -> Void) -> BaseAlert {
        BaseAlert.show(message, done, cancel, callback)
    }
}

class MyIcon {
    class func icon(_ platform: RevealedPlatform) -> UIImage {
        var imageName: String = ""
        if platform == .device {
            imageName = "guest"
        } else {
            imageName = "logo_\(platform.name.lowercased())"
        }
        return UIImage.imageName(name: imageName)!
    }
}


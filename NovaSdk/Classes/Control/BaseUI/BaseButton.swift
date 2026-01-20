//
//  Created on 2024/6/21.
//

import Foundation

class BaseButton: UIButton {

    init() {
        super.init(frame: .zero)
    }

    init(title: String?) {
        super.init(frame: .zero)
        setContext(title, .dynamicColor(gameTheme.button.textColor), nil, for: .normal)
    }

    var title: String? {
        get {
            titleLabel?.text
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }

    init(
            normalImage: UIImage? = nil,
            highlightedImage: UIImage? = nil,
            selectedImage: UIImage? = nil,
            disabledImage: UIImage? = nil,
            normalBGImage: UIImage? = nil,
            highlightedBGImage: UIImage? = nil,
            selectedBGImage: UIImage? = nil
    ) {
        super.init(frame: .zero)

        if let normalImage {
            setImage(normalImage, for: .normal)
        }

        if let highlightedImage {
            setImage(highlightedImage, for: .highlighted)
        }

        if let selectedImage {
            setImage(selectedImage, for: .selected)
        }

        if let disabledImage {
            setImage(disabledImage, for: .disabled)
        }

        if let normalBGImage {
            setBackgroundImage(normalBGImage, for: .normal)
        }

        if let highlightedBGImage {
            setBackgroundImage(highlightedBGImage, for: .highlighted)
        } else {
            setBackgroundImage(normalBGImage, for: .highlighted)
        }

        if let selectedBGImage {
            setBackgroundImage(selectedBGImage, for: .selected)
        } else {
            setBackgroundImage(normalBGImage, for: .selected)
        }
    }

    init(title: String? = nil,
         textFont: UIFont? = nil,
         textColor: UIColor? = nil,
         normalBGImage: UIImage? = nil,
         highlightedText: String? = nil,
         highlightedTextColor: UIColor? = nil,
         highlightedBGImage: UIImage? = nil,
         selectedText: String? = nil,
         selectedTextColor: UIColor? = nil,
         selectedBGImage: UIImage? = nil,
         disabledText: String? = nil,
         disabledTextColor: UIColor? = nil,
         disabledBGImage: UIImage? = nil) {

        super.init(frame: .zero)

        setTitleFont(font: textFont ?? gameTheme.button.font)

        //normal
        setContext(title, textColor ?? .dynamicColor(gameTheme.button.textColor), normalBGImage, for: .normal)

        // highlighted
        setContext(highlightedText, highlightedTextColor, highlightedBGImage, for: .highlighted)

        //selected
        setContext(selectedText, selectedTextColor, selectedBGImage, for: .selected)

        //disabled
        setContext(disabledText, disabledTextColor, disabledBGImage, for: .disabled)
    }

    //
    func gradientLayer() {
        let gradientLayer = CAGradientLayer().linearGradient()
        gradientLayer.frame = frame
        layer.insertSublayer(gradientLayer, at: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let maskLayer = layer.mask as? CAShapeLayer {
            maskLayer.frame = bounds
            maskLayer.path = UIBezierPath(roundedRect: maskLayer.bounds, cornerRadius: 5).cgPath
        }
    }
}

class SendCodeButton: BaseButton {

    var currentSecond = 60

    override init() {
        super.init(title: LocalizedString("send_code", "Get Code"),
                textFont: gameTheme.borderTextField.font,
                textColor: .dynamicColor(gameTheme.textButton.textColor),
                normalBGImage: nil,
                highlightedText: LocalizedString("send_code", "Get Code"),
                highlightedTextColor: .dynamicColor(gameTheme.textButton.textColor),
                highlightedBGImage: nil,
                selectedText: LocalizedString("send_code", "Get Code"),
                selectedTextColor: .dynamicColor(gameTheme.textButton.textColor),
                selectedBGImage: nil,
                disabledText: LocalizedString("code_sending", "Sending…"),
                disabledTextColor: .dynamicColor(gameTheme.borderTextField.borderColor),
                disabledBGImage: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func run(_ platform: Platform, _ content: String, _ codeType: VerificationCodeType) {
        if content.isEmpty {
            Toast(LocalizedString("parames_null", "Parameters can't be null"))
            return
        }

        timerTick { [self] current in
            if current > 0 {
                isEnabled = false
                isSelected = false
                setTitle(String(format: "%.2dS", current), for: .disabled)
            } else {
                isEnabled = true
                isSelected = true
            }
        }

        sendVerificationCode(platform, content, codeType)
    }

  private func sendVerificationCode(_ platform: Platform, _ content: String, _ codeType: VerificationCodeType) {
        var email: String = ""
        var phone: String = ""
        if platform == Platform.email {
            email = content
        } else {
            phone = content
        }
        BaseBridge.shared.sendVerificationCode(email, phone, codeType)
    }

    var _timer: DispatchSourceTimer?

    // timer
    func cancel() {
        if _timer != nil {
            _timer?.cancel()
            _timer = nil
        }
    }

    func timerTick(_ run: @escaping (_ currentSecond: NSInteger) -> Void) {
        if _timer == nil {
            _timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
            _timer?.schedule(deadline: .now(), repeating: .seconds(1), leeway: .milliseconds(10))
        }

        currentSecond = 60
        _timer?.setEventHandler {
            runInMain { [self] in
                run(currentSecond)
                currentSecond -= 1
                if currentSecond < 0 {
                    cancel()
                }
            }
        }

        if _timer != nil && !_timer!.isCancelled {
            _timer!.resume()
        }
    }
}


class LogoButton: BaseButton {

    let iconSize = CGSize(width: 32, height: 32)
    var iconImageView: BaseImageView?
    var _titleLabel: BaseLabel?

    var iconName: String?
    private var _title: String?
    override var title: String? {
        get {
            _title
        }
        set {
            _title = newValue
            if _titleLabel != nil {
                _titleLabel?.text = newValue
            } else {
                merror("LOGO hasn't title")
            }
        }
    }

    init(_ iconName: String?, _ title: String? = nil) {
        self.iconName = iconName
        _title = title

        super.init(textFont: gameTheme.button.font,
                textColor: .dynamicColor(gameTheme.button.textColor),
                normalBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.backgroundColor)),
                highlightedBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor)),
                selectedBGImage: UIImage.color(color: .dynamicColor(gameTheme.button.highlightBackgroundColor)))

        defaultBorder()
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        if iconName != nil {
            iconImageView = BaseUI.imageView(iconName!)
            addSubview(iconImageView!)
            iconImageView?.snp.makeConstraints { maker in
                maker.left.equalTo(48)
                maker.centerY.equalToSuperview()
                maker.size.equalTo(iconSize)
            }
        }

        if _title != nil {
            _titleLabel = BaseUI.label(text: _title, font: gameTheme.button.font, textColor: .dynamicColor(gameTheme.button.textColor))
            addSubview(_titleLabel!)
            _titleLabel?.lineBreakMode = .byTruncatingTail
            _titleLabel?.snp.makeConstraints { maker in
                if iconImageView != nil {
                    maker.left.equalTo(iconImageView!.snp.right).offset(16)
                    maker.centerY.equalTo(iconImageView!)
                    maker.right.equalTo(-16)
                } else {
                    maker.edges.equalToSuperview()
                }
            }
        }
    }

}

extension BaseButton {
    private struct AssociatedPlatformKey {
        static var key: String = "RevealedPlatform"
    }

    var platform: Platform {
        get {
            (objc_getAssociatedObject(self, &AssociatedPlatformKey.key) as? Platform)!
        }
        set {
            objc_setAssociatedObject(self, &AssociatedPlatformKey.key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }

    private struct AssociatedTagKey {
        static var key: String = "stringTag"
    }

    var stringTag: String {
        get {
            (objc_getAssociatedObject(self, &AssociatedTagKey.key) as? String)!
        }
        set {
            objc_setAssociatedObject(self, &AssociatedTagKey.key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }

}


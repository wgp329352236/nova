//
//  Created on 2024/6/21.
//

import Foundation

enum BaseTextFieldType {
    case none
    case clear
    case secure
    case code
}

class BaseTextField: UITextField, UITextFieldDelegate {

    let TF_RIGHT_IMAGE_SIZE: CGSize = CGSize(width: 20, height: 20)

    deinit {
        sendButton.cancel()
    }

    init(
            font: UIFont?,
            textColor: UIColor?,
            placeholder: String?,
            keyboardType: UIKeyboardType?,
            type: BaseTextFieldType
    ) {

        super.init(frame: .zero)

        self.font = (font != nil) ? font : gameTheme.borderTextField.font
        self.textColor = (textColor != nil) ? textColor : .dynamicColor(gameTheme.borderTextField.textColor)

        if (placeholder != nil) {
            self.placeholder = placeholder
            setPlaceholderColor(placeholder!)
        }

        self.keyboardType = ((keyboardType != nil) ? keyboardType : UIKeyboardType.asciiCapable)!
        self.type = type
        delegate = self

        drawRightView()
        drawBorder(.roundedRect)
        isShowLeft = false
        backgroundColor = .dynamicColor(gameTheme.contentViewBackgroundColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var isShowLeft: Bool = false

    var openEye: Bool {
        get {
            if let rightView = rightView as? BaseImageView {
                return rightView.isHighlighted
            }
            return false
        }

        set {
            if let rightView = rightView as? BaseImageView {
                rightView.isHighlighted = !newValue
            }
            isSecureTextEntry = newValue
        }
    }

    override var isEnabled: Bool {
        willSet {
            let borderColor = (newValue) ?
                    UIColor.dynamicColor(gameTheme.borderTextField.borderColor) :
                    UIColor.dynamicColor(gameTheme.borderTextField.borderColor)
            background = UIImage.color(color: borderColor)
            textColor = .dynamicColor(gameTheme.borderTextField.textColor)
        }
    }

    override var text: String? {
        willSet {
            if (newValue != nil) && newValue!.isNotEmpty {
                if type == .clear {
                    rightViewMode = .always
                }
            }
        }
    }

    private var _type = BaseTextFieldType.none
    var type: BaseTextFieldType {
        get {
            _type
        }
        set {
            _type = newValue
            switch _type {
            case .secure:
                rightViewMode = .always
                if #available(iOS 12.0, *) {
                    textContentType = .oneTimeCode
                }
                isSecureTextEntry = true
                break
            case .clear:
                rightViewMode = .never
                isSecureTextEntry = false
                break
            case .code:
                rightViewMode = .always
                isSecureTextEntry = false
                break
            default:
                rightViewMode = .never
                isSecureTextEntry = false
                break
            }
        }
    }

    var contentText: String? {
        if isShowLeft {
            return (leftText ?? "") + (text ?? "")
        }
        return text
    }

    func setPlaceholderColor(_ placeholder: String) {
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.dynamicColor(gameTheme.borderTextField.placeholder),
            NSAttributedString.Key.font: gameTheme.borderTextField.font
        ]
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }

//    lazy var myLeftView = UIButton(type: .custom)
//    var flagImageView = BaseUI.imageView()
//    lazy var leftLabel: UILabel = BaseUI.label(text: "+000", font: font, textColor: textColor, backgroundColor: .clear, textAlignment: .left)

    lazy var myLeftView = BaseButton(title: "+000", textFont: gameTheme.borderTextField.font, textColor: .dynamicColor(gameTheme.borderTextField.textColor))
    var leftText: String? {
        get {
            myLeftView.title
        }
        set {
            myLeftView.title = newValue
        }
    }

//    var phoneAreaItem: PhoneAreaItem? {
//        willSet {
//            if newValue != nil {
//                leftText = "+\(newValue!.code)"
//            }
//        }
//    }
//
//    var phoneNumber: PhoneNumber? {
//        willSet {
//            if newValue != nil {
//                leftText = "+\(newValue!.countryCode)"
//                text = String(newValue!.nationalNumber)
//            }
//        }
//    }

    func hideLeftView() {
        if !isShowLeft {
            return
        }
        leftViewMode = .never
        leftView = nil
    }

    func showLeftView() {
        leftViewMode = .always
        drawLeftView()
        setLeftText()
        isShowLeft = true
    }

    func setLeftText() {
//        let regionCode = Locale.current.regionCode
//        BaseBridge.shared.fetchPhoneAreaCode().then { [self] areaCodes in
//            areaCodes.forEach { item in
//                if item.countryCode == regionCode {
//                    myLeftView.title = "+\(item.code)"
//                }
//            }
//        }
    }

    // MARK: leftView
    private func drawLeftView() {
        myLeftView.contentHorizontalAlignment = .left
        myLeftView.contentVerticalAlignment = .center
        leftView = myLeftView
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 10 //right + 10
        rect.origin.y = 0
        rect.size = CGSize(width: 40, height: textFieldHeight)
        return rect
    }

    func addLeftTarget(_ target: Any, action: Selector) {
        myLeftView.removeTarget(target, action: action, for: .touchUpInside)
        myLeftView.addTarget(target, action: action, for: .touchUpInside)
    }

    // MARK: rightView
    private func drawRightView() {
        switch type {
        case .secure:
            addSecureView()
            break
        case .clear:
            addClearView()
            break
        case .code:
            addCodeView()
            break
        default:
            break
        }
    }

    fileprivate func addSecureView() {
        let rightButton = BaseButton(title: IconUnicodeValue.eyeClose.rawValue,
                textFont: .iconFont(fontSize: 20),
                textColor: .dynamicColor(gameTheme.borderTextField.placeholder))
        rightButton.setContext(IconUnicodeValue.eyeClose.rawValue,
                .dynamicColor(gameTheme.borderTextField.placeholder),
                for: .normal)
        rightButton.setContext(IconUnicodeValue.eyeOpen.rawValue,
                .dynamicColor(gameTheme.borderTextField.placeholder),
                for: .selected)
        rightButton.addTarget(self, action: #selector(onSecureTouchDown), for: .touchDown)
        rightButton.addTarget(self, action: #selector(onSecureViewClick(sender:)), for: .touchUpInside)
        rightButton.frame = CGRect(origin: .zero, size: TF_RIGHT_IMAGE_SIZE)
        rightView = rightButton
    }

    var shouldEditing = false

    @objc func onSecureTouchDown() {
        shouldEditing = isFirstResponder || isEditing
    }

    @objc func onSecureViewClick(sender: UIButton) {
        openEye = sender.isSelected
        sender.isSelected = !sender.isSelected
        if shouldEditing {
            becomeFirstResponder()
        }
    }

    fileprivate func addClearView() {
        let rightButton = BaseButton(title: IconUnicodeValue.close.rawValue,
                textFont: .iconFont(fontSize: 20),
                textColor: .dynamicColor(gameTheme.borderTextField.placeholder))
        rightButton.addTarget(self, action: #selector(onClearViewClick(sender:)), for: .touchUpInside)
        rightButton.frame = CGRect(origin: .zero, size: TF_RIGHT_IMAGE_SIZE)
        rightView = rightButton
    }

    @objc func onClearViewClick(sender: UIButton) {
        text = nil
        becomeFirstResponder()
        checkClear(self)
        //
        if (!isShowLeft) {
            resetLeftView()
        }
    }

    fileprivate func resetLeftView() {
        leftViewMode = .never
        leftView = nil
        leftText = nil
    }

    lazy var myRightView = BaseUI.view()
    private let sendButton = SendCodeButton()

    fileprivate func addCodeView() {
        myRightView.addSubview(sendButton)
        sendButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let line = BaseUI.line()
        sendButton.addSubview(line)
        line.snp.makeConstraints { maker in
            maker.width.equalTo(1)
            maker.left.equalToSuperview()
            maker.top.equalTo(10)
            maker.bottom.equalTo(-10)
        }
        rightView = myRightView
    }

    func addRightTarget(_ target: Any, action: Selector) {
        sendButton.addTarget(target, action: action, for: .touchUpInside)
    }

    func send(_ platform: Platform, _ content: String, _ codeType: VerificationCodeType) {
        sendButton.run(platform, content, codeType)
    }

    private var rightViewWidth: CGFloat {
        var rightViewWidth: CGFloat = textFieldWidth * 0.45

        switch BaseBridge.shared.currentLanguage {
        case .english:
            rightViewWidth = textFieldWidth * 0.35
        default:
            break
        }
        return rightViewWidth
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        if type == .code {
            rect.origin.x -= (rightViewWidth - rect.size.width)
            rect.origin.y = 0
            var size = CGSize.zero
            size.width = rightViewWidth
            size.height = CGFloat(textFieldHeight)
            rect.size = size
        } else {
            rect.origin.x -= 10
        }

        return rect
    }

    // MARK: -
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        background = UIImage.color(color: .black)
        borderColor = UIColor.dynamicColor(gameTheme.borderTextField.focusBorderColor)
        return super.becomeFirstResponder()
    }

    @discardableResult
    override func resignFirstResponder() -> Bool {
        background = UIImage.color(color: .lightGray)
        borderColor = UIColor.dynamicColor(gameTheme.borderTextField.borderColor)
        return super.resignFirstResponder()
    }

    override var isHighlighted: Bool {
        get {
            super.isHighlighted
        }
        set {
            super.isHighlighted = newValue
        }
    }

    var borderColor: UIColor? {
        get {
            nil
        }
        set {
            if newValue != nil {
                layer.borderColor = newValue!.cgColor
                layer.borderWidth = 1
                layer.cornerRadius = 5
                layer.masksToBounds = true
            }
        }
    }


    private func drawBorder(_ style: UITextField.BorderStyle = .none) {
        borderStyle = style

        let borderColor = UIColor.dynamicColor(gameTheme.borderTextField.borderColor)
        if (style == .none) {
            background = UIImage.color(color: borderColor)
        } else {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = 1
            layer.cornerRadius = 5
            layer.masksToBounds = true
        }
    }

//    override func borderRect(forBounds bounds: CGRect) -> CGRect {
//        let dy = bounds.size.height - 2
//        var rect = bounds
//        rect.origin.y = dy
//        rect.size.height = 2
//        return rect
//    }

    //UITextField 文字与输入框的距离
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.textRect(forBounds: bounds)
        textRect.origin.x += 8
        textRect.size.width -= 12
        return textRect
    }

    //
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var editingRect = super.editingRect(forBounds: bounds)
        editingRect.origin.x += 8
        editingRect.size.width -= 8
        return editingRect
    }

    //
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if type == .clear {
            if let input = textField.text {
                if input.count == 1 && string.isEmpty {
                    rightViewMode = .never
                } else {
                    rightViewMode = .always
                }
            }
        }

        return true
    }

    private func checkClear(_ textField: UITextField) {
        if type == .clear {
            if let input = textField.text, input.isNotEmpty {
                rightViewMode = .always
            } else {
                rightViewMode = .never
            }
        }
    }
}


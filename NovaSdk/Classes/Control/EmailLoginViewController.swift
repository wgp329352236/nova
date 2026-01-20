//
// Created by  on 2024/9/24.
//

import Foundation

class EmailLoginViewController: BaseLogin {

    private let emailTextField = BaseUI.emailTextField()
    private let authCodeTextField = BaseUI.authCodeTextField()
    private let loginButton = BaseUI.roundedRectButton(title: LocalizedString("loggined", "Logged in"))

    private var uuid: String? = nil
    private var email: String? = nil

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(_ uuid: String? = nil, _ email: String? = nil) {
        self.uuid = uuid
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentTitle = LocalizedString("login_email", "Sign in With Email")
        setupUI()
        closeLabel.isHidden = false
    }

    private func setupUI() {
        contentView.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-24)
            make.width.equalTo(contentWidth)
        }
        titleLabel.isHidden = true

        if let email = email, email.isNotEmpty {
            emailTextField.text = email
            emailTextField.isUserInteractionEnabled = false
            emailTextField.rightView?.isHidden = true
        }

        contentView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.height.equalTo(textFieldHeight)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }

        contentView.addSubview(authCodeTextField)
        authCodeTextField.addRightTarget(self, action: #selector(sendCode))
        authCodeTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.left.right.height.equalTo(emailTextField)
        }

        contentView.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginButtonClick), for: .touchUpInside)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(authCodeTextField.snp.bottom).offset(16)
            make.left.right.equalTo(emailTextField)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(-24)
        }
    }

    @objc
    func sendCode() {
        guard let email = emailTextField.text, DataValidUtil.shared.checkEmailValid(email: email)
        else {
            Toast(LocalizedString("toast_invalide_email", "Please enter a valid email address"))
            return
        }
        authCodeTextField.send(.email, email, .emailLogin)
    }

    @objc
    func loginButtonClick() {
        guard let email = emailTextField.text, DataValidUtil.shared.checkEmailValid(email: email)
        else {
            Toast(LocalizedString("toast_invalide_email", "Please enter a valid email address"))
            return
        }

        guard let authCode = authCodeTextField.text, authCode.isNotEmpty else {
            Toast(LocalizedString("code_empty", "Please input the verification code"))
            return
        }

        if !DataValidUtil.shared.checkNumberValid(number: authCode) || authCode.count > 6 {
            Toast(LocalizedString("code_error", "Verification code error"))
            return
        }

        let credentials = EmailCodeCredentials(email: email, verificationCode: authCode, targetUuid: "")
        BaseBridge.shared.login(.verificationCode, credentials)
                .then { [self](_, player) in
                    loginSuccess(player, email)
                }
                .otherwise { [self](_, throwable) in
                    loginFailure(throwable)
                }
    }

}

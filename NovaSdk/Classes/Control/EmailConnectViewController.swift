//
//

import Foundation

class EmailConnectViewController: BaseConnect {

    private let emailTextField = BaseUI.emailTextField()
    private let authCodeTextField = BaseUI.authCodeTextField()
    private let connectButton = BaseUI.normalButton(title: LocalizedString("connect", "Connect"))

    override func viewDidLoad() {
        super.viewDidLoad()
        contentTitle = LocalizedString("connect_email", "Connect with Email")
        setupUI()
    }

    private func setupUI() {
        contentView.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-24)
            make.width.equalTo(contentWidth)
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

        contentView.addSubview(connectButton)
        connectButton.addTarget(self, action: #selector(connect), for: .touchUpInside)
        connectButton.snp.makeConstraints { make in
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
        authCodeTextField.send(.email, email, .emailConnect)
    }

    @objc
    func connect() {
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
        BaseBridge.shared.connect(.verificationCode, credentials)
                .then { [self](_, player) in
                    connectSuccess(player, email)
                }
                .otherwise { [self](_, throwable ) in
                    connectFailure(throwable)
                }
    }
}

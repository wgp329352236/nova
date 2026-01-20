//
//  Created on 2024/6/30.
//

import Foundation
import FirebaseAnalytics

class BaseLogin: BaseModelViewController {

    let promise = Promise<Player>(waitFor: nil)
    var player: Player?

    let titleLabel = BaseUI.label(LocalizedString("loggined", "Logged in"), .font40)
    var contentTitle: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }

    internal let closeLabel = BaseUI.label(
            font: .iconFont(fontSize: iconFontDefaultSize),
            textColor: .dynamicColor(gameTheme.title.textColor)
    )

    internal let backLabel = BaseUI.label(
            font: .iconFont(fontSize: iconFontDefaultSize),
            textColor: .dynamicColor(gameTheme.title.textColor)
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        guard let player = BaseBridge.shared.player, !player.isExpired else {
            closeLabel.isHidden = true
            return
        }
    }

    private func setupUI() {
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(12)
            maker.centerX.equalToSuperview()
        }

        closeLabel.text = IconUnicodeValue.close.rawValue
        contentView.addSubview(closeLabel)
        closeLabel.isUserInteractionEnabled = true

        let closeTap = UITapGestureRecognizer(target: self, action: #selector(onViewClose))
        closeLabel.addGestureRecognizer(closeTap)

        closeLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(10)
            maker.right.equalTo(-10)
        }

        backLabel.text = IconUnicodeValue.back.rawValue
        contentView.addSubview(backLabel)
        backLabel.isUserInteractionEnabled = true

        let backTap = UITapGestureRecognizer(target: self, action: #selector(onViewBack))
        backLabel.addGestureRecognizer(backTap)

        backLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(10)
            maker.left.equalTo(10)
        }
    }

    @discardableResult
    func login(_ platform: Platform, _ uuid: String = "", _ nickname: String = "") -> PromiseInterface<Player> {
        switch platform {
        case .device:
            deviceLogin()
        case .email:
            emailLogin(uuid, nickname)
        default:
            thirdpartyLogin(platform, uuid)
        }
        return promise
    }

    func thirdpartyLogin(_ platform: Platform, _ uuid: String = "") {
        ThirdPartyFactory.shared.authorize(platform, uuid)
                .then { _, credentials in
                    BaseBridge.shared.login(platform, credentials!)
                            .then { [self](_, player) in
                                loginSuccess(player)
                            }
                            .otherwise { [self] (_, throwable) in
                                loginFailure(throwable)
                            }
                }
                .otherwise { [self] (_, throwable) in
                    loginFailure(throwable)
                }
    }

    func deviceLogin() {
        BaseBridge.shared.login(.device, DeviceVerifiedCredentials(targetUuid: ""))
                .then { [self](_, player) in
                    loginSuccess(player)
                }
                .otherwise { [self] (_, throwable) in
                    loginFailure(throwable)
                }
    }

    func emailLogin(_ uuid: String = "", _ email: String = "") {
        let emailLogin = EmailLoginViewController(uuid, email)
        emailLogin.modalPresentationStyle = .overFullScreen
        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        self.present(emailLogin, animated: true)

        emailLogin.promise.then { [self](_, player) in
                    loginSuccess(player, false)
                }
                .otherwise { [self](_, throwable) in
                    if throwable is UserCloseReason {
                        onViewClose()
                    }
                }
    }


    func loginSuccess(_ player: Player?, _ animated: Bool = true) {
        self.player = player
        onViewDismiss(animated)
    }

    func loginSuccess(_ player: Player?, _ email: String = "", _ animated: Bool = true) {
        self.player = player
        if email.isNotEmpty {
            Analytics.initiateOnDeviceConversionMeasurement(emailAddress: email)
        }
        onViewDismiss(animated)
    }

    func loginFailure(_ reason: KotlinThrowable) {
        if reason is VerificationCodeInvalidReason {
            Toast(LocalizedString("code_error", "Verification code error"))
        } else if reason is UserNotExistReason {
            Toast(LocalizedString("reason_account_unexist", "Account does not exist"))
        } else if reason is UuidNonidenticalReason {
            Toast(LocalizedString("login_id_nonidentical", "Account Nonidentical"))
        } else {
            if let msg = reason.message {
                Toast(msg)
            } else {
                Toast(LocalizedString("unknown", "unknown"))
            }
        }
    }

    override func onViewClose() {
        super.onViewClose()
        dismiss(animated: true) { [self] in
            if promise.state == PromiseState.pending {
                promise.reject(reason: UserCloseReason("User Close"))
            }
        }
    }

    @objc func onViewBack() {
        dismiss(animated: true) { [self] in
            if promise.state == PromiseState.pending {
                promise.reject(reason: Throwable.UserCancel)
            }
        }
    }

    override func onViewDismiss(_ animated: Bool = true) {
        super.onViewDismiss(animated)
        dismiss(animated: animated) { [self] in
            guard let player else {
                if promise.state == PromiseState.pending {
                    promise.reject(reason: Throwable.UserCancel)
                }
                return
            }
            if promise.state == PromiseState.pending {
                promise.resolve(result: player)
            }
        }
    }
}

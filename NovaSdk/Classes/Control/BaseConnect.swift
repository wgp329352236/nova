//
//  Created on 2024/7/6.
//

import Foundation
import FirebaseAnalytics

class BaseConnect: BaseModelViewController {

    let promise = Promise<Player>(waitFor: nil)
    var player: Player?

    let titleLabel = BaseUI.label(LocalizedString("connect", "Connect"), .font40)
    var contentTitle: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }

    private let iconLabel = BaseUI.label(
            font: .iconFont(fontSize: iconFontDefaultSize),
            textColor: .dynamicColor(gameTheme.title.textColor)
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

   private func setupUI() {
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.centerX.equalToSuperview()
        }

        iconLabel.text = IconUnicodeValue.close.rawValue
        contentView.addSubview(iconLabel)
        iconLabel.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(onViewClose))
        iconLabel.addGestureRecognizer(tap)

        iconLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-10)
        }
    }

    func connectSuccess(_ player: Player?, _ animated: Bool = true) {
        self.player = player
        onViewDismiss(animated)
    }

    func connectSuccess(_ player: Player?, _ email: String = "", _ animated: Bool = true) {
        self.player = player
        if email.isNotEmpty {
            Analytics.initiateOnDeviceConversionMeasurement(emailAddress: email)
        }
        onViewDismiss(animated)
    }

    func connectFailure(_ reason: KotlinThrowable) {
        if reason is VerificationCodeInvalidReason {
            Toast(LocalizedString("code_error", "Verification code error"))
        } else if reason is PlayerAlreadyExistReason {
            Toast(LocalizedString("reason_account_existed", "Account already exists"))
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

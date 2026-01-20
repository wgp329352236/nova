//
//  Created on 2024/7/13.
//

import Foundation

class DeregisterViewController: BaseModelViewController {
    let viewPromise = Promise<KotlinUnit>.init(waitFor: nil)
    var deregister: Deregister?

    init(_ deregister: Deregister?) {
        self.deregister = deregister
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    let titleLabel = BaseUI.label(text: LocalizedString("account_deletion_notice", "Account Deletion"),
            font: gameTheme.littleTitle.font,
            textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor))

    private let iconLabel = BaseUI.label(
            font: .iconFont(fontSize: iconFontDefaultSize),
            textColor: .dynamicColor(gameTheme.title.textColor)
    )

    func setupUI() {
        contentView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(contentWidth)
        }

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(12)
            $0.centerX.equalToSuperview()
        }

        iconLabel.text = IconUnicodeValue.close.rawValue
        contentView.addSubview(iconLabel)
        iconLabel.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(onViewClose))
        iconLabel.addGestureRecognizer(tap)

        iconLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(10)
            maker.right.equalTo(-10)
        }

        submitDeletion()
    }

    override func onViewClose() {
        super.onViewClose()
        dismiss(animated: true) { [self] in
            viewPromise.reject(reason: Throwable.UserCancel)
        }
    }

    func submitDeletion() {

        let content = LocalizedString("account_deletion_description", "If you really need to cancel your account, please check if you have purchased any subscription products. If so, please cancel in the store. We will delete all your data as soon as possible. During this period, you may not be able to log in. We apologize for any inconvenience caused.")

        let textContent = BaseUI.label(content, .font28)
        textContent.numberOfLines = 0
        textContent.layer.masksToBounds = true
        contentView.addSubview(textContent)
        textContent.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
        }

        let doneButton = BaseUI.roundedRectButton(title: LocalizedString("exit", "Exit Game"))
        contentView.addSubview(doneButton)
        doneButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        doneButton.snp.makeConstraints {
            $0.top.equalTo(textContent.snp.bottom).offset(16)
            $0.height.equalTo(buttonWidth)
            $0.left.equalTo(24)
            $0.right.equalTo(-24)
            $0.bottom.equalTo(-16)
        }
    }

    @objc func submit() {
        Loading.showOverlay()
        BaseBridge.shared.accountDeletion()
                .then { _, _ in
                    if let player = BaseBridge.shared.player, let role = BaseBridge.shared.currentGameRole {
                        BaseBridge.shared.logEvent(
                                TrackingEventName.shared.DELETE_ACCOUNT,
                                ["player_id": player.playerId,
                                 "role_id": role.roleId]
                        )
                    }
                    Toast(LocalizedString("operation_completed", "Operation successful"))
                    self.viewPromise.resolve(result: KotlinUnit())
                    exit(0)
                }
                .otherwise { (_, throwable) in
                    switch (throwable) {
                    case is PlayerHaveSubsReason:
                        Toast(LocalizedString("deregister_fail_subs","There is an active subscription associated with your account, please cancel the subscription with your service provider and then try again"))
                    case is PlayerHaveRefdReason:
                        Toast(LocalizedString("deregister_fail_refd","The action cannot be completed, please reach out to our customer support."))
                    case is PlayerDeregisteredReason:
                        Toast(LocalizedString("deregister_fail_processing","Your request is being processed, thank you for your patience."))
                    default:
                        Toast(LocalizedString("deregister_fail_exception","An unexpected problem occurred, please try again later."))
                    }
                }
                .eventually {
                    Loading.hide()
                }
    }


    private func revoke() {
        dismiss(animated: true) { [self] in
            viewPromise.resolve(result: KotlinUnit())
        }
    }

    @objc func onExit() {
        viewPromise.reject(reason: Throwable.Exit)
        exit(0)
    }
}

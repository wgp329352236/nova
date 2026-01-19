//
// Created by on 2025/4/30.
//

import UIKit

class ConfirmSwitchViewController: BaseModelViewController {

    private let titleLabel = BaseUI.label(LocalizedString("user_switch_confirm_title", "Switch Account Warning"), .font32)

    private let iconLabel = BaseUI.label(
            font: .iconFont(fontSize: iconFontDefaultSize),
            textColor: .dynamicColor(gameTheme.title.textColor)
    )

    let promise = Promise<KotlinUnit>(waitFor: nil)

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

        iconLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.right.equalTo(-10)
        }

        guard let player = BaseBridge.shared.player else {
            return
        }

        var playerName = player.showPlayerName
        if playerName.isEmpty {
            playerName = "--"
        }

        let loginSection = sectionView(LocalizedString("user_switch_confirm_content1", "Current Logged in:"), playerName)
        contentView.addSubview(loginSection)
        loginSection.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }

        var method: String = ""
        if player.platform == RevealedPlatform.device {
            method = LocalizedString("common_guest", "Guest").uppercased()
        } else {
            method = player.platform.name
        }

        let methodSection = sectionView(LocalizedString("user_switch_confirm_content2", "Login Method:"), method)
        contentView.addSubview(methodSection)
        methodSection.snp.makeConstraints { make in
            make.top.equalTo(loginSection.snp.bottom).offset(12)
            make.left.right.equalTo(loginSection)
        }

        var role: String = "--"
        if let gameRole = BaseBridge.shared.currentGameRole {
            role = gameRole.serverName + "\n" + gameRole.roleName
        }

        let roleSection = sectionView(LocalizedString("user_switch_confirm_content3", "Character in use:"), role)
        contentView.addSubview(roleSection)
        roleSection.snp.makeConstraints { make in
            make.top.equalTo(methodSection.snp.bottom).offset(12)
            make.left.right.equalTo(methodSection)
        }

        let warningLabel = BaseUI.label(
                text: LocalizedString("user_switch_confirm_content4", "Switching accounts will log you out of the current session. Continue?"),
                font: gameTheme.descriptionTitle.font,
                textColor: UIColor.dynamicColor(gameTheme.descriptionTitle.textColor),
                textAlignment: NSTextAlignment.center
        )
        warningLabel.numberOfLines = 0
        if #available(iOS 16.0, *) {
            warningLabel.lineBreakMode = .byWordWrapping
        }
        warningLabel.layer.masksToBounds = true
        contentView.addSubview(warningLabel)

        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(roleSection.snp.bottom).offset(12)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.width.equalTo(contentWidth)
        }

        let confirmButton = BaseUI.roundedRectButton(
                title: LocalizedString("ok", "OK"),
                textFont: gameTheme.button.font,
                textColor: UIColor.dynamicColor(gameTheme.button.textColor),
                normalBGImage: UIImage.color(color: buttonBGColor),
                highlightedBGImage: UIImage.color(color: buttonBGColor),
                selectedBGImage: UIImage.color(color: buttonBGColor)
        )
        confirmButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20)
        confirmButton.addTarget(self, action: #selector(onConfirmClick), for: .touchUpInside)

        contentView.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(warningLabel.snp.bottom).offset(12)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalToSuperview().offset(-12)
        }

        contentView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    @objc
    func onConfirmClick() {
        dismiss(animated: true) { [self] in
            if promise.state == PromiseState.pending {
                promise.resolve(result: KotlinUnit())
            }
        }
    }

    override func onViewClose() {
        super.onViewClose()
        dismiss(animated: true) { [self] in
            if promise.state == PromiseState.pending {
                promise.reject(reason: Throwable.UserCancel)
            }
        }
    }

}

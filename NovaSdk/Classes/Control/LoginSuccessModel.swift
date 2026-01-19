//
// Created by on 2025/5/6.
//

import Foundation

class LoginSuccessModel: BaseModelViewController {

    let promise = Promise<KotlinUnit>(waitFor: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        runInMain { [self] in
            perform(#selector(onViewClose), with: nil, afterDelay: 1)
        }
    }

    private func setupUI() {
        contentView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(contentWidth)
        }

        let titleLabel = BaseUI.label(LocalizedString("login_success", "Login Successful"), .boldFont32)
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.centerX.equalToSuperview()
        }

        guard let player = BaseBridge.shared.player else {
            return
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
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }

        var account = "--"
        if let player = BaseBridge.shared.player {
            if player.platform == RevealedPlatform.device {
                 account = LocalizedString("common_guest", "Guest").uppercased()
            } else {
                if player.showPlayerName.isNotEmpty {
                    account = player.showPlayerName
                } else {
                    account = player.platform.name
                }
            }
        }

        let accountSection = sectionView(LocalizedString("user_center_current_login_account", "Active Account:"), account)
        contentView.addSubview(accountSection)
        accountSection.snp.makeConstraints { make in
            make.top.equalTo(methodSection.snp.bottom).offset(12)
            make.left.right.equalTo(methodSection)
            make.bottom.equalToSuperview().offset(-12)
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

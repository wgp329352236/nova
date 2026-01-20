//
// Created by on 2025/5/23.
//

import Foundation

class LoginHistoryViewController: BaseLogin {

    var loginHistories: [LoginHistory]

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.register(LoginHistoryTableViewCell.self, forCellReuseIdentifier: "LoginHistoryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        return tableView
    }()

    init(_ loginHistories: [LoginHistory]) {
        self.loginHistories = loginHistories
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // 在 layoutSubviews 中更新高度
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.layoutIfNeeded()
//        let height = tableView.contentSize.height
//        tableView.snp.makeConstraints { make in
//            make.height.equalTo(height + 14)
//        }
//    }

    private func setupUI() {
//        contentView.snp.remakeConstraints { (make: ConstraintMaker) in
//            make.center.equalToSuperview()
//            make.width.equalTo(contentWidth)
//            make.height.equalTo(400)
//        }

        titleLabel.text = LocalizedString("login_select_one_account", "Use an existing account")
        backLabel.isHidden = true

        setupTableFooterVie()
        contentView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(-12)
        }

//        let bottomView = bottomView()
//        contentView.addSubview(bottomView)
//        bottomView.snp.makeConstraints { make in
//            make.top.equalTo(tableView.snp.bottom).offset(8)
//            make.left.right.bottom.equalToSuperview()
//        }
        
        contentView.snp.remakeConstraints { (make: ConstraintMaker) in
            if DEVICE_IDIOM_IPAD {
                make.center.equalToSuperview()
                make.width.equalTo(contentWidth)
                make.height.equalTo(400)
            } else if isLandscape {
                make.width.equalTo(contentWidth)
                make.centerX.equalToSuperview()
                make.top.equalTo(UIApplication.safeAreaInsets.top + 24)
                make.bottom.equalTo(-UIApplication.safeAreaInsets.top - 24)
            } else {
                make.center.equalToSuperview()
                make.width.equalTo(contentWidth)
                make.height.equalTo(400)
            }
        }
        
    }

    func setupTableFooterVie() {
        let footerView = tableFooterView()
        tableView.tableFooterView = footerView
        let height = footerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = footerView.frame
        frame.size.height = height
        footerView.frame = frame
        tableView.tableFooterView = footerView
    }

    func tableFooterView() -> UIView {
        let view = BaseUI.view()
        view.canTap = true
        view.addTarget(self, action: #selector(tapFooterView))

        let iconImage = BaseUI.imageView("logo_add")
        iconImage.isUserInteractionEnabled = true
        view.addSubview(iconImage)
        iconImage.snp.makeConstraints { (make: ConstraintMaker) in
            make.left.equalTo(12)
            make.top.equalTo(16)
            make.bottom.equalTo(-16)
            make.width.height.equalTo(44)
        }

        let label = BaseUI.label(
                text: LocalizedString("use_other_account", "Use another verification method"),
                font: gameTheme.littleTitle.boldFont,
                textColor: .dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: .left
        )
        label.numberOfLines = 0
        if #available(iOS 16.0, *) {
            label.lineBreakMode = .byWordWrapping
        }
        label.layer.masksToBounds = true
        label.isUserInteractionEnabled = true
        view.addSubview(label)
        label.snp.makeConstraints { (make: ConstraintMaker) in
            make.left.equalTo(iconImage.snp.right).offset(12)
            make.centerY.equalTo(iconImage)
            make.right.equalTo(-12)
        }
        return view
    }

    func bottomView() -> UIView {
        let view = UIView()

        let privacy = LocalizedString("privacy_policy", "Privacy Policy")
        let privacyLabel = BaseUI.label(
                text: privacy,
                font: gameTheme.littleTitle.font,
                textColor: .dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: .right
        )
        privacyLabel.attributedText = NSAttributedString(
                string: privacy,
                attributes: [
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                    .foregroundColor: buttonBGColor,
                    .font: gameTheme.littleTitle.font
                ]
        )
        view.addSubview(privacyLabel)
        privacyLabel.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.left.equalTo(8)
            make.right.equalTo(view.snp.centerX).offset(-2)
        }
        privacyLabel.canTap = true
        privacyLabel.addTarget(self, action: #selector(tapPrivacyAgreement))

        let terms = LocalizedString("terms_service", "User Agreement")
        let termsLabel = BaseUI.label(
                text: terms,
                font: gameTheme.littleTitle.font,
                textColor: .dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: .left
        )
        termsLabel.canTap = true
        termsLabel.addTarget(self, action: #selector(tapUserAgreement))

        view.addSubview(termsLabel)
        termsLabel.attributedText = NSAttributedString(
                string: terms,
                attributes: [
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                    .foregroundColor: buttonBGColor,
                    .font: gameTheme.littleTitle.font
                ]
        )

        termsLabel.snp.makeConstraints { make in
            make.top.equalTo(privacyLabel)
            make.left.equalTo(view.snp.centerX).offset(2)
            make.right.equalTo(-8)
        }

        var text = "v\(SdkReleaseInfo.shared.SDK_VERSION)"
        if let player = BaseBridge.shared.player {
            let firstLetter = player.platform.name.first.flatMap {
                String($0)
            } ?? ""
            text += "-\(firstLetter)"
        }

        let tagLabel = BaseUI.label(text: text, font: .font20, textColor: .gray)
        view.addSubview(tagLabel)
        tagLabel.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(privacyLabel.snp.bottom).offset(4)
            make.right.equalTo(-8)
            make.bottom.equalTo(-4)
        }

        return view
    }

    @objc
    func tapPrivacyAgreement() {
        BaseBridge.shared.showAgreement(.userAgreement)
    }

    @objc
    func tapUserAgreement() {
        BaseBridge.shared.showAgreement(.privacyAgreement)
    }

    @objc
    func tapFooterView() {
        let loginView = LoginViewController()
        loginView.promise.then { [self](rejectable, player) in
                    loginSuccess(player)
                }
                .otherwise { [self](interface, throwable) in
                    if throwable is UserCloseReason {
                        onViewClose()
                    }
                }
        BaseBridge.shared.presentModelView(loginView)
    }
}

extension LoginHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        loginHistories.count
    }

    func createVerifiableInfo(_ platform: RevealedPlatform, _ nickname: String, _ uuid: String) -> VerifiablePlatform {
        let info = VerifiablePlatform.init()
        info.platform = platform
        info.nickname = nickname
        info.uuid = uuid
        return info
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoginHistoryTableViewCell", for: indexPath) as! LoginHistoryTableViewCell
        let loginHistory = loginHistories[indexPath.row]
        cell.setDataSource(loginHistory)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let loginHistory = loginHistories[indexPath.row]
        let revealedPlatform = loginHistory.platform
        let infos = loginHistory.verifiablePlatforms
        if infos.isEmpty || infos.count == 1 {
            let platform = Platform.Companion.shared.getEnumFromRevealedPlatform(item: revealedPlatform)
            login(platform, loginHistory.uuid, loginHistory.nickname)
        } else {
            let model = LoginMethodViewController(loginHistory)
            BaseBridge.shared.presentModelView(model)
            model.promise.then { [self](rejectable, player) in
                        loginSuccess(player)
                    }
                    .otherwise { [self](interface, throwable) in
                        if throwable is UserCloseReason {
                            onViewClose()
                        }
                    }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

}

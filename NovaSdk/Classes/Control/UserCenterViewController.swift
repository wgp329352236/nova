//
// Created by  on 2025/4/25.
//

import Foundation

class UserCenterViewController: BaseModelViewController {

    let viewPromise = Promise<KotlinUnit>(waitFor: nil)

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.isUserInteractionEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsHorizontalScrollIndicator = false

        scrollView.layer.cornerRadius = 10
        scrollView.layer.masksToBounds = true
        return scrollView
    }()

    var socialMedia: SocialMedia {
        get {
            if let remoteGameConfig = BaseBridge.shared.remoteGameConfig {
                return remoteGameConfig.socialMedia
            }
            return SocialMedia(customerEmail: "")
        }
    }

    var linkAccountAllowed: Bool {
        get {
            if let remoteGameConfig = BaseBridge.shared.remoteGameConfig {
                return remoteGameConfig.personalCenterLinkAccountAllowed
            }
            return false
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

    func setupUI() {
        contentView.snp.remakeConstraints { make in
            if DEVICE_IDIOM_IPAD {
                if isLandscape {
                    make.top.equalTo(UIApplication.safeAreaInsets.bottom + 200)
                    make.centerX.equalToSuperview()
                    make.left.equalTo(UIApplication.safeAreaInsets.left + 300)
                    make.right.equalTo(-UIApplication.safeAreaInsets.right - 300)
                    make.bottom.equalTo(-UIApplication.safeAreaInsets.bottom - 200)
                } else {
                    make.top.equalTo(UIApplication.safeAreaInsets.bottom + 300)
                    make.centerX.equalToSuperview()
                    make.left.equalTo(UIApplication.safeAreaInsets.left + 200)
                    make.right.equalTo(-UIApplication.safeAreaInsets.right - 200)
                    make.bottom.equalTo(-UIApplication.safeAreaInsets.bottom - 300)
                }
            } else {
                if isLandscape {
                    make.top.equalTo(UIApplication.safeAreaInsets.bottom + 16)
                    make.centerX.equalToSuperview()
                    make.left.equalTo(UIApplication.safeAreaInsets.left + 100)
                    make.right.equalTo(-UIApplication.safeAreaInsets.right - 100)
                    make.bottom.equalTo(-UIApplication.safeAreaInsets.bottom - 16)
                } else {
                    make.top.equalTo(UIApplication.safeAreaInsets.top + 100)
                    make.centerX.equalToSuperview()
                    make.left.equalTo(16)
                    make.right.equalTo(-16)
                    make.bottom.equalTo(-UIApplication.safeAreaInsets.bottom - 100)
                }
            }
        }

        contentView.addSubview(scrollView)
        scrollView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }

        let titleView = titleView()
        scrollView.addSubview(titleView)
        titleView.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.width.equalToSuperview()
            make.left.right.equalToSuperview()
        }

        let accountView = accountView()
        scrollView.addSubview(accountView)
        accountView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.left.right.equalTo(titleView)
        }

        let linkAccountView = linkAccountView()
        scrollView.addSubview(linkAccountView)
        linkAccountView.snp.makeConstraints { make in
            make.top.equalTo(accountView.snp.bottom).offset(16)
            make.left.right.equalTo(accountView)
        }

        let supportView = supportView()
        scrollView.addSubview(supportView)
        supportView.snp.makeConstraints { make in
            make.top.equalTo(linkAccountView.snp.bottom).offset(16)
            make.left.right.equalTo(accountView)
        }

        let communityView = communityView()
        scrollView.addSubview(communityView)
        communityView.snp.makeConstraints { make in
            make.top.equalTo(supportView.snp.bottom).offset(20)
            make.left.right.equalTo(supportView)
            make.bottom.equalToSuperview()
        }
    }

    func titleView() -> UIView {
        let view = BaseUI.view()
        let iconLabel = BaseUI.label(
                font: .iconFont(fontSize: iconFontDefaultSize),
                textColor: .dynamicColor(gameTheme.title.textColor)
        )

        iconLabel.text = IconUnicodeValue.close.rawValue
        view.addSubview(iconLabel)
        iconLabel.isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(onViewClose))
        iconLabel.addGestureRecognizer(tap)

        iconLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalTo(-10)
        }

        let headerLabel = BaseUI.label(
                text: LocalizedString("user_center_title", "My Account"),
                font: gameTheme.title.boldFont,
                textColor: UIColor.dynamicColor(gameTheme.title.textColor),
                textAlignment: NSTextAlignment.center
        )

        view.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        return view
    }

    func accountView() -> UIView {
        let view = BaseUI.view()

        let splitView = splitView(LocalizedString("user_center_account", "Account"))
        view.addSubview(splitView)
        splitView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }

        let warningLabel = BaseUI.label(
                text: LocalizedString("user_center_account_warning", "warning"),
                font: gameTheme.descriptionTitle.font,
                textColor: UIColor.dynamicColor(gameTheme.descriptionTitle.textColor),
                textAlignment: NSTextAlignment.center
        )
        warningLabel.numberOfLines = 0
        if #available(iOS 16.0, *) {
            warningLabel.lineBreakMode = .byWordWrapping
        }
        warningLabel.layer.masksToBounds = true
        view.addSubview(warningLabel)

        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(splitView.snp.bottom).offset(8)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.centerX.equalToSuperview()
        }

        var method = ""
        var account = "--"
        if let player = BaseBridge.shared.player {
            if player.platform == RevealedPlatform.device {
                method = LocalizedString("common_guest", "Guest").uppercased()
                account = LocalizedString("common_guest", "Guest")
            } else {
                method = player.platform.name
                if player.showPlayerName.isNotEmpty {
                    account = player.showPlayerName
                } else {
                    account = method
                }
            }
        }

        var desAlignment = NSTextAlignment.left
        if isLandscape || DEVICE_IDIOM_IPAD {
            desAlignment = NSTextAlignment.right
        }

        let methodDesLabel = BaseUI.label(
                text: LocalizedString("user_center_current_login_method", "Login Method"),
                font: gameTheme.littleTitle.boldFont,
                textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: desAlignment
        )
        view.addSubview(methodDesLabel)

        let methodLabel = BaseUI.label(
                text: method,
                font: gameTheme.littleTitle.font,
                textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: NSTextAlignment.left
        )
        view.addSubview(methodLabel)

        let accountDesLabel = BaseUI.label(
                text: LocalizedString("user_center_current_login_account", "Active Account"),
                font: gameTheme.littleTitle.boldFont,
                textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: desAlignment
        )
        view.addSubview(accountDesLabel)

        let accountLabel = BaseUI.label(
                text: account,
                font: gameTheme.littleTitle.font,
                textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: NSTextAlignment.left
        )
        view.addSubview(accountLabel)

        if isLandscape || DEVICE_IDIOM_IPAD {
            methodDesLabel.snp.makeConstraints { make in
                make.top.equalTo(warningLabel.snp.bottom).offset(12)
                make.left.equalToSuperview()
                make.right.equalTo(view.snp.centerX).offset(-2)
            }
            methodLabel.snp.makeConstraints { make in
                make.top.bottom.equalTo(methodDesLabel)
                make.left.equalTo(methodDesLabel.snp.right).offset(4)
                make.right.equalToSuperview()
            }

            accountDesLabel.snp.makeConstraints { make in
                make.top.equalTo(methodDesLabel.snp.bottom).offset(18)
                make.right.equalTo(methodDesLabel)
                make.bottom.equalToSuperview()
            }
            accountLabel.snp.makeConstraints { make in
                make.top.equalTo(accountDesLabel)
                make.left.equalTo(methodLabel)
                make.right.equalTo(-6)
            }
        } else {
            methodDesLabel.snp.makeConstraints { make in
                make.top.equalTo(warningLabel.snp.bottom).offset(12)
                make.left.equalTo(6)
            }

            methodLabel.snp.makeConstraints { make in
                make.top.bottom.equalTo(methodDesLabel)
                make.left.equalTo(methodDesLabel.snp.right).offset(4)
                make.right.equalTo(-6)
            }

            accountDesLabel.snp.makeConstraints { make in
                make.top.equalTo(methodDesLabel.snp.bottom).offset(18)
                make.left.equalTo(methodDesLabel)
                make.bottom.equalToSuperview()
            }
            accountLabel.snp.makeConstraints { make in
                make.top.equalTo(accountDesLabel)
                make.left.equalTo(accountDesLabel.snp.right).offset(4)
                make.right.equalTo(-6)
            }
        }
        return view
    }

    func linkAccountView() -> UIView {

        let platformToSelector: [RevealedPlatform: Selector] = [
            .email: #selector(onLinkEmail),
            .apple: #selector(onLinkApple),
            .facebook: #selector(onLinkFacebook),
            .google: #selector(onLinkGoogle),
            .line: #selector(onLinkLine),
            .kakao: #selector(onLinkKakao),
            .vk: #selector(onLinkVK)
        ]

        func setupConnectionInfo(_ infos: KotlinArray<PlatformConnectionInfo>?) -> UIView {
            let view = BaseUI.view()
            guard let infos else {
                return view
            }

            var layoutView: UIView?
            for index in 0..<infos.size {
                if let info = infos.get(index: index) {
                    mdebug("info=\(info)")
                    if let selector = platformToSelector[info.platform] {
                        let cell = connectionView(info, selector)
                        view.addSubview(cell)
                        if layoutView == nil {
                            cell.snp.makeConstraints { make in
                                make.top.equalToSuperview()
                                make.left.right.equalToSuperview()
                            }
                        } else {
                            cell.snp.makeConstraints { make in
                                make.top.equalTo(layoutView!.snp.bottom)
                                make.left.right.equalToSuperview()
                            }
                        }
                        layoutView = cell
                    }
                }
            }

            if let layoutView {
                layoutView.snp.makeConstraints { make in
                    make.bottom.equalToSuperview()
                }
            }
            return view
        }

        func connectionView(_ info: PlatformConnectionInfo, _ action: Selector) -> UIView {
            let view = BaseUI.view()
            let icon = BaseUI.imageView("logo_\(info.platform.platform.lowercased())")
            view.addSubview(icon)
            icon.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(4)
                make.left.equalTo(20)
                make.width.height.equalTo(44)
                make.bottom.equalToSuperview().offset(-4)
            }

            var font = gameTheme.littleTitle.font
            var text = info.nickname
            if text.isEmpty {
                font = gameTheme.littleTitle.boldFont
                text = info.platform.name
            }

            let textLabel = BaseUI.label(
                    text: text,
                    font: gameTheme.littleTitle.boldFont,
                    textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
                    textAlignment: NSTextAlignment.left
            )
            textLabel.numberOfLines = 2
            if #available(iOS 16.0, *) {
                textLabel.lineBreakMode = .byWordWrapping
            }
            textLabel.layer.masksToBounds = true
            view.addSubview(textLabel)

            var buttonTitle = LocalizedString("connect", "Connect")
            if info.uuid.isNotEmpty {
                buttonTitle = LocalizedString("user_center_link_account_linked", "Connected")
            }

            let linkButton = BaseUI.roundedRectButton(
                    title: buttonTitle,
                    textFont: gameTheme.button.font,
                    textColor: UIColor.dynamicColor(gameTheme.button.textColor),
                    normalBGImage: UIImage.color(color: buttonBGColor),
                    highlightedBGImage: UIImage.color(color: buttonBGColor),
                    selectedBGImage: UIImage.color(color: buttonBGColor)
            )
            linkButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20)

            // 创建按钮配置
//                var configuration = UIButton.Configuration.filled()
//                configuration.title = LocalizedString("user_center_link_account", "Link Account")
//                configuration.titlePadding = 20 // 设置标题边距
//                configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20) // 设置内容边距
//                configuration.baseForegroundColor = UIColor.dynamicColor(gameTheme.button.textColor)
//                configuration.background.backgroundColor = color
//                linkButton.configuration = configuration

            linkButton.addTarget(self, action: action, for: .touchUpInside)
            linkButton.isUserInteractionEnabled = (linkAccountAllowed && info.uuid.isEmpty)

            view.addSubview(linkButton)
            linkButton.sizeToFit()
            linkButton.snp.makeConstraints { make in
                make.right.equalTo(-20)
                make.centerY.equalToSuperview()
            }

            textLabel.snp.remakeConstraints { make in
                make.left.equalTo(icon.snp.right).offset(8)
                make.centerY.equalToSuperview()
                make.right.equalTo(-28 - linkButton.width)
            }

            return view
        }

        let view = BaseUI.view()

        let splitView = splitView(LocalizedString("user_center_link_account", "Link Account"))
        view.addSubview(splitView)
        splitView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }

        func addConnectionInfo(_ view: UIView, _ infos: KotlinArray<PlatformConnectionInfo>?) {
            let connectionView = setupConnectionInfo(infos)
            view.addSubview(connectionView)
            connectionView.snp.makeConstraints { make in
                make.top.equalTo(splitView.snp.bottom).offset(16)
                make.left.right.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }

        BaseBridge.shared.fetchTotalConnectPlatforms()
                .then { (rejectable, array) in
                    runInMain {
                        addConnectionInfo(view, array)
                    }
                }
        return view
    }

    func supportView() -> UIView {
        let view = BaseUI.view()

        let splitView = splitView(LocalizedString("user_center_support", "Support"))
        view.addSubview(splitView)
        splitView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }

        var desAlignment = NSTextAlignment.left
        if isLandscape || DEVICE_IDIOM_IPAD {
            desAlignment = NSTextAlignment.right
        }

        let emailDesLabel = BaseUI.label(
                text: LocalizedString("user_center_support_email_text", "Customer Service Email"),
                font: gameTheme.littleTitle.boldFont,
                textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: desAlignment
        )
        view.addSubview(emailDesLabel)

        let emailLabel = BaseUI.label(
                text: socialMedia.customerEmail,
                font: gameTheme.littleTitle.font,
                textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: NSTextAlignment.left
        )

        let emailText = socialMedia.customerEmail
        let attributedString = NSAttributedString(
                string: emailText,
                attributes: [
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                    .foregroundColor: buttonBGColor,
                    .font: gameTheme.littleTitle.font
                ]
        )
        emailLabel.attributedText = attributedString

        emailLabel.numberOfLines = 0
        if #available(iOS 16.0, *) {
            emailLabel.lineBreakMode = .byWordWrapping
        }
        emailLabel.layer.masksToBounds = true
        view.addSubview(emailLabel)
        emailLabel.canTap = true
        emailLabel.addTarget(self, action: #selector(emailTapped))

        let customerDesLabel = BaseUI.label(
                text: LocalizedString("user_center_support_online_text", "Online customer service"),
                font: gameTheme.littleTitle.boldFont,
                textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: desAlignment
        )

        view.addSubview(customerDesLabel)

        let customerButton = BaseUI.roundedRectButton(
                title: LocalizedString("user_center_support", "Support"),
                textFont: gameTheme.button.font,
                textColor: UIColor.dynamicColor(gameTheme.button.textColor),
                normalBGImage: UIImage.color(color: buttonBGColor),
                highlightedBGImage: UIImage.color(color: buttonBGColor),
                selectedBGImage: UIImage.color(color: buttonBGColor)
        )

        customerButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20)
        customerButton.addTarget(self, action: #selector(showCustomer), for: .touchUpInside)
        view.addSubview(customerButton)

        if isLandscape || DEVICE_IDIOM_IPAD {
            emailDesLabel.snp.makeConstraints { make in
                make.left.equalTo(5)
                make.right.equalTo(view.snp.centerX).offset(-2)
            }

            emailLabel.snp.makeConstraints { make in
                make.top.equalTo(splitView.snp.bottom).offset(12)
                make.left.equalTo(emailDesLabel.snp.right).offset(4)
                make.right.equalTo(-10)
                make.centerY.equalTo(emailDesLabel)
            }

            customerDesLabel.snp.makeConstraints { make in
                make.top.equalTo(emailLabel.snp.bottom).offset(20)
                make.right.equalTo(emailDesLabel)
                make.bottom.equalToSuperview()
            }
        } else {
            emailDesLabel.snp.makeConstraints { make in
                make.left.equalTo(6)
            }

            emailLabel.snp.makeConstraints { make in
                make.top.equalTo(splitView.snp.bottom).offset(12)
                make.left.equalTo(emailDesLabel.snp.right).offset(4)
                make.right.equalTo(-6)
                make.centerY.equalTo(emailDesLabel)
            }

            customerDesLabel.snp.makeConstraints { make in
                make.top.equalTo(emailLabel.snp.bottom).offset(20)
                make.left.equalTo(emailDesLabel)
                make.bottom.equalToSuperview()
            }
        }

        customerButton.snp.makeConstraints { make in
            make.right.equalTo(-20)
            make.centerY.equalTo(customerDesLabel)
        }


        return view
    }

    func communityView() -> UIView {
        let view = BaseUI.view()

        func setupSocialView() -> UIView {
            let view = BaseUI.view()
            var layoutView: UIView?

            let list = socialMedia.socialMediaList
            list.forEach { (element: NSArray.Element) in
                if let item = element as? SocialMediaItem {
                    let cell = thirdView(item.platform, item.link)
                    view.addSubview(cell)
                    if layoutView == nil {
                        cell.snp.makeConstraints { make in
                            make.top.left.right.equalToSuperview()
                        }
                    } else {
                        cell.snp.makeConstraints { make in
                            make.top.equalTo(layoutView!.snp.bottom)
                            make.left.right.equalToSuperview()
                        }
                    }
                    layoutView = cell
                }
            }

            if let layoutView {
                layoutView.snp.makeConstraints { make in
                    make.bottom.equalToSuperview()
                }
            }
            return view
        }

        func thirdView(_ platform: String, _ content: String) -> UIView {
            let view = BaseUI.view()
            let icon = BaseUI.imageView("social_media_\(platform.lowercased())")
            view.addSubview(icon)
            icon.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.left.equalToSuperview().offset(10)
                make.width.equalTo(200)
                make.height.equalTo(60)
                make.bottom.equalToSuperview()
            }

            let goButton = BaseUI.roundedRectButton(
                    title: LocalizedString("common_button_go", "Go"),
                    textFont: gameTheme.button.font,
                    textColor: UIColor.dynamicColor(gameTheme.button.textColor),
                    normalBGImage: UIImage.color(color: buttonBGColor),
                    highlightedBGImage: UIImage.color(color: buttonBGColor),
                    selectedBGImage: UIImage.color(color: buttonBGColor)
            )

            goButton.stringTag = content
            goButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 20)
            goButton.addTarget(self, action: #selector(onGoButtonClick(_:)), for: .touchUpInside)
            view.addSubview(goButton)
            goButton.snp.makeConstraints { make in
                make.right.equalTo(-20)
                make.centerY.equalToSuperview()
            }

            return view
        }

        let splitView = splitView(LocalizedString("user_center_community", "Community"))
        view.addSubview(splitView)
        splitView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }

        let socialView = setupSocialView()
        view.addSubview(socialView)
        socialView.snp.makeConstraints { make in
            make.top.equalTo(splitView.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
        }

        if socialMedia.officialWebsite.isNotEmpty {
            let officialButton = BaseUI.roundedRectButton(
                    title: LocalizedString("user_center_office_btn_text", "Our Site"),
                    textFont: gameTheme.button.font,
                    textColor: UIColor.dynamicColor(gameTheme.button.textColor),
                    normalBGImage: UIImage.color(color: buttonBGColor),
                    highlightedBGImage: UIImage.color(color: buttonBGColor),
                    selectedBGImage: UIImage.color(color: buttonBGColor)
            )

            officialButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
            officialButton.addTarget(self, action: #selector(showOfficial), for: .touchUpInside)
            view.addSubview(officialButton)
            officialButton.snp.makeConstraints { make in
                make.top.equalTo(socialView.snp.bottom).offset(8)
                make.centerX.equalToSuperview()
                make.bottom.equalTo(-12)
            }

            if socialMedia.officialWebsiteBonus {
                let giftImageView = BaseUI.imageView("gift")
                view.addSubview(giftImageView)
                giftImageView.snp.makeConstraints { make in
                    make.top.equalTo(officialButton).offset(-8)
                    make.width.equalTo(20)
                    make.height.equalTo(22)
                    make.right.equalTo(officialButton).offset(7)
                }
            }
        } else {
            socialView.snp.makeConstraints { make in
                make.bottom.equalToSuperview()
            }
        }

        return view
    }

    func splitView(_ text: String) -> UIView {
        let view = BaseUI.view()

        let labelText = "    " + text + "    "
        let textLabel = BaseUI.label(
                text: labelText,
                font: gameTheme.littleTitle.boldFont,
                textColor: UIColor.dynamicColor(gameTheme.descriptionTitle.textColor),
                textAlignment: NSTextAlignment.left
        )
        textLabel.layer.borderWidth = 1
        textLabel.layer.borderColor = UIColor.dynamicColor(gameTheme.splitLine.backgroundColor).cgColor
        textLabel.layer.cornerRadius = 5
        textLabel.layer.masksToBounds = true
        view.addSubview(textLabel)

        textLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.height.equalTo(28)
            make.center.equalToSuperview()
        }

        let leftLine = BaseUI.line()
        view.addSubview(leftLine)
        leftLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalTo(textLabel.snp.left)
        }

        let rightLine = BaseUI.line()
        view.addSubview(rightLine)
        rightLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.centerY.equalToSuperview()
            make.left.equalTo(textLabel.snp.right)
            make.right.equalToSuperview()
        }

        return view
    }

    override func onViewClose() {
        super.onViewClose()
        dismiss(animated: true) { [self] in
            if viewPromise.state == PromiseState.pending {
                viewPromise.resolve(result: KotlinUnit())
            }
        }
    }

    @objc
    func onLinkEmail() {
        BaseBridge.shared.connectAccount(.email).then { [unowned self](_, _) in
            onViewClose()
        }
    }

    @objc
    func onLinkApple() {
        BaseBridge.shared.connectAccount(.apple).then { [unowned self](_, _) in
            onViewClose()
        }
    }

    @objc
    func onLinkGoogle() {
        BaseBridge.shared.connectAccount(.google).then { [unowned self](_, _) in
            onViewClose()
        }
    }

    @objc
    func onLinkFacebook() {
        BaseBridge.shared.connectAccount(.facebook).then { [unowned self](_, _) in
            onViewClose()
        }
    }

    @objc
    func onLinkVK() {
        BaseBridge.shared.connectAccount(.vk).then { [unowned self](_, _) in
            onViewClose()
        }
    }

    @objc
    func onLinkLine() {
        BaseBridge.shared.connectAccount(.line).then { [unowned self](_, _) in
            onViewClose()
        }
    }

    @objc
    func onLinkKakao() {
        BaseBridge.shared.connectAccount(.kakao).then { [unowned self](_, _) in
            onViewClose()
        }
    }
    
    @objc
    func showCustomer() {
        BaseBridge.shared.showCustomerService()
    }

    @objc
    func onGoButtonClick(_ sender: UIButton) {
        let link = (sender as! BaseButton).stringTag
        BaseBridge.shared.showSafari(link)
    }

    @objc
    func showOfficial() {
        BaseBridge.shared.showOfficial()
    }

    @objc
    func emailTapped() {
        let recipient = socialMedia.customerEmail
        BaseBridge.shared.sendMail(recipient)
    }

    override var shouldAutorotate: Bool {
        if supportedOrientation == .landscape {
            return true
        } else {
            return false
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if supportedOrientation == .portrait {
            return .portrait
        } else {
            return .landscape
        }
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if supportedOrientation == .portrait {
            return .portrait
        } else {
            return .landscapeRight
        }
    }

}

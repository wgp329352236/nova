//
//  Created on 2024/6/20.
//

import Foundation

import SafariServices

class LoginViewController: BaseLogin {

    private let guestLabel = BaseUI.label(
            text: LocalizedString("sign_in_with_guest", "Sign in with Guest"),
            textAlignment: .center
    )

    private let versionLabel: BaseLabel = {
        var text = "v\(SdkReleaseInfo.shared.SDK_VERSION)"
        if let player = BaseBridge.shared.player {
            let firstLetter = player.platform.name.first.flatMap {
                String($0)
            } ?? ""
            text += "-\(firstLetter)"
        }
        return BaseUI.label(text: text, font: .font20, textColor: .gray)
    }()

    private var checkboxButton: BaseButton = {
        let button = BaseUI.imageButton(
                normalImage: UIImage.imageName(name: "check"),
                highlightedImage: UIImage.imageName(name: "checked"),
                selectedImage: UIImage.imageName(name: "checked")
        )
        button.isSelected = true
        return button
    }()

    private let attributedView = BaseUI.view()

    private var buttonsView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        contentView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(contentWidth)
        }

        titleLabel.isHidden = (BaseBridge.shared.player != nil)

        buttonsView = setupButtonsView()
        contentView.addSubview(buttonsView)
        buttonsView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
        }

        if let player = BaseBridge.shared.player {
            // switch account
            if player.platform != .device {
                insertGuest()
                guestLabel.snp.makeConstraints { make in
                    make.bottom.equalTo(-24)
                }
            } else {
                buttonsView.snp.makeConstraints { make in
                    make.bottom.equalTo(-24)
                }
            }
        } else {
            // just login
            insertGuest()
            setupBottom()
        }

        setupVersion()
    }

    func setupButtonsView() -> UIView {
        let view = BaseUI.view()
        var tagButton: BaseButton?

        if let platforms = PlatformUtil.shared.loginPlatforms.asArray() as? [RevealedPlatform] {
            platforms.forEach { platform in
                let button = BaseUI.imageButton(
                        normalBGImage: UIImage.imageName(name: "logo_\(platform.platform.lowercased())")
                )
                button.stringTag = platform.platform
                button.addTarget(self, action: #selector(loginByPlatform(_:)), for: .touchUpInside)
                view.addSubview(button)

                if let tag = tagButton {
                    button.snp.makeConstraints { make in
                        make.top.size.equalTo(tag)
                        make.left.equalTo(tag.snp.right).offset(20)
                    }
                } else {
                    button.snp.makeConstraints { make in
                        make.size.equalTo(buttonSize)
                        make.top.left.bottom.equalToSuperview()
                    }
                }

                tagButton = button
            }
        }

        if let tag = tagButton {
            tag.snp.makeConstraints { make in
                make.right.equalToSuperview()
            }
        }
        return view
    }

    private func insertGuest() {
        let attributeString = NSMutableAttributedString(string: guestLabel.text!)
        attributeString.addAttributes(
                [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue],
                range: NSRange(location: 0, length: guestLabel.text!.count)
        )
        guestLabel.attributedText = attributeString
        guestLabel.canTap = true
        guestLabel.addTarget(self, action: #selector(loginByGuest))
        contentView.addSubview(guestLabel)

        guestLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonsView.snp.bottom).offset(24)
            make.left.right.equalToSuperview()
        }
    }

    private func setupBottom() {
        contentView.addSubview(checkboxButton)
        checkboxButton.addTarget(self, action: #selector(checkboxClick), for: .touchUpInside)
        setupAttributedView()
        checkboxButton.snp.makeConstraints { make in
            make.left.equalTo(18)
            make.width.height.equalTo(33)
            make.centerY.equalTo(attributedView)
        }
    }

    private func setupAttributedView() {
        contentView.addSubview(attributedView)
        attributedView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(guestLabel.snp.bottom).offset(18)
            make.left.equalTo(checkboxButton.snp.right).offset(12)
            make.right.equalToSuperview().offset(-18)
            make.bottom.equalTo(-18)
        }

        let textview = BaseTextView(.attributed)
        textview.textAlignment = .left
        attributedView.addSubview(textview)
        textview.text = LocalizedString("agree_policy", "Agree to the \"User Agreement\" and \"Privacy Policy\"")

        let linksInfo: Array<[String: String]> = [
            [
                "title": LocalizedString("terms_service", "User Agreement"),
                "scheme": "limits://",
                "link": BaseBridge.shared.getAgreement(.userAgreement)
            ],
            [
                "title": LocalizedString("privacy_policy", "Privacy Policy"),
                "scheme": "privacy://",
                "link": BaseBridge.shared.getAgreement(.privacyAgreement)
            ]
        ]

        textview.addLink(linksInfo) { [self] link in
            if let encodingString = link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
               let url = URL(string: encodingString) {
                let safari = SFSafariViewController(url: url)
                self.present(safari, animated: true)
            }
        }

        textview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupVersion() {
        contentView.addSubview(versionLabel)
        versionLabel.snp.makeConstraints { make in
            make.right.equalTo(-8)
            make.bottom.equalTo(-2)
        }
    }

    @objc func loginByGuest() {
        if !checkboxButton.isSelected {
            Toast(LocalizedString("detail_agree", "Please first agree to the \"User Agreement\" and \"Privacy Policy\""))
        } else {
            login(.device)
        }
    }

    @objc
    func loginByPlatform(_ button: BaseButton) {
        if !checkboxButton.isSelected {
            Toast(LocalizedString("detail_agree", "Please first agree to the \"User Agreement\" and \"Privacy Policy\""))
        } else {
            let stringTag = button.stringTag
            let platform = Platform.companion.getEnumByValue(platform: stringTag)
            login(platform)
        }
    }

    @objc func checkboxClick() {
        if checkboxButton.isSelected {
            checkboxButton.isSelected = false
        } else {
            checkboxButton.isSelected = true
        }
    }

}

internal extension BaseButton {
    override var isUserInteractionEnabled: Bool {
        willSet {
            if newValue == true {
                alpha = 1
            } else {
                alpha = 0.5
            }
        }
    }
}

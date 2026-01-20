//
// Created by on 2025/8/5.
//

import Foundation

class ShareViewController: BaseModelViewController {

    let promise = Promise<ShareResult>(waitFor: nil)

    let titleLabel = BaseUI.label(
            text: LocalizedString("shareTo", "Share To:"),
            font: .font40,
            textColor: .black,
            textAlignment: .center
    )
    var contentTitle: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }

    let closeLabel = BaseUI.label(
            font: .iconFont(fontSize: iconFontDefaultSize),
            textColor: .dynamicColor(gameTheme.title.textColor)
    )

    let shareElements: [ShareElement]
    let shareContent: ShareContent

    init(_ shareElements: [ShareElement], _ shareContent: ShareContent) {
        self.shareElements = shareElements
        self.shareContent = shareContent
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var buttonsView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
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

        contentView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(contentWidth)
        }

        buttonsView = setupButtonsView()
        contentView.addSubview(buttonsView)
        buttonsView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-24)
        }
    }

    @objc
    func setupButtonsView() -> UIView {
        let view = BaseUI.view()
        var tagButton: BaseButton?
        shareElements.forEach { element in
            let button: BaseButton = BaseUI.imageButton(
                normalBGImage: UIImage.imageName(name: "logo_\(element.platform.platform.lowercased())")
            )

            button.stringTag = element.platform.platform
            button.addTarget(self, action: #selector(shareByPlatform(_:)), for: .touchUpInside)
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

        if let tag = tagButton {
            tag.snp.makeConstraints { make in
                make.right.equalToSuperview()
            }
        }

        return view
    }

    @objc
    func shareByPlatform(_ button: BaseButton) {
        let stringTag = button.stringTag
        let platform = SocialPlatform.companion.getEnumByValue(needle: stringTag, default: .facebook)

        var text = shareContent.text
        if shareContent.text == nil && shareContent.image == nil && shareContent.url == nil {
            text = shareElements.first(where: { $0.platform == platform })?.text
        }

        let image = shareContent.image as? UIImage
        let string = shareContent.url ?? ""
        let url = URL(string: string)
        ThirdPartyFactory.shared.share(platform, text: text, image: image, url: url)
                .then { [self](rejectable, result) in
                    shareSuccess(result)
                }
    }
    
    func shareSuccess(_ result: ShareResult?) {
        if let result = result {
            if result.status == ShareStatus.success {
                dismiss(animated: true) { [self] in
                    if promise.state == PromiseState.pending {
                        promise.resolve(result: result)
                    }
                }
            }
        }
    }

    @objc
    override func onViewClose() {
        super.onViewClose()
        dismiss(animated: true) { [self] in
            if promise.state == PromiseState.pending {
                promise.reject(reason: UserCloseReason("User Close"))
            }
        }
    }

}

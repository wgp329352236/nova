import Foundation
import SafariServices

class FrozenViewController: BaseModelViewController {

    let titleLabel = BaseUI.label(LocalizedString("prompt", "Prompt"), .font40)
    let textView = BaseUI.label(
            text: "",
            font: gameTheme.descriptionTitle.font,
            textColor: UIColor.dynamicColor(gameTheme.descriptionTitle.textColor)
    )

    let iGotButton = BaseUI.normalButton(title: LocalizedString("unfrozen_button_text", "I got it"))
    let repayButton = BaseUI.normalButton(title: LocalizedString("frozen_button_text", "Repay now"))

    let tipsInfo: TipsInfo

    init(_ tipsInfo: TipsInfo) {
        self.tipsInfo = tipsInfo
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.centerX.equalToSuperview()
        }

        textView.numberOfLines = 0
        contentView.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }

        switch tipsInfo.status {
        case TipsStatus.warning:
            layoutWarning()
            break
        case TipsStatus.frozen:
            layoutFrozen()
            break
        default:
            break
        }

        contentView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(contentWidth)
        }
    }

    private func layoutWarning() {
        var content = LocalizedString("unfrozen_content", "Your account has recently issued refunds. This is an official warning.\\nRefunds: 2 \\nTotal amount: $29.99 \\nFurther refunds will result in account suspension.")
        content = content.replacingOccurrences(of: "$count", with: "\(tipsInfo.count)")
        content = content.replacingOccurrences(of: "$amount", with: tipsInfo.showSum)
        textView.text = content

        iGotButton.addTarget(self, action: #selector(iGotButtonClicked), for: .touchUpInside)
        contentView.addSubview(iGotButton)
        iGotButton.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(16)
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(-24)
        }
    }

    private func layoutFrozen() {
        var content = LocalizedString("frozen_content", "Your account has been suspended due to recent refunds. \\nRefunds: 2 \\nTotal amount: $29.99 \\nIt will be automatically reinstated within 1-2 business days after repayment.")
        content = content.replacingOccurrences(of: "$count", with: "\(tipsInfo.count)")
        content = content.replacingOccurrences(of: "$amount", with: tipsInfo.showSum)
        textView.text = content

        repayButton.addTarget(self, action: #selector(repayButtonClicked), for: .touchUpInside)
        contentView.addSubview(repayButton)
        repayButton.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(16)
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(buttonHeight)
            make.bottom.equalTo(-24)
        }
    }


    @objc
    func iGotButtonClicked() {
        dismiss(animated: true)
    }

    @objc
    func repayButtonClicked() {
        if let encodingString = tipsInfo.link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodingString) {
            let safari = SFSafariViewController(url: url)
            dismiss(animated: false) { [self] in
                present(safari, animated: true)
            }
        }

    }

}

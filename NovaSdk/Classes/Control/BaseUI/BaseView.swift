//
//  Created on 2024/6/21.
//

import Foundation

class BaseView: UIView {

    private var tapGestureRecognizer = UITapGestureRecognizer()
    var canTap: Bool {
        get {
            isUserInteractionEnabled
        }
        set {
            isUserInteractionEnabled = newValue
            if newValue {
                addGestureRecognizer(tapGestureRecognizer)
            } else {
                if let tap = gestureRecognizers?.first(where: {
                    $0 == tapGestureRecognizer
                }) {
                    removeGestureRecognizer(tap)
                }
            }
        }
    }

    convenience init(_ backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addTarget(_ target: Any, action: Selector) {
        if (gestureRecognizers != nil) && (gestureRecognizers!.contains(tapGestureRecognizer)) {
            tapGestureRecognizer.removeTarget(target, action: action)
        }
        tapGestureRecognizer.addTarget(target, action: action)
    }
}

internal class CompanyLogoView: BaseView {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
//        setupUI()
    }

    private func setupUI() {
        let imageView = BaseUI.imageView()
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        imageView.snp.makeConstraints { (maker) in
            maker.size.equalTo(gameLogoSize)
            maker.edges.equalToSuperview()
        }

//        let companyName = BaseUI.label(LocalizedString("company_name", "Games").uppercased())
//        companyName.font = .boldFont36
//        companyName.textColor = .hexColor("0x0a94bb")
//        addSubview(companyName)
//        companyName.snp.makeConstraints { (maker) in
//            maker.left.equalTo(imageView.snp.right).offset(5)
//            maker.centerY.equalTo(imageView)
//            maker.right.equalToSuperview()
//        }
    }
}

internal class SeparateView: BaseView {

    var text: String
    var hideLine: Bool = false

    init(_ text: String, _ hideLine: Bool = false) {
        self.text = text
        self.hideLine = hideLine
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var backgroundColor: UIColor? {
        willSet {
            line.backgroundColor = newValue
        }
    }

    let line = BaseUI.line()

    private func setupUI() {
        addSubview(line)
        line.snp.makeConstraints { (maker) in
            maker.left.right.centerY.equalToSuperview()
            maker.height.equalTo(1)
        }
        line.isHidden = hideLine

        let descriptionLabel = BaseUI.label(text)
        descriptionLabel.backgroundColor = .dynamicColor(gameTheme.contentViewBackgroundColor)
        descriptionLabel.textAlignment = .center
        descriptionLabel.sizeToFit()
        addSubview(descriptionLabel)

        descriptionLabel.snp.makeConstraints { (maker) in
            maker.width.equalTo(descriptionLabel.width + 40)
            maker.top.bottom.centerX.equalToSuperview()
        }
    }
}


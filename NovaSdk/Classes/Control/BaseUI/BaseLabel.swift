//
//  Created on 2024/6/21.
//

import Foundation

class BaseLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(_ backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }

    private var tapGestureRecognizer = UITapGestureRecognizer()
    var canTap: Bool {
        get {
            isUserInteractionEnabled
        }
        set {
            isUserInteractionEnabled = newValue
            if newValue {
                addGestureRecognizer(tapGestureRecognizer)
            }
        }
    }

    init(text: String?,
         font: UIFont?,
         textColor: UIColor?,
         backgroundColor: UIColor?,
         textAlignment: NSTextAlignment?) {

        super.init(frame: .zero)
        self.font = (font != nil) ? font : gameTheme.descriptionTitle.font
        self.backgroundColor = (backgroundColor != nil) ? backgroundColor : .clear
        self.textColor = (textColor != nil) ? textColor : .dynamicColor(gameTheme.descriptionTitle.textColor)
        self.textAlignment = (textAlignment != nil) ? textAlignment! : .left
        self.text = text
        canTap = false
    }

    func addTarget(_ target: Any, action: Selector) {
        if !isUserInteractionEnabled {
            mdebug("This label can't tap")
            return
        }
        tapGestureRecognizer.removeTarget(target, action: action)
        tapGestureRecognizer.addTarget(target, action: action)
    }
}

class BadgeLabel: BaseLabel {

    var content = BaseLabel(
            text: nil,
            font: .font24,
            textColor: .white,
            backgroundColor: .clear,
            textAlignment: .center
    )

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init() {
        super.init(text: nil,
                font: .font24,
                textColor: .white,
                backgroundColor: .hexColor("0xF56C6C"),
                textAlignment: .center)
        addSubview(content)
        content.snp.makeConstraints { (maker) in
            maker.top.left.equalTo(3)
            maker.bottom.right.equalTo(-3)
        }
    }

    func drawContent(_ number: Int) {
        if number == 0 {
            isHidden = true
            return
        }

        isHidden = (number == 0)
        content.text = (number > 99) ? "99+" : String(number)
        content.sizeToFit()

        // make width >= height
        if content.height > content.width {
            content.width = content.height
        }

        let size = CGSize(width: content.width, height: content.height)
        content.snp.remakeConstraints { (maker) in
            maker.top.left.equalTo(3)
            maker.bottom.right.equalTo(-3)
            maker.size.equalTo(size)
        }
        drawCorner(size)
    }

    func drawCorner(_ size: CGSize) {
        layer.cornerRadius = ((size.width > size.height) ? size.height / 2 : size.width / 2) + 3
        layer.masksToBounds = true
    }

    var tips: Int {
        get {
            Int(content.text ?? "0")!
        }
        set {
            drawContent(newValue)
        }
    }

}

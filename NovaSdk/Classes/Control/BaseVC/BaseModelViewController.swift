//
//  Created on 2024/6/21.
//

import Foundation

class BaseModelViewController: BaseViewController {

    let contentWidth: Double = 320
    let contentHeight: Double = 200
    var contentSize: CGSize {
        get {
            CGSize(width: contentWidth, height: contentHeight)
        }
    }

    private var darkBGView = BaseUI.view(.hexaColor("0x000000", 0.5))

    private var _contentView = BaseUI.view()
    var contentView: BaseView {
        get {
            _contentView
        }
        set {
            _contentView = newValue
        }
    }

    func disableTap() {
        darkBGView.canTap = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(darkBGView)
        darkBGView.canTap = true
        darkBGView.addTarget(self, action: #selector(viewEndEditing))
        darkBGView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }

        contentView = drawContentView()
        view.addSubview(contentView)
        contentView.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.size.equalTo(contentSize)
        }
    }

    private func drawContentView() -> BaseView {
        let view = BaseUI.view(.dynamicColor(gameTheme.contentViewBackgroundColor))
        view.layer.rasterizationScale = UIScreen.main.scale
        view.layer.cornerRadius = 10
//        view.layer.shadowColor = UIColor.dynamicColor(gameTheme.contentViewBackgroundColor).cgColor
//        view.layer.shadowOffset = CGSize(width: 5, height: 5)
//        view.layer.shadowOpacity = 0.8
//        view.layer.shadowRadius = 4
        view.layer.masksToBounds = true
        view.clipsToBounds = false
        return view
    }

    func present() {
        modalPresentationStyle = .overFullScreen
        appTopViewController.providesPresentationContextTransitionStyle = true
        appTopViewController.definesPresentationContext = true
        appTopViewController.present(self, animated: true, completion: nil)
    }

    @objc func viewEndEditing() {
        view.endEditing(true)
    }


    func sectionView(_ title: String, _ content: String) -> UIView {
        let view = BaseUI.view()
        let titleLabel = BaseUI.label(
                text: title,
                font: gameTheme.littleTitle.font,
                textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
                textAlignment: NSTextAlignment.right
        )
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(5)
            if isLandscape {
                make.right.equalTo(view.snp.centerX)
            } else {
                make.width.equalTo((contentWidth - 15) * 0.45)
            }
            make.centerY.equalToSuperview()
        }

        let contentColor = UIColor.hexColor("0x1989fa")

        let contentLabel = BaseUI.label(
                text: content,
                font: gameTheme.littleTitle.font,
                textColor: contentColor,
                textAlignment: NSTextAlignment.left
        )
        contentLabel.numberOfLines = 0
        if #available(iOS 16.0, *) {
            contentLabel.lineBreakMode = .byWordWrapping
        }
        contentLabel.layer.masksToBounds = true
        view.addSubview(contentLabel)

        contentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right).offset(5)
            make.right.equalTo(-5)
            make.bottom.equalToSuperview()
        }
        return view
    }

}

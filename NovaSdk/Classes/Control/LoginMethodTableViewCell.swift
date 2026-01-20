//
// Created by  on 2025/5/27.
//

import Foundation

class LoginMethodTableViewCell: BaseTableViewCell {

    private var methodIcon: UIImageView = BaseUI.imageView()
    private var nickname: UILabel = BaseUI.label(
            text: "-",
            font: gameTheme.littleTitle.font,
            textColor: .dynamicColor(gameTheme.littleTitle.textColor),
            textAlignment: .left
    )

    private let line = BaseUI.line()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .gray
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(methodIcon)
        methodIcon.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(6)
            make.left.equalTo(12)
            make.bottom.equalTo(-6)
            make.width.height.equalTo(44)
        }

        contentView.addSubview(nickname)
        nickname.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerY.equalTo(methodIcon)
            make.left.equalTo(methodIcon.snp.right).offset(12)
            make.right.equalTo(-12)
        }

        contentView.addSubview(line)
        line.snp.makeConstraints { (make: ConstraintMaker) in
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(1)
            make.bottom.equalTo(0.5)
        }
    }

    func setDataSource(_ dataSource: VerifiablePlatform) {
        methodIcon.image = UIImage.imageName(name: "logo_\(dataSource.platform.name.lowercased())")
        nickname.text = dataSource.nickname
    }
}

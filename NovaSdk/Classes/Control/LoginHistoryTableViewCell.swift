//
// Created by  on 2025/5/26.
//

import Foundation

class LoginHistoryTableViewCell: BaseTableViewCell {

    private var iconImage = BaseUI.imageView()

    private var nameLabel = BaseUI.label(
            text: "-",
            font: gameTheme.littleTitle.boldFont,
            textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
            textAlignment: NSTextAlignment.left
    )

    private var roleLabel = BaseUI.label(
            text: "-",
            font: gameTheme.littleTitle.font,
            textColor: UIColor.dynamicColor(gameTheme.littleTitle.textColor),
            textAlignment: NSTextAlignment.left
    )

    private var platformsView : UIView?

    private var timeLabel = BaseUI.label(
            text: "-",
            font: gameTheme.descriptionTitle.font,
            textColor: UIColor.dynamicColor(gameTheme.descriptionTitle.textColor),
            textAlignment: NSTextAlignment.left
    )

    private let bridge = BaseUI.roundButton(
            UIImage.color(color: .green),
            UIImage.color(color: .green),
            UIImage.color(color: .green)
    )

    private let line = BaseUI.line()

    var loginHistory: LoginHistory?

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
        contentView.addSubview(iconImage)
        iconImage.snp.makeConstraints { (make: ConstraintMaker) in
            make.left.equalTo(12)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(44)
        }

        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make: ConstraintMaker) in
            make.left.equalTo(iconImage.snp.right).offset(8)
            make.top.equalTo(6)
            make.right.equalTo(-16)
        }

        bridge.layer.cornerRadius = 5
        bridge.layer.masksToBounds = true
        bridge.isHidden = true
        contentView.addSubview(bridge)
        bridge.snp.makeConstraints { (make: ConstraintMaker) in
            make.right.equalTo(-10)
            make.width.height.equalTo(10)
            make.centerY.equalToSuperview()
        }

        roleLabel.numberOfLines = 0
        roleLabel.layer.masksToBounds = true
        contentView.addSubview(roleLabel)

        roleLabel.snp.makeConstraints { (make: ConstraintMaker) in
            make.left.equalTo(iconImage.snp.right).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.right.equalTo(-12)
        }

        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { (make: ConstraintMaker) in
            make.left.equalTo(iconImage.snp.right).offset(10)
            make.top.equalTo(roleLabel.snp.bottom).offset(6)
            make.right.equalTo(-12)
            make.bottom.equalTo(-6)
        }

        contentView.addSubview(line)
        line.snp.makeConstraints { (make: ConstraintMaker) in
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(1)
            make.bottom.equalTo(0.5)
        }
    }

    func icons(_ icons: [VerifiablePlatform]) -> UIView {
        let view = BaseUI.view()

        var imageView: UIImageView?
        for element in icons {
            if let other = element as? VerifiablePlatform {
                let icon = BaseUI.imageView("logo_\(other.platform.name.lowercased())")
                view.addSubview(icon)
                if let imageView {
                    icon.snp.makeConstraints { make in
                        make.left.equalTo(imageView.snp.right).offset(4)
                        make.width.height.equalTo(imageView)
                    }
                } else {
                    icon.snp.makeConstraints { make in
                        make.top.left.bottom.equalToSuperview()
                        make.width.height.equalTo(16)
                    }
                }
                imageView = icon
            }
        }

        if let imageView {
            imageView.snp.makeConstraints { make in
                make.right.equalToSuperview()
            }
        }
        return view
    }

    func setDataSource(_ loginHistory: LoginHistory) {
        self.loginHistory = loginHistory

        if let player = BaseBridge.shared.player {
            bridge.isHidden = !(player.playerId == loginHistory.playerId)
        }

        iconImage.image = UIImage.imageName(name: "logo_\(loginHistory.platform.name.lowercased())")

        if loginHistory.platform == RevealedPlatform.device {
            nameLabel.text = LocalizedString("guest", "Guest")
        } else if loginHistory.nickname.isEmpty {
            nameLabel.text = loginHistory.platform.name
        } else {
            nameLabel.text = loginHistory.nickname
        }

        if let gameRole = loginHistory.gameRoles.first(where: { $0.roleName.isNotEmpty }) {
            roleLabel.text = "\(gameRole.serverName) \(gameRole.roleName) Lv\(gameRole.level)"
        }

        let infos = loginHistory.verifiablePlatforms.filter { info in info.platform != loginHistory.platform }
        platformsView = icons(infos)
        if let platformsView {
            contentView.addSubview(platformsView)
            platformsView.snp.makeConstraints { (make: ConstraintMaker) in
                make.right.equalTo(-10)
                make.bottom.equalTo(-8)
            }
        }

        timeLabel.text = loginHistory.lastLoginTime.dateFormatter()
    }
}

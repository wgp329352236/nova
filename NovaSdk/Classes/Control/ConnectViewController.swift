//
//  Created on 2024/7/6.
//

import Foundation

class ConnectViewController: BaseConnect {

    var connectionInfo: [PlatformConnectionInfo]

    init(_ connectionInfo: [PlatformConnectionInfo]) {
        self.connectionInfo = connectionInfo
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

        connectionInfo = connectionInfo.filter {
            $0.uuid.isEmpty
        }

        connectionInfo = connectionInfo.sorted {
            // 将 email 放到最后
            if $0.platform == .email && $1.platform != .email {
                return false
            } else if $0.platform != .email && $1.platform == .email {
                return true
            }
            // 普通平台按名称排序
            return $0.platform.platform < $1.platform.platform
        }

        connectionInfo.forEach { info in
            let button: BaseButton = BaseUI.imageButton(
                    normalBGImage: UIImage.imageName(name: "logo_\(info.platform.platform.lowercased())")
            )

            button.stringTag = info.platform.platform
            button.addTarget(self, action: #selector(connectByPlatform(_:)), for: .touchUpInside)
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
    func connectByPlatform(_ button: BaseButton) {
        let stringTag = button.stringTag
        let platform = Platform.companion.getEnumByValue(platform: stringTag)
        connect(platform)
    }

    @objc
    func connectByEmail() {
        let emailConnect = EmailConnectViewController()
        emailConnect.modalPresentationStyle = .overFullScreen
        providesPresentationContextTransitionStyle = true
        definesPresentationContext = true
        self.present(emailConnect, animated: true)

        emailConnect.promise.then { [self](_, player) in
            connectSuccess(player, false)
        }
    }

    @objc
    func connect(_ platform: Platform) {
        if platform == .email {
            connectByEmail()
        } else {
            ThirdPartyFactory.shared.authorize(platform)
                    .then { _, credentials in
                        BaseBridge.shared.connect(platform, credentials!)
                                .then { [self](_, player) in
                                    connectSuccess(player)
                                }
                                .otherwise { [self] (_, throwable) in
                                    connectFailure(throwable)
                                }
                    }
                    .otherwise { [self] (_, throwable) in
                        connectFailure(throwable)
                    }
        }
    }

}

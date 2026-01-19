//
//  ViewController.swift
//  NovaSdkDemo
//
//   Created on 2024/6/15.
//

import UIKit
import NovaSdk
import StoreKit

class ViewController: BaseViewController {

    override var shouldAutorotate: Bool {
        if supportedOrientations() == DemoOrientation.portrait {
            return false
        }
        return true

    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if supportedOrientations() == DemoOrientation.portrait {
            return .portrait
        } else {
            return .landscape
        }
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if supportedOrientations() == DemoOrientation.portrait {
            return .portrait
        } else {
            return .landscapeRight
        }
    }

    var player: GamePlayer?


    var clientInfo: ClientInfo? {
        get {
            NovaKit.shared.clientInfo
        }
    }

    var gameRole: GameRole? {
        get {
            NovaKit.shared.currentGameRole
        }
    }

    var logsView: UITextView = {
        let textView = UITextView(frame: .zero, textContainer: .none)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.textAlignment = .left
        textView.isEditable = false
        return textView
    }()

    func scrollToBottom() {
        guard logsView.hasText else { return }
        let range = NSMakeRange(logsView.text.count - 1, 1)
        logsView.scrollRangeToVisible(range)
    }

    var logs: String? {
        willSet {
            DispatchQueue.main.async { [self] in
                if logsView.text.count > 0 {
                    logsView.text += "\n" + (newValue ?? "")
                } else {
                    logsView.text = newValue
                }
                scrollToBottom()
            }
        }
    }

    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isUserInteractionEnabled = true
        scroll.contentSize = CGSize.zero

        let tap = UITapGestureRecognizer(target: self, action: #selector(viewEndEditing))
        tap.cancelsTouchesInView = true
        scroll.addGestureRecognizer(tap)

        return scroll
    }()

    let contentView: UIView = {
        let view = UIView()
        return view
    }()

    var payProductIdView: UIView?
    var productIdInput: UITextField?

    var payExtentView: UIView?
    var extentInput: UITextField?

    var trackNameView: UIView?
    var trackNameInput: UITextField?

    let initButton = buildButton("初始化测试")
    let userCenterButton = buildButton("显示个人中心")

    let loginButton = buildButton("账号登录")
    let switchButton = buildButton("账号切换")
    let connectButton = buildButton("账号关联")
    let deregisterButton = buildButton("账号注销")
    let changeLanguageButton = buildButton("切换语言")
    let setGameRoleButton = buildButton("设置角色信息")
    let levelUpButton = buildButton("Level升级")
    let vipLevelUpButton = buildButton("Vip升级")

    let payProductId = buildInputView("商品ID:", "请输入商品ID")
    let payExtent = buildInputView("透传参数:", "请输入透传参数")

    let payButton = buildButton("支付")
    let productsButton = buildButton("商品列表")

    let trackName = buildInputView("事件名称:", "请输入事件名称")
    let trackButton = buildButton("事件上报")

    let shareButton = buildButton("分享图片")
    let shareLinkButton = buildButton("分享链接")
    let customerButton = buildButton("联系客服")
    let adButton = buildButton("显示广告")

    let webTextField = buildTextField("请输入链接")
    let webButton = buildButton("显示Web")

    let webPayTextField = buildTextField("请输入WebPay链接")
    let webPayButton = buildButton("显示WebPay")

    let ageLimitOpenButton = buildButton("显示浮窗")
    let ageLimitCloseButton = buildButton("关闭浮窗")

    let officeButton = buildButton("展示官网")
    let officeRechargeButton = buildButton("官网充值")

    var safeAreaInsets = UIEdgeInsets(top: 59.0, left: 0.0, bottom: 34.0, right: 0.0)

    func setupViews() {
        let orientation = UIApplication.shared.statusBarOrientation
        if orientation == .portrait {
            safeAreaInsets = UIEdgeInsets(top: 59.0, left: 0.0, bottom: 34.0, right: 0.0)
            layoutPortrait()
        } else {
            safeAreaInsets = UIEdgeInsets(top: 0.0, left: 59.0, bottom: 21.0, right: 59.0)
            layoutLandscape()
        }
    }

    @objc
    func onDeviceOrientationDidChange() {
        setupViews()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

    func listenDeviceOrientation() {
        NotificationCenter.default.addObserver(self,
                selector: #selector(onDeviceOrientationDidChange),
                name: .UIApplicationDidChangeStatusBarFrame,
                object: nil)
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    }


    override func viewDidLoad() {
        listenDeviceOrientation()
        super.viewDidLoad()

        NovaKit.shared.fetchStoreInfo().then { info in
            self.logs = "商店信息: id=\(info.appId), countryCode=\(info.countryCode)"
        }
 
        backgroundEvents()

        // Do any additional setup after loading the view.
        view.addSubview(logsView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(initButton)
        initButton.addTarget(self, action: #selector(checkSdkStatus), for: .touchUpInside)

        contentView.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)

        contentView.addSubview(switchButton)
        switchButton.addTarget(self, action: #selector(switchAccount), for: .touchUpInside)

        contentView.addSubview(connectButton)
        connectButton.addTarget(self, action: #selector(connectAccount), for: .touchUpInside)

        contentView.addSubview(deregisterButton)
        deregisterButton.addTarget(self, action: #selector(deregisterAccount), for: .touchUpInside)

        contentView.addSubview(changeLanguageButton)
        changeLanguageButton.addTarget(self, action: #selector(changeLanguage), for: .touchUpInside)

        contentView.addSubview(setGameRoleButton)
        setGameRoleButton.addTarget(self, action: #selector(setGameRole), for: .touchUpInside)

        contentView.addSubview(levelUpButton)
        levelUpButton.addTarget(self, action: #selector(levelUp), for: .touchUpInside)

        contentView.addSubview(vipLevelUpButton)
        vipLevelUpButton.addTarget(self, action: #selector(vipLevelUp), for: .touchUpInside)

        payProductIdView = payProductId.0
        productIdInput = payProductId.1
        contentView.addSubview(payProductIdView!)

        payExtentView = payExtent.0
        extentInput = payExtent.1
        contentView.addSubview(payExtentView!)

        contentView.addSubview(payButton)
        payButton.addTarget(self, action: #selector(pay), for: .touchUpInside)

        contentView.addSubview(productsButton)
        productsButton.addTarget(self, action: #selector(products), for: .touchUpInside)

        trackNameView = trackName.0
        trackNameInput = trackName.1
        contentView.addSubview(trackNameView!)

        contentView.addSubview(trackButton)
        trackButton.addTarget(self, action: #selector(track), for: .touchUpInside)

        contentView.addSubview(shareButton)
        shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)

        contentView.addSubview(shareLinkButton)
        shareLinkButton.addTarget(self, action: #selector(shareLink), for: .touchUpInside)

        contentView.addSubview(customerButton)
        customerButton.addTarget(self, action: #selector(showCustomer), for: .touchUpInside)

        contentView.addSubview(adButton)
        adButton.addTarget(self, action: #selector(showRewardedAd), for: .touchUpInside)

        contentView.addSubview(userCenterButton)
        userCenterButton.addTarget(self, action: #selector(showUserCenter), for: .touchUpInside)

        contentView.addSubview(webTextField)
        contentView.addSubview(webButton)
        webButton.addTarget(self, action: #selector(showWebView), for: .touchUpInside)

        contentView.addSubview(webPayTextField)
        contentView.addSubview(webPayButton)
        webPayButton.addTarget(self, action: #selector(showWebPay), for: .touchUpInside)

        contentView.addSubview(ageLimitOpenButton)
        ageLimitOpenButton.addTarget(self, action: #selector(openAgeLimit), for: .touchUpInside)
        contentView.addSubview(ageLimitCloseButton)
        ageLimitCloseButton.addTarget(self, action: #selector(closeAgeLimit), for: .touchUpInside)

        contentView.addSubview(officeButton)
        officeButton.addTarget(self, action: #selector(showOfficial), for: .touchUpInside)
        contentView.addSubview(officeRechargeButton)
        officeRechargeButton.addTarget(self, action: #selector(showOfficialRecharge), for: .touchUpInside)

        setupViews()

        webTextField.text = "https://pay-dev.novasonic.games/test.html?os=ios"
    }

    let buttonSize = CGSize(width: 125, height: 44)
    private func layoutPortrait() {
        logsView.snp.remakeConstraints { make in
            make.top.equalTo(safeAreaInsets.top)
            make.left.equalToSuperview().offset(safeAreaInsets.left)
            make.right.equalToSuperview().offset(-safeAreaInsets.right)
            make.height.equalTo(180)
        }

        scrollView.snp.remakeConstraints { make in
            make.top.equalTo(logsView.snp.bottom)
            make.left.equalToSuperview().offset(safeAreaInsets.left)
            make.right.equalToSuperview().offset(-safeAreaInsets.right)
            make.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(24)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-24)
        }

        initButton.snp.remakeConstraints { make in
            make.top.equalToSuperview()
            make.size.equalTo(buttonSize)
            make.left.equalToSuperview()
        }
        
        userCenterButton.snp.remakeConstraints { make in
            make.top.bottom.width.equalTo(initButton)
            make.left.equalTo(initButton.snp.right).offset(24)
            make.right.equalToSuperview()
        }

        loginButton.snp.remakeConstraints { make in
            make.top.equalTo(initButton.snp.bottom).offset(24)
            make.left.size.equalTo(initButton)
        }

        switchButton.snp.remakeConstraints { make in
            make.size.top.equalTo(loginButton)
            make.left.equalTo(loginButton.snp.right).offset(24)
            make.right.equalToSuperview()
        }

        connectButton.snp.remakeConstraints { make in
            make.size.right.equalTo(loginButton)
            make.top.equalTo(loginButton.snp.bottom).offset(24)
        }

        deregisterButton.snp.remakeConstraints { make in
            make.size.left.equalTo(switchButton)
            make.top.equalTo(connectButton)
        }

        changeLanguageButton.snp.remakeConstraints { make in
            make.size.right.equalTo(loginButton)
            make.top.equalTo(connectButton.snp.bottom).offset(24)
        }

        setGameRoleButton.snp.remakeConstraints { make in
            make.size.left.equalTo(switchButton)
            make.top.equalTo(changeLanguageButton)
        }

        levelUpButton.snp.remakeConstraints { make in
            make.size.right.equalTo(loginButton)
            make.top.equalTo(changeLanguageButton.snp.bottom).offset(24)
        }

        vipLevelUpButton.snp.remakeConstraints { make in
            make.size.left.equalTo(switchButton)
            make.top.equalTo(levelUpButton)
        }

        payProductIdView!.snp.remakeConstraints { make in
            make.top.equalTo(levelUpButton.snp.bottom).offset(24)
            make.left.height.equalTo(loginButton)
            make.right.equalTo(switchButton)
        }

        payExtentView!.snp.remakeConstraints { make in
            make.top.equalTo(payProductIdView!.snp.bottom).offset(24)
            make.left.right.height.equalTo(payProductIdView!)
        }

        productsButton.snp.remakeConstraints { make in
            make.size.right.equalTo(loginButton)
            make.top.equalTo(payExtentView!.snp.bottom).offset(24)
        }

        payButton.snp.remakeConstraints { make in
            make.size.left.equalTo(switchButton)
            make.top.equalTo(productsButton)
        }

        trackNameView!.snp.remakeConstraints { make in
            make.top.equalTo(payButton.snp.bottom).offset(24)
            make.left.right.height.equalTo(payExtentView!)
        }

        trackButton.snp.remakeConstraints { make in
            make.size.right.equalTo(loginButton)
            make.top.equalTo(trackNameView!.snp.bottom).offset(24)
        }

        shareButton.snp.remakeConstraints { make in
            make.size.right.equalTo(loginButton)
            make.top.equalTo(trackButton.snp.bottom).offset(24)
        }

        shareLinkButton.snp.remakeConstraints { make in
            make.size.top.equalTo(shareButton)
            make.left.equalTo(switchButton)
        }

        customerButton.snp.remakeConstraints { make in
            make.size.right.equalTo(loginButton)
            make.top.equalTo(shareLinkButton.snp.bottom).offset(24)
        }

        adButton.snp.remakeConstraints { make in
            make.size.left.equalTo(switchButton)
            make.top.equalTo(customerButton)
        }

        webTextField.snp.makeConstraints { make in
            make.top.equalTo(customerButton.snp.bottom).offset(24)
            make.height.equalTo(loginButton)
            make.left.equalTo(customerButton)
            make.right.equalTo(adButton)
        }

        webButton.snp.remakeConstraints { make in
            make.size.left.equalTo(loginButton)
            make.top.equalTo(webTextField.snp.bottom).offset(24)
        }

        webPayTextField.snp.makeConstraints { make in
            make.size.right.left.equalTo(webTextField)
            make.top.equalTo(webButton.snp.bottom).offset(24)
        }

        webPayButton.snp.remakeConstraints { make in
            make.size.left.equalTo(webButton)
            make.top.equalTo(webPayTextField.snp.bottom).offset(24)
        }

        ageLimitOpenButton.snp.remakeConstraints { make in
            make.size.left.equalTo(loginButton)
            make.top.equalTo(webPayButton.snp.bottom).offset(24)
        }

        ageLimitCloseButton.snp.remakeConstraints { make in
            make.size.top.equalTo(ageLimitOpenButton)
            make.left.equalTo(switchButton)
        }

        officeButton.snp.remakeConstraints { make in
            make.size.left.equalTo(loginButton)
            make.top.equalTo(ageLimitOpenButton.snp.bottom).offset(24)
            make.bottom.equalToSuperview()
        }

        officeRechargeButton.snp.remakeConstraints { make in
            make.size.top.equalTo(officeButton)
            make.left.equalTo(switchButton)
        }

    }

    private func layoutLandscape() {
        logsView.snp.remakeConstraints { make in
            make.top.equalTo(safeAreaInsets.top)
            make.left.equalToSuperview().offset(safeAreaInsets.left)
            make.right.equalToSuperview().offset(-safeAreaInsets.right)
            make.height.equalTo(100)
        }

        scrollView.snp.remakeConstraints { make in
            make.top.equalTo(logsView.snp.bottom)
            make.left.equalToSuperview().offset(safeAreaInsets.left)
            make.right.equalToSuperview().offset(-safeAreaInsets.right)
            make.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(24)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-24)
        }

        initButton.snp.remakeConstraints { make in
            make.top.equalToSuperview()
            make.size.equalTo(buttonSize)
            make.left.equalToSuperview()
        }

        userCenterButton.snp.remakeConstraints { make in
            make.top.size.equalTo(initButton)
            make.left.equalTo(initButton.snp.right).offset(24)
        }

        loginButton.snp.remakeConstraints { make in
            make.left.size.equalTo(initButton)
            make.top.equalTo(initButton.snp.bottom).offset(24)
        }

        switchButton.snp.remakeConstraints { make in
            make.size.top.equalTo(loginButton)
            make.left.equalTo(loginButton.snp.right).offset(24)
        }

        connectButton.snp.remakeConstraints { make in
            make.size.top.equalTo(loginButton)
            make.left.equalTo(switchButton.snp.right).offset(24)
        }

        deregisterButton.snp.remakeConstraints { make in
            make.size.top.equalTo(loginButton)
            make.left.equalTo(connectButton.snp.right).offset(24)
            make.right.equalToSuperview()
        }

        changeLanguageButton.snp.remakeConstraints { make in
            make.size.left.equalTo(loginButton)
            make.top.equalTo(loginButton.snp.bottom).offset(24)
        }

        setGameRoleButton.snp.remakeConstraints { make in
            make.size.top.equalTo(changeLanguageButton)
            make.left.equalTo(changeLanguageButton.snp.right).offset(24)
        }

        levelUpButton.snp.remakeConstraints { make in
            make.size.top.equalTo(changeLanguageButton)
            make.left.equalTo(setGameRoleButton.snp.right).offset(24)
        }

        vipLevelUpButton.snp.remakeConstraints { make in
            make.size.top.equalTo(changeLanguageButton)
            make.left.equalTo(levelUpButton.snp.right).offset(24)
        }

        payProductIdView!.snp.remakeConstraints { make in
            make.top.equalTo(changeLanguageButton.snp.bottom).offset(24)
            make.left.height.equalTo(loginButton)
            make.right.equalTo(switchButton)
        }

        payExtentView!.snp.remakeConstraints { make in
            make.top.size.equalTo(payProductIdView!)
            make.left.equalTo(payProductIdView!.snp.right).offset(24)
        }

        payButton.snp.remakeConstraints { make in
            make.size.left.equalTo(loginButton)
            make.top.equalTo(payProductIdView!.snp.bottom).offset(24)
            make.left.equalTo(payProductIdView!)
        }

        productsButton.snp.remakeConstraints { make in
            make.size.top.equalTo(payButton)
            make.left.equalTo(payButton.snp.right).offset(24)
        }

        trackNameView!.snp.remakeConstraints { make in
            make.top.equalTo(payButton.snp.bottom).offset(24)
            make.left.right.height.equalTo(payProductIdView!)
        }

        trackButton.snp.remakeConstraints { make in
            make.size.equalTo(loginButton)
            make.top.equalTo(trackNameView!)
            make.left.equalTo(trackNameView!.snp.right).offset(24)
        }

        shareButton.snp.remakeConstraints { make in
            make.size.left.equalTo(loginButton)
            make.top.equalTo(trackButton.snp.bottom).offset(24)
        }

        shareLinkButton.snp.remakeConstraints { make in
            make.size.top.equalTo(shareButton)
            make.left.equalTo(shareButton.snp.right).offset(24)
        }

        customerButton.snp.remakeConstraints { make in
            make.size.top.equalTo(shareButton)
            make.left.equalTo(shareLinkButton.snp.right).offset(24)
        }

        adButton.snp.remakeConstraints { make in
            make.size.top.equalTo(shareButton)
            make.left.equalTo(customerButton.snp.right).offset(24)
        }

        webTextField.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(shareButton.snp.bottom).offset(24)
            make.left.height.equalTo(loginButton)
            make.right.equalTo(switchButton)
        }

        webButton.snp.remakeConstraints { make in
            make.size.equalTo(initButton)
            make.top.equalTo(webTextField)
            make.left.equalTo(webTextField.snp.right).offset(24)
        }

        webPayTextField.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(webTextField.snp.bottom).offset(24)
            make.left.height.right.equalTo(webTextField)
        }

        webPayButton.snp.remakeConstraints { make in
            make.size.equalTo(initButton)
            make.top.equalTo(webPayTextField)
            make.left.equalTo(webPayTextField.snp.right).offset(24)
        }

        ageLimitOpenButton.snp.remakeConstraints { make in
            make.size.left.equalTo(loginButton)
            make.top.equalTo(webPayButton.snp.bottom).offset(24)
            make.bottom.equalTo(-24)
        }

        ageLimitCloseButton.snp.remakeConstraints { make in
            make.size.top.equalTo(ageLimitOpenButton)
            make.left.equalTo(ageLimitOpenButton.snp.right).offset(24)
        }


        officeButton.snp.remakeConstraints { make in
            make.size.top.equalTo(ageLimitOpenButton)
            make.left.equalTo(ageLimitCloseButton.snp.right).offset(24)
        }

        officeRechargeButton.snp.remakeConstraints { make in
            make.size.top.equalTo(ageLimitOpenButton)
            make.left.equalTo(officeButton.snp.right).offset(24)
        }
    }

    func backgroundEvents() {
        NovaKit.shared.backgroundEvents.playerConnected.then { event in
            self.player = event.player
            output("关联账号成功！- backgroundEvents")
            self.logs = "关联账号成功！\nPlayer = \(self.player?.serialized ?? "")"
        }
    }

    // 验证初始化状态
    @objc func checkSdkStatus() {
        NovaKit.shared.initialize(isDebug: false, language: .english).then {
                    self.logs = "初始化成功！\n"
                    output("初始化成功！")
                }
                .otherwise { [self] throwable in
                    logs = "初始化失败！\nError = \(throwable?.message ?? "")"
                    output("初始化失败！error = \(throwable?.message ?? "")")
                }
    }

    @objc func login() {

        NovaKit.shared.logEvent(name: "SDKTestFBEvent", params: ["params_1": "test_1", "params_2": "test_2", "test_event_code": "2le_1747728661119"], consumer: TrackingKit.TrackingConsumerCompanion.shared.FACEBOOK)


        logs = "开始登录 ---"
        NovaKit.shared.login()
                .then { [self] player in
                    self.player = player
                    logs = "登录成功！\nPlayer = \(player!.serialized)"
//                    output("login success. player = \(player!)")
                }
                .otherwise { [self] throwable in
                    logs = "登录失败！\nError = \(throwable?.message ?? "")"
                    output("login error. error = \(throwable?.message ?? "")")
                }
    }

    var level = 1
    var vipLevel = 1

    private var count = 1
    @objc func setGameRole() {
        logs = "设置角色信息"
        if let player {
            let roleId = "\(player.playerId)_\(count)"

            NovaKit.shared.setRoleInfo(
                    roleId: "\(roleId)_roleId",
                    roleName: "\(player.playerId)_roleName",
                    serverId: "\(player.playerId)_serverId",
                    serverName: "\(player.playerId)_serverName",
                    serverType: ServerType.all,
                    level: level,
                    vipLevel: vipLevel,
                    coins: 1,
                    isFirstLogin: player.isFirstLogin
            )
            logs = "setGameRole \nGameRole = \(NovaKit.shared.currentGameRole!)"
            output("setGameRole roleId=\(player.playerId)_roleId, level = \(level), vipLevel = \(vipLevel)")
            count += 1
            setTestWebPay()
        } else {
            output("setGameRole error")
        }
    }

    @objc func levelUp() {
        level += 1
        logs = "Level升级"
        if let player {
            NovaKit.shared.setRoleInfo(
                    roleId: "\(player.playerId)_roleId",
                    roleName: "\(player.playerId)_roleName",
                    serverId: "\(player.playerId)_serverId",
                    serverName: "\(player.playerId)_serverName",
                    serverType: ServerType.all,
                    level: level,
                    vipLevel: vipLevel,
                    coins: 1,
                    isFirstLogin: player.isFirstLogin
            )
            logs = "levelUp！\nGameRole = \(NovaKit.shared.currentGameRole!)"
            output("Level升级！roleId=\(player.playerId)_roleId, level = \(level), vipLevel = \(vipLevel)")
        }
    }

    @objc func vipLevelUp() {
        logs = "Vip升级"
        vipLevel += 1
        if let player {
            NovaKit.shared.setRoleInfo(
                    roleId: "\(player.playerId)_roleId",
                    roleName: "\(player.playerId)_roleName",
                    serverId: "\(player.playerId)_serverId",
                    serverName: "\(player.playerId)_serverName",
                    serverType: ServerType.all,
                    level: level,
                    vipLevel: vipLevel,
                    coins: 1,
                    isFirstLogin: player.isFirstLogin
            )
            logs = "vipLevelUp！\nGameRole = \(NovaKit.shared.currentGameRole!)"
            output("Vip升级！roleId=\(player.playerId)_roleId, level = \(level), vipLevel = \(vipLevel)")
        }
    }

    @objc func changeLanguage() {
        logs = "切换语言"
        NovaKit.shared.changeLanguage(Language.korean)
        let alert = UIAlertController(title: "切换语言", message: nil, preferredStyle: .actionSheet)
        for idx in 0..<Language.values().size {
            if let language = Language.values().get(index: idx) {
                let action = UIAlertAction(title: language.name, style: .default) { action in
                    self.logs = "切换语言！\nlanguage = \(language.name)"
                    NovaKit.shared.changeLanguage(language)
                }
                alert.addAction(action)
            }
        }

        // 检查当前设备是否为 iPad
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            // 指定视图
            alert.popoverPresentationController?.sourceView = view
            // 指定矩形区域
            alert.popoverPresentationController?.sourceRect = CGRectMake(view.bounds.size.width / 2, view.bounds.size.height, 1, 1)
        }

        present(alert, animated: true)
    }

    @objc func switchAccount() {
        logs = "切换账号"
        NovaKit.shared.switchAccount()
                .then { player in
                    self.player = player
                    self.logs = "切换账号成功！\nPlayer = \(player!)"
//                    output("login success. player = \(player!)")
                }
                .otherwise { throwable in
                    self.logs = "切换账号失败！\nError = \(throwable?.message ?? "")"
                    output("login error. error = \(throwable?.message ?? "")")
                }
    }

    @objc func connectAccount() {
        logs = "关联账号"
        NovaKit.shared.connectAccount(platform: ConnectPlatform.all)
                .then { player in
                    self.player = player
                    self.logs = "关联账号成功！\nPlayer = \(player!)"
//                    output("connect success. player = \(player!)")
                }
                .otherwise { throwable in
                    self.logs = "关联账号失败！\nError = \(throwable?.message ?? "")"
//                    output("connect error. error = \(throwable?.message ?? "")")
                }

    }

    @objc func pay() {
        // 订阅：rss.sdk.100
        // 消耗：normal.sdk.100

        //com.realmsofpixel.ng.60"
        var productId = "normal.sdk.100"
        if let text = productIdInput?.text, text.count > 0 {
            productId = text
        }


        var payExtent = ""
        if let text = extentInput?.text, text.count > 0 {
            payExtent = text
        }

        mdebug("pay. productId = \(productId), payExtent = \(payExtent)")
        logs = "开始支付！\nproductId = \(productId), payExtent = \(payExtent)"
      
        setTestWebPay()
        
        NovaKit.shared.purchase(productId: productId, extensionParam: payExtent)
                .then { result in
                    if let result = result {
                        switch (result.deliveryStatus) {
                        case .success:
                            self.logs = "支付成功！\nResult = \(result)"
                            break
                        case .pending:
                            self.logs = "待支付！\nResult = \(result)"
                            break
                        case .failed:
                            self.logs = "支付失败！\nResult = \(result)"
                            break
                        default: break
                        }
                    }
                    output("Demo pay finish. result = \(result!)")
                }
                .otherwise { throwable in
                    self.logs = "支付失败！\nError = \(throwable.message ?? "")"
                    output("pay error. throwable = \(String(describing: throwable.message))")
                }
    }

    @objc func products() {
        // 订阅：rss.sdk.100
        // 消耗：normal.sdk.100

        NovaKit.shared.fetchProductCatalog(productIds: ["rss.sdk.100", "normal.sdk.100"])
                .then { (products: [ProductInfo]) in
                    var str = ""
                    products.forEach { info in
                        str += " \(info.title) 价格:\(info.price) 描述：\(info.description) "
                    }
                    self.logs = "获取商品列表！\nResult = \(str)"
                    output("fetchProductCatalog success. result = \(str)")
                }
                .otherwise { throwable in
                    self.logs = "获取商品列表失败！\nError = \(throwable.message ?? "")"
                    output("fetchProductCatalog error. throwable = \(String(describing: throwable.message))")
                }
    }

    @objc func share() {
        let image = UIImage.init(named: "001.jpeg")
        let shareContent = ShareContent()
        shareContent.image = image
        NovaKit.shared.share(shareContent: shareContent)
                .then { result in
                    if let result = result {
                        if result.status == ShareStatus.success {
                            self.logs = "分享成功！\n"
                            output("share success.")
                        } else {
                            self.logs = "分享失败！\nError = \(result.message)"
                            output("share error. throwable = \(result.message)")
                        }
                    }
                }
                .otherwise { throwable in
                    self.logs = "分享失败！\nError = \(throwable.message ?? "")"
                    output("share error. throwable = \(String(describing: throwable.message))")
                }
    }

    @objc func shareLink() {

        let shareContent = ShareContent()
        shareContent.text = "baidu"
        shareContent.url = "https://www.baidu.com/"
        
        NovaKit.shared.share(shareContent: shareContent)
                .then { result in
                    if let result = result {
                        if result.status == ShareStatus.success {
                            self.logs = "分享成功！\n"
                            output("share success.")
                        } else {
                            self.logs = "分享失败！\nError = \(result.message)"
                            output("share error. throwable = \(result.message)")
                        }
                    }
                }
                .otherwise { throwable in
                    self.logs = "分享失败！\nError = \(throwable.message ?? "")"
                    output("share error. throwable = \(String(describing: throwable.message))")
                }
    }

    @objc func track() {
        let name = trackNameInput?.text ?? ""
        let floatValue: Float = 3.14
        
        let params: [String : Any] = [
            "key0": floatValue,
            "key1": "value1",
            "key2": 2,
            "key3": false,
            "key4": 4.0,
            "key5": [
                "key5.0": floatValue,
                "key5.1": "value5.1",
                "key5.2": 5,
                "key5.3": false,
                "key5.4": 5.4,
                "key5.5": [
                    "key5.5.1": "value5.5.1",
                    "key5.5.2": nil
                ]
            ]
        ]
        
        output("track name=\(name), params=\(params)")
        logs = "事件跟踪！\ntrack name=\(name), params=\(params)"

        NovaKit.shared.logEvent(
                name: name,
                params: params,
                consumer: TrackingKit.TrackingConsumerCompanion.shared.ADJUST | TrackingKit.TrackingConsumerCompanion.shared.TD | TrackingKit.TrackingConsumerCompanion.shared.TIKTOK
        )
    }

    @objc func deregisterAccount() {
        logs = "账号注销！"
        NovaKit.shared.deregisterAccount()
    }

    @objc func showCustomer() {
        logs = "显示客服"
        NovaKit.shared.showCustomerService()
    }

    @objc func showRewardedAd() {
        logs = "显示广告"
        let unitName = "rewarded"
        
        NovaKit.shared.showRewardedAd(adUnitName: unitName, placement: "646464", extensionParam: "extensionParam-535dgdg")
                .then { (result: AdResult?) in
                    self.logs = "显示广告成功！"
                    if let result {
                        output("showRewardedAd success. result = \(result)")
                    }
                }
                .otherwise { throwable in
                    self.logs = "显示广告失败！\nError = \(throwable.message ?? "")"
                    output("showRewardedAd error. throwable = \(String(describing: throwable.message))")
                }
    }

    @objc func showUserCenter() {
        logs = "显示用户中心"
        NovaKit.shared.showUserCenter()
    }

    @objc func showWebView() {
        if let text = webTextField.text {
            logs = "显示网页：\(text)"
            output("showWebView url=\(text)")
            NovaKit.shared.showWebView(url: text)
        }
    }
    
    func setTestWebPay() {
        if let player = player, let gameRole = gameRole, let clientInfo = clientInfo {
            var productId = "normal.mtest5xen.100"
            if let input = productIdInput?.text, input.isNotEmpty {
                productId = input
            }

            let url = "https://pay-dev.novasonic.games/iap/novasonic?playerToken=\(player.playerToken)&roleId=\(gameRole.roleId)&serverId=\(gameRole.serverId)&t=1751891100&lang=\(clientInfo.gameLanguage)&ext=&st=ios&productId=\(productId)&productType=consume&roleName=\(gameRole.roleName)&roleLevel=\(gameRole.level)&os=ios&deviceId=\(clientInfo.deviceId)&packageName=\(clientInfo.packageName)&sv=\(clientInfo.sdkVersion)&adid="
            webPayTextField.text = url
        }
    }

    @objc
    func showWebPay() {
//         let url = "https://pay-dev.novasonic.games/iap/novasonic?playerToken=\(player?.playerToken ?? "")&roleId=10921256122513_roleId&serverId=10921256122513_serverId&t=1751891100&lang=zh&ext=&st=ios&productId=normal.sdk.100&productType=consume&roleName=10921256122513_roleName&roleLevel=1&os=ios&deviceId=E99CE4FB-C223-412C-8272-B85DB9895EF7&packageName=com.novasonic.sdk.demo&sv=4.2.1&adid="
        if let text = webPayTextField.text {
            logs = "显示网页支付：\(text)"
            output("showWebPay url=\(text)")
            NovaKit.shared.showWebPay(url: text)
        }
    }

    @objc
    func openAgeLimit() {
        NovaKit.shared.openAgeLimitView(initialPoint: CGPoint(x: 0, y: 100))
    }

    @objc
    func closeAgeLimit() {
        NovaKit.shared.closeAgeLimitView()
    }

    @objc
    func showOfficial() {
        NovaKit.shared.showOfficial()
    }

    @objc
    func showOfficialRecharge() {
        NovaKit.shared.showOfficialRecharge()
    }

    @objc func viewEndEditing() {
        view.endEditing(true)
    }
}

//
// Created by on 2025/5/27.
//

import Foundation

class LoginMethodViewController: BaseLogin {

    private var loginHistory: LoginHistory

    private var verifiableInfos: [VerifiablePlatform] {
        get {
            loginHistory.verifiablePlatforms
        }
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.register(LoginMethodTableViewCell.self, forCellReuseIdentifier: "LoginMethodTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .clear
        return tableView
    }()

    init(_ loginHistory: LoginHistory) {
        self.loginHistory = loginHistory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // 在 layoutSubviews 中更新高度
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.layoutIfNeeded()
        let height = tableView.contentSize.height
        let contentOffset: Double = height + CGFloat(verifiableInfos.count) * 12 + 1.0
        tableView.snp.makeConstraints { make in
            make.height.equalTo(contentOffset)
        }
    }

    func setupUI() {
        contentView.snp.remakeConstraints { (make: ConstraintMaker) in
            make.center.equalToSuperview()
            make.width.equalTo(contentWidth)
        }

        titleLabel.text = LocalizedString("login_select_one_method", "Use another verification method")
        titleLabel.isHidden = true

        contentView.addSubview(tableView)
        tableView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(-12)
        }
    }

}

extension LoginMethodViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        verifiableInfos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoginMethodTableViewCell", for: indexPath) as! LoginMethodTableViewCell
        cell.setDataSource(verifiableInfos[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let info = verifiableInfos[indexPath.row] as? VerifiablePlatform {
            let platform = Platform.Companion.shared.getEnumFromRevealedPlatform(item: info.platform)
            login(platform, info.uuid, info.nickname)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

}


//
// Created by  on 2025/7/4.
//

import Foundation


class WebPayViewController: WebViewViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.edgesForExtendedLayout = []
//        self.extendedLayoutIncludesOpaqueBars = false

        setupNavigationBar()
        configureWebViewForSafeArea()
    }

    func setupNavigationBar() {
        let image = UIImage.iconImage(iconFont: .close,
                size: CGSize(width: 36, height: 36),
                fontSize: 24,
                textColor: .gray,
                backgroundColor: UIColor.rgbaColor(r: 255, g: 255, b: 255, a: 0.7),
                cornerRadius: 18
        )?.withRenderingMode(.alwaysOriginal)

        let closeButton = UIBarButtonItem(
                image: image,
                style: UIBarButtonItem.Style.plain,
                target: self,
                action: #selector(onViewClose)
        )

        self.navigationItem.rightBarButtonItem = closeButton
    }

    private func configureWebViewForSafeArea() {
        guard let webView = (self as? WebViewViewController)?.webView else {
            return
        }

        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
                [
                    webView.topAnchor.constraint(equalTo: view.topAnchor),
                    webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ]
        )

        if #available(iOS 11.0, *) {
            webView.scrollView.contentInsetAdjustmentBehavior = .never
            webView.scrollView.showsHorizontalScrollIndicator = false
            webView.scrollView.showsVerticalScrollIndicator = false
        }
    }

    override func onWebViewClose() {
        isJSMessage = true
        dismiss(animated: true) { [self] in
            viewPromise.resolve(result: KotlinUnit())
        }
    }

    override func onViewClose() {
        isJSMessage = true
        dismiss(animated: true) { [self] in
            viewPromise.resolve(result: KotlinUnit())
        }
    }
}

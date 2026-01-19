//
//  RealNameViewController.swift
//  NovaSdk
//
//  Created by on 2025/8/29.
//

class RealNameViewController: WebViewViewController {

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

    }
    
    override func load(_ url: String) {
        if url.isNotEmpty {
            if let requestURL = URL(string: url), let token = LocalConfig.shared.hhGameToken {
                var request = URLRequest(url: requestURL)
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                webView.load(request)
            }
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

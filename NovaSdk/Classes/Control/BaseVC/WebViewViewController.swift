//
//  Created on 2024/7/7.
//

import Foundation
import WebKit

private struct JSMessage {
    static let COPY: String = "CallOcCopy"
    static let CLOSE: String = "closeWebView"
    static let CLOSE_WINDOW: String = "closeWindow"
    static let OPEN_BROWSER: String = "openBrowser"

    enum MODE: String {
        case GET = "get"
        case SET = "set"
    }

    static func ORIENTATION(_ mode: MODE) -> String {
        "\(mode.rawValue)Orientation"
    }

    static func PLAYER_TOKEN(_ mode: MODE) -> String {
        "\(mode.rawValue)PlayerToken"
    }

    static func CUSTOMER_EXTEND(_ mode: MODE) -> String {
        "\(mode.rawValue)CustomerServiceExtend"
    }

    static func CLIENT_INFO(_ mode: MODE) -> String {
        "\(mode.rawValue)ClientInfo"
    }

    static func GAME_ROLE(_ mode: MODE) -> String {
        "\(mode.rawValue)GameRole"
    }

    static func PLAYER_INFO(_ mode: MODE) -> String {
        "\(mode.rawValue)PlayerInfo"
    }

    static let LOG_EVENT = "logEvent"
    static let REPAY_PAGE = "showRepayPage"

}


class WebViewViewController: BaseViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {

    var url: String
    var webView: WKWebView!

    let viewPromise = Promise<KotlinUnit>.init(waitFor: nil)

    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.COPY)
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.CLOSE)
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.CLOSE_WINDOW)
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.OPEN_BROWSER)
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.PLAYER_TOKEN(.GET))
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.PLAYER_INFO(.GET))
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.GAME_ROLE(.GET))
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.CUSTOMER_EXTEND(.GET))
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.REPAY_PAGE)

        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.CLIENT_INFO(.GET))
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.ORIENTATION(.GET))
        webView.configuration.userContentController.removeScriptMessageHandler(forName: JSMessage.LOG_EVENT)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        load(url)
    }

    func setupPreferences() -> WKPreferences {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        preferences.javaScriptCanOpenWindowsAutomatically = true
        return preferences
    }

    func setupWebView() {
        let config = WKWebViewConfiguration()
        config.selectionGranularity = .dynamic
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        let userContentController = WKUserContentController()
        userContentController.add(self, name: JSMessage.COPY)
        userContentController.add(self, name: JSMessage.CLOSE)
        userContentController.add(self, name: JSMessage.CLOSE_WINDOW)
        userContentController.add(self, name: JSMessage.OPEN_BROWSER)
        userContentController.add(self, name: JSMessage.PLAYER_TOKEN(.GET))
        userContentController.add(self, name: JSMessage.PLAYER_INFO(.GET))
        userContentController.add(self, name: JSMessage.GAME_ROLE(.GET))
        userContentController.add(self, name: JSMessage.CUSTOMER_EXTEND(.GET))
        userContentController.add(self, name: JSMessage.CLIENT_INFO(.GET))
        userContentController.add(self, name: JSMessage.ORIENTATION(.GET))
        userContentController.add(self, name: JSMessage.REPAY_PAGE)
        userContentController.add(self, name: JSMessage.LOG_EVENT)

        #if DEBUG
        injectVConsole(to: userContentController)
        #endif

        config.userContentController = userContentController

        if let gameCode = BaseBridge.shared.clientInfo?.gameCode, gameCode.isNotEmpty {
            let userAgent = "nswv-ios/\(gameCode)"
            mdebug("[WebView]: userAgent: \(userAgent)")
            config.applicationNameForUserAgent = userAgent
        }

        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        preferences.javaScriptCanOpenWindowsAutomatically = true
        config.preferences = preferences
        
        webView = WKWebView(frame: .zero, configuration: config)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view.addSubview(webView!)

        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        //        let orientation = (supportedOrientation == .portrait) ? "portrait" : "landscape"
        //        evaluateJS("window.setOrientation", [orientation])
    }

    private func injectVConsole(to userContentController: WKUserContentController) {
        let vConsoleScript = """
                             (function() {
                                 var script = document.createElement('script');
                                 script.src = 'https://unpkg.com/vconsole@latest/dist/vconsole.min.js';
                                 script.onload = function() {
                                     var vConsole = new window.VConsole();
                                 };
                                 document.head.appendChild(script);
                             })();
                             """

        let userScript = WKUserScript(source: vConsoleScript, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        userContentController.addUserScript(userScript)
    }

    func load(_ url: String) {
        if url.isNotEmpty {
            if let requestURL = URL(string: url) {
                webView.load(URLRequest(url: requestURL))
            }
        }
    }

    // MARK: - Delegate
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(WKNavigationResponsePolicy.allow);
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(WKNavigationActionPolicy.allow)
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let event = message.name
        mdebug("[WebView]: didReceive: \(event)")

        switch event {
        case JSMessage.COPY: copyMessage(message); break
        case JSMessage.CLOSE: onWebViewClose(); break
        case JSMessage.CLOSE_WINDOW: onWebViewClose(); break
        case JSMessage.OPEN_BROWSER: openBrowser(message); break
        case JSMessage.PLAYER_TOKEN(.GET): getPlayerToken(); break
        case JSMessage.CUSTOMER_EXTEND(.GET): getCustomerServiceExtend(); break
        case JSMessage.CLIENT_INFO(.GET): fetchClientInfo(); break
        case JSMessage.PLAYER_INFO(.GET): getPlayerInfo(); break
        case JSMessage.GAME_ROLE(.GET): getGameRole(); break
        case JSMessage.LOG_EVENT: logEvent(message); break
        default:
            break
        }
    }

    func evaluateJS(_ message: String, _ params: [String]? = nil) {
        var paramsString = ""
        if params != nil {
            params?.forEach { (element: String) in
                paramsString.append("\(element),")
            }
            if paramsString.isNotEmpty && paramsString.hasSuffix(",") {
                paramsString.removeLast()
            }
        }

        let javaScriptString = "\(message)('\(paramsString)')"
        mdebug("[WebView]: evaluateJS: \(javaScriptString)")
        webView.evaluateJavaScript(javaScriptString)
    }

    @objc func fetchClientInfo() {
        if let clientInfo = BaseBridge.shared.clientInfo {
            let serialized = clientInfo.serialized
            mdebug("[WebView]: clientInfo: \(serialized)")
            evaluateJS(JSMessage.CLIENT_INFO(.SET), [serialized])
        }
    }

    @objc func logEvent(_ message: WKScriptMessage) {
        guard let body = message.body as? [String: Any] else {
            return
        }
        mdebug("[WebView]: logEvent: \(body)")

        if let name = body["eventName"] as? String {
            mdebug("[WebView]: logEvent: name: \(name)")
            if let obj = body["optionsObj"] as? [String: Any] {
                if let value = obj["key"] as? String {
                    mdebug("[WebView]: logEvent: obj: \(obj) - value: \(value)")
                }
            }
        }

        if let name = body["eventName"] as? String, let consumer = body["consumer"] as? Int32 {
            let params = body["params"] as? [String: Any]
            BaseBridge.shared.logEvent(name, params, consumer)
        }
    }

    @objc func openBrowser(_ message: WKScriptMessage) {
        guard let body = message.body as? [String: Any] else {
            return
        }
        if let url = body["url"] as? String, url.isNotEmpty {
            BaseBridge.shared.showSafari(url)
        }

        let shouldClose = body["shouldClose"] as? Bool ?? true
        if shouldClose {
            onWebViewClose()
        }
    }

    @objc func getAgreement() {
//        let dynamicTerms = ""
//        evaluateJS(JSMessage.AGREEMENT(.SET), [dynamicTerms])
    }

    @objc func getPlayerInfo() {
        let serialized = BaseBridge.shared.player?.serialized ?? ""
        evaluateJS(JSMessage.PLAYER_INFO(.SET), [serialized])
    }

    @objc func getGameRole() {
        let serialized = BaseBridge.shared.currentGameRole?.serialized ?? ""
        evaluateJS(JSMessage.GAME_ROLE(.SET), [serialized])
    }

    @objc func copyMessage(_ message: WKScriptMessage) {
        guard let string = message.body as? String else {
            return
        }

        let pasteboard = UIPasteboard.general
        pasteboard.string = string
        evaluateJS(JSMessage.COPY)
    }

    @objc func getPlayerToken() {
        let playerToken = BaseBridge.shared.player?.playerToken ?? ""
        evaluateJS(JSMessage.PLAYER_TOKEN(.SET), [playerToken])
    }

    @objc func getCustomerServiceExtend() {
        let extend = SessionStorage["customerServiceExtend"] ?? ""
        evaluateJS(JSMessage.CUSTOMER_EXTEND(.SET), [extend])
    }

    internal var isJSMessage = false

    @objc func onDoneClick() {
        isJSMessage = true
        dismiss(animated: true) { [self] in
            viewPromise.resolve(result: KotlinUnit())
        }
    }

    @objc func onWebViewClose() {
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

    // TODO:
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }

    open override func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        if isJSMessage {
            super.dismiss(animated: flag, completion: completion)
        } else {
            if (presentedViewController != nil) { // webview present
                super.dismiss(animated: flag, completion: completion)
            }
        }
    }

}

extension UIImagePickerController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .overFullScreen // this will turn off dismiss of webView when imagePicker presents
    }
}




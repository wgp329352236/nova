//
// Created by on 2025/8/14.
//

import Foundation

class WhatsApp: BaseThirdParty {

    required init() {
        super.init()
    }
    
    private func isAppInstall() -> Bool {
        let send = URL(string: "whatsapp://send")!
        let business = URL(string: "whatsapp-business://send")!
        let app = UIApplication.shared
        return app.canOpenURL(send) || app.canOpenURL(business)
    }

    func share(text: String?, image: UIImage?, url: URL?) -> PromiseInterface<ShareResult> {
        let promise = Promise<ShareResult>.init(waitFor: nil)

        if isAppInstall() {
            if let image {
                shareImage(image).takeDelegation(other: promise)
            } else {
                let message = text ?? url?.absoluteString ?? ""
                shareText(message).takeDelegation(other: promise)
            }
        } else {
            mdebug("[WhatsApp]: 未安装")
            let result = ShareResult.companion.failure(platform: .whatsapp, message: "App uninstall")
            promise.resolve(result: result)
        }
        return promise
    }

    private func shareText(_ message: String) -> PromiseInterface<ShareResult> {
        let promise = Promise<ShareResult>.init(waitFor: nil)
        let urlString = "whatsapp://send?text=\(message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        if let whatsappURL = URL(string: urlString), UIApplication.shared.canOpenURL(whatsappURL) {
            UIApplication.shared.open(whatsappURL, options: [:]) { b in
                promise.resolve(result: ShareResult.companion.success(platform: .whatsapp))
            }
        } else {
            mdebug("[WhatsApp]: 未安装")
            let result = ShareResult.companion.failure(platform: .whatsapp, message: "App uninstall")
            promise.resolve(result: result)
        }
        return promise
    }

    // 防止被释放
    private var diController: DIController?

    private func shareImage(_ image: UIImage) -> PromiseInterface<ShareResult> {
        if diController != nil {
            diController = nil
        }
        diController = DIController(image: image, platform: .whatsapp)
        diController?.presentOptionsMenu(from: appTopViewController, animated: true)
        return diController!.promise
    }
}


//
// Created by on 2025/8/14.
//

import Foundation
import UIKit

@objcMembers
public class DIController: NSObject, UIDocumentInteractionControllerDelegate {

    public let promise = Promise<ShareResult>.init(waitFor: nil)

    private let image: UIImage
    private let platform: SocialPlatform

    private let documentController: UIDocumentInteractionController

    public init(image: UIImage, platform: SocialPlatform) {
        self.image = image
        self.platform = platform
        documentController = UIDocumentInteractionController()
        super.init()
    }

    public func presentOptionsMenu(from viewController: UIViewController, animated: Bool) {
        mdebug("[DIController]: presentOptionsMenu")
        guard let imageData = image.pngData() else {
            let result = ShareResult.companion.failure(platform: platform, message: "imageData is nil")
            promise.resolve(result: result)
            return
        }

        let tempDirectory = FileManager.default.temporaryDirectory
        let imagePath = tempDirectory.appendingPathComponent("\(platform.platform)_share.png")

        do {
            try imageData.write(to: imagePath)
            documentController.url = imagePath
            documentController.uti = "public.png"
            documentController.delegate = self
        } catch let error {
            mdebug("[DIController]: Failed to write image for \(platform.name) sharing: \(error)")
            let result = ShareResult.companion.failure(platform: platform, message: "Failed to write image for LINE sharing: \(error)")
            promise.resolve(result: result)
        }
        
        var rect = CGRect.zero
        if DEVICE_IDIOM_IPAD {
            // 使用视图的中心区域作为来源矩形，确保在 iPad 上正常工作
            rect = CGRect(
                    x: viewController.view.bounds.midX,
                    y: viewController.view.bounds.midY,
                    width: 1,
                    height: 1
            )
        }
        documentController.presentOptionsMenu(from: rect, in: viewController.view, animated: true)
    }
    
    public func documentInteractionController(_ controller: UIDocumentInteractionController, didEndSendingToApplication application: String?) {
        mdebug("[DIController]: didEndSendingToApplication, application=\(application ?? "")")
        if promise.state == .pending {
            let result = ShareResult.companion.success(platform: platform)
            promise.resolve(result: result)
        }
    }
   
    public func documentInteractionControllerDidDismissOptionsMenu(_ controller: UIDocumentInteractionController) {
        mdebug("[DIController]: didDismissOptionsMenu")
        if promise.state == .pending {
            let result = ShareResult.companion.success(platform: platform)
            promise.resolve(result: result)
        }
    }
}


//
//  Messenger.swift
//  NovaSdk
//
//  Created by on 2025/10/14.
//

import FBSDKShareKit


class Messenger: BaseThirdParty, SharingDelegate {
    
    required init() {
        super.init()
    }

    // MARK: -- Sharing
    var shareDialog: MessageDialog? = nil

    func share(text: String?, image: UIImage?, url: URL?) -> PromiseInterface<ShareResult> {
        sharePromise = Promise<ShareResult>.init(waitFor: nil)

        if image != nil {
            shareImage(image!, url)
        } else if url != nil {
            shareLink(url!)
        } else {
            shareFailure(ShareException.nonsupportPlatform)
        }

        return sharePromise!
    }

    func shareImage(_ image: UIImage, _ link: URL?) {
        if !(UIApplication.shared.canOpenURL(URL(string: "fbauth2://")!)) {
            shareFailure(UnInstalledApp(LocalizedString("share_uninstall", "To share pictures, first install Facebook")))
            return
        }
        let sharePhotos = [SharePhoto(image: image, isUserGenerated: true)]
        let shareContent = SharePhotoContent()
        shareContent.photos = sharePhotos
        show(shareContent)
    }

    func shareLink(_ link: URL) {
        let shareContent = ShareLinkContent()
        shareContent.contentURL = link
        show(shareContent)
    }

    func show(_ content: SharingContent) {
        shareDialog = MessageDialog(content: content, delegate: self)

        do {
            try shareDialog?.validate()
        } catch {
            let shareResult = ShareResult.companion.failure(platform: .facebook, message: "\(error.localizedDescription)")
            shareSuccess(shareResult)
            return
        }
        
        shareDialog?.show()
    }

    func sharer(_ sharer: Sharing, didCompleteWithResults results: [String: Any]) {
        let shareResult = ShareResult.companion.success(platform: .facebook)
        shareSuccess(shareResult)
        shareDialog = nil
    }

    func sharer(_ sharer: Sharing, didFailWithError error: Error) {
        let shareResult = ShareResult.companion.failure(platform: .facebook, message: "\(error.localizedDescription)")
        shareSuccess(shareResult)
        shareDialog = nil
    }

    func sharerDidCancel(_ sharer: Sharing) {
        let shareResult = ShareResult.companion.failure(platform: .facebook, message: "User Cancel")
        shareSuccess(shareResult)
        shareDialog = nil
    }


}


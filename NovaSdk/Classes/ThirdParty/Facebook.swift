//
//  Created on 2024/6/20.
//

import Foundation

// 18.0.0

import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
import FBAEMKit

import AppTrackingTransparency
//import AHSDK

// 7.4.0
class Facebook: BaseThirdParty, SharingDelegate {

    private let loginManager = LoginManager()

    var isLoggedIn: Bool {
        AccessToken.current != nil || AuthenticationToken.current != nil
    }

    private func presentingViewController() -> UIViewController {
        appTopViewController
    }

    override func authorize(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        if isLoggedIn {
            loginManager.logOut()
        }
        
        authPromise = nil
        authPromise = Promise<PlatformCredentials>.init(waitFor: nil)
        self.uuid = uuid

        var tracking = LoginTracking.enabled
        if #available(iOS 14, *) {
            if (ATTrackingManager.trackingAuthorizationStatus != .authorized) {
                tracking = LoginTracking.limited
            }
        }

        let configuration = LoginConfiguration(
                permissions: [Permission.publicProfile, Permission.email],
                tracking: tracking,
                nonce: SystemTools.deviceUDID()
        )

        loginManager.logIn(configuration: configuration) { [unowned self] result in
            switch result {
            case .cancelled:
                authFailure("cancelled")
            case .failed(let error):
                authFailure(error.localizedDescription)
            case .success:
                let nickname = Profile.current?.name ?? ""
                switch tracking {
                case .enabled:
                    if let accessToken = AccessToken.current?.tokenString {
                        mdebug("[FBLogin]: enabled - accessToken = \(accessToken)")
                        authSuccess(
                                AccessTokenVerifiedCredentials(token: accessToken, platformNickname: nickname, targetUuid: (self.uuid ?? ""))
                        )
                    } else {
                        authFailure("Token is nil")
                    }
                case .limited:
                    if let accessToken = AuthenticationToken.current?.tokenString {
                        let userId = Profile.current?.userID ?? ""
                        mdebug("[FBLogin]: limited - accessToken = \(accessToken), userId = \(userId)")
                        authSuccess(
                                LimitTokenVerifiedCredentials(token: accessToken, platformNickname: nickname, userId: userId, isLimit: true, targetUuid: (self.uuid ?? ""))
                        )
                    } else {
                        authFailure("Token is nil")
                    }
                default: break
                }

                if let userId = Profile.current?.userID {
                    kvStorage.set(key: "fb_login_id", data: userId)
                }
            }
        }
        return authPromise!
    }

    // MARK: -- Sharing
    var shareDialog: ShareDialog? = nil

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
        shareDialog = ShareDialog(viewController: nil, content: content, delegate: self)
        if (UIApplication.shared.canOpenURL(URL(string: "fbauth2://")!)) {
            shareDialog!.mode = .native
        } else {
            shareDialog!.mode = .automatic
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

extension Facebook {

    class func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        DispatchQueue.main.async {
            FBSDKCoreKit.ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
//            AHSDK.ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
        return true
    }

    class func application(_ app: UIApplication,
                           open url: URL,
                           options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) {
        DispatchQueue.main.async {
            let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
            let annotation = options[UIApplication.OpenURLOptionsKey.annotation]
            FBSDKCoreKit.ApplicationDelegate.shared.application(app, open: url, sourceApplication: sourceApplication, annotation: annotation)
//            AHSDK.ApplicationDelegate.shared.application(app, open: url, sourceApplication: sourceApplication, annotation: annotation)
        }
    }

    class func track(_ eventName: String, _ params: [String: Any]?) {
        DispatchQueue.main.async {
            do {
                var parameters: [FBSDKCoreKit.AppEvents.ParameterName: Any]?
                if let params {
                    params.forEach { key, value in
                        parameters?[FBSDKCoreKit.AppEvents.ParameterName(key)] = value
                    }
                }
//                AHSDK.AppEvents.shared.logEvent(eventName, parameters: params)
                FBSDKCoreKit.AppEvents.shared.logEvent(AppEvents.Name(eventName), parameters: parameters)
            } catch {
                mdebug("[Tracking]: FaceBook - track - Params is error")
            }
        }
    }

    class func trackRevenue(_ price: Double, _ currency: String, _ orderId: String) {
        mdebug("[Facebook]: trackRevenue price=\(price), currency=\(currency), orderId=\(orderId)")

        DispatchQueue.main.async {
            let parameters: [String: Any] = [
                "event_id": orderId,
                "order_id": orderId
            ]
//            AHSDK.AppEvents.shared.logPurchase(purchaseAmount: price, currency: currency, parameters: parameters)
            FBSDKCoreKit.AppEvents.shared.logPurchase(
                    amount: price,
                    currency: currency,
                    parameters: [
                        AppEvents.ParameterName.orderID: orderId,
                        AppEvents.ParameterName(rawValue: "event_id"): orderId,
                        AppEvents.ParameterName(rawValue: "order_id"): orderId
                    ]
            )
        }
    }

    class func trackAdRevenue(_ price: Double, _ currency: String) {
        DispatchQueue.main.async {
            FBSDKCoreKit.AppEvents.shared.logEvent(AppEvents.Name.adImpression,
                    valueToSum: price,
                    parameters: [
                        AppEvents.ParameterName.currency: currency
                    ]
            )
        }
    }

    class func setUserData(_ player: Player) {
        mdebug("FB-setUserData=\(player), country=\(BaseBridge.shared.remoteGameConfig?.country ?? "")")
        DispatchQueue.main.async {
            let playerId = player.playerId

//            AHSDK.AppEvents.shared.setUserData(player.playerId, forUserDataType: .externalId)
            FBSDKCoreKit.AppEvents.shared.userID = playerId

            if let email = player.email {
//                AHSDK.AppEvents.shared.setUserData(email, forUserDataType: .email)
                FBSDKCoreKit.AppEvents.shared.setUserData(email, forType: .email)
            }

            if let country = BaseBridge.shared.remoteGameConfig?.country, country.isNotEmpty {
//                AHSDK.AppEvents.shared.setUserData(country, forUserDataType: .country)
                FBSDKCoreKit.AppEvents.shared.setUserData(country, forType: .country)
            }
        }
    }
}

//
//  Created on 2024/8/2.
//

import Foundation
import GoogleSignIn
import FirebaseAnalytics

class Google: BaseThirdParty {

    func application(
            _ app: UIApplication,
            open url: URL,
            options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        var handled: Bool
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }

        // Handle other custom URL types.
        // If not handled by this app, return false.
        return false
    }

    override func authorize(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        if (GIDSignIn.sharedInstance.currentUser != nil) {
            GIDSignIn.sharedInstance.signOut()
        }
        authPromise = nil
        authPromise = Promise<PlatformCredentials>.init(waitFor: nil)
        self.uuid = uuid

        GIDSignIn.sharedInstance.signIn(withPresenting: appTopViewController) { [self] (result: GIDSignInResult?, error: Error?) in
            guard error == nil else {
                authFailure(error?.localizedDescription ?? "")
                return
            }

            // If sign in succeeded, display the app's main content View.
            var platformNickname: String
            if let email = result?.user.profile?.email, email.count > 5 {
                Analytics.initiateOnDeviceConversionMeasurement(emailAddress: email)
                platformNickname = email
            } else if let nickname = result?.user.profile?.name {
                platformNickname = nickname
            } else {
                platformNickname = ""
            }
            
            if let token = result?.user.idToken?.tokenString {
                authSuccess(AccessTokenVerifiedCredentials(token: token, platformNickname: platformNickname, targetUuid: (self.uuid ?? "")))
            }
        }

        return authPromise!
    }


}

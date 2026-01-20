//
//  Created on 2024/6/18.
//

import Foundation
import AuthenticationServices

@available(iOS 13.0, *)
class Apple: BaseThirdParty, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    override func authorize(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        authPromise = nil
        authPromise = Promise<PlatformCredentials>.init(waitFor: nil)
        self.uuid = uuid

        let appleIDProvider = ASAuthorizationAppleIDProvider.init()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        return authPromise!
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        authFailure(error.localizedDescription)
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {

        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential: do {
            let idToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)!
            var platformNickname: String = ""
            let userIdentifier = appleIDCredential.user

            if let fullName = appleIDCredential.fullName {
                var personName: String = ""
                if let familyName = fullName.familyName {
                    personName = familyName
                }

                if let givenName = fullName.givenName, personName.count > 0 {
                    personName += (" " + givenName)
                }

                if personName.count > 0 {
                    saveUser(userIdentifier, personName)
                }
                platformNickname = personName
            }

            if platformNickname.count == 0 {
                platformNickname = getUser(userIdentifier)
            }

            authSuccess(AppleVerifiedCredentials(idToken: idToken, platformNickname: platformNickname, targetUuid: (uuid ?? "")))
        }
        case _ as ASPasswordCredential:
            break

        default:
            break
        }

    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        let lastWindow = UIApplication.shared.windows.last!
        return lastWindow
    }

    private func saveUser(_ userIdentifier: String, _ personName: String) {
        Keychain.saveData(data: personName, withIdentifier: userIdentifier)
        kvStorage.set(key: userIdentifier, data: personName)
    }
    
    private func getUser(_ userIdentifier: String) -> String {
        guard let userIdentifier = Keychain.readData(identifier: userIdentifier) else {
            return kvStorage.get(key: userIdentifier) 
        }
        return userIdentifier as? String ?? ""
    }

}


//
//  Created on 2024/6/18.
//

import Foundation

class BaseThirdParty: NSObject {
    required public override init() {
    }

    var authPromise: PromiseInterface<PlatformCredentials>?
    var uuid: String?
    
    func authorize(_ uuid: String? = nil) -> PromiseInterface<PlatformCredentials> {
        authPromise = nil
        authPromise = Promise<PlatformCredentials>.init(waitFor: nil)
        self.uuid = uuid

        return authPromise!
    }

    func authSuccess(_ credentials: PlatformCredentials) {
        if let promise = authPromise, promise.state == .pending {
            promise.resolve(result: credentials)
        }
    }

    func authFailure(_ message: String) {
        if let promise = authPromise, promise.state == .pending {
            promise.reject(reason: Throwable(message))
        }
    }

    var sharePromise :  Promise<ShareResult>? = nil

    func shareSuccess(_ result: ShareResult) {
        if let sharePromise = sharePromise, sharePromise.state == .pending {
            sharePromise.resolve(result: result)
        }
    }

    func shareFailure(_ exception: Throwable) {
        if let sharePromise = sharePromise, sharePromise.state == .pending {
            sharePromise.reject(reason: exception)
        }
    }
}

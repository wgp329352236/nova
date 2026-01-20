//
// Created by on 2025/8/6.
//

import Foundation
import GameKit

class GC: BaseThirdParty {

    override func authorize(_ uuid: String?) -> PromiseInterface<PlatformCredentials> {
        let promise = Promise<PlatformCredentials>.init(waitFor: nil)
        let localPlayer = GKLocalPlayer.local
        GKLocalPlayer.local.authenticateHandler = { (viewController, error) in
            guard error == nil else {
                mdebug("[GameCenter]: error=\(error!.localizedDescription)")
                return
            }

            guard viewController == nil else {
                mdebug("[GameCenter]: viewController=\(viewController!)")
                return
            }

            if localPlayer.isAuthenticated {
                mdebug("[GameCenter]: success:\(localPlayer.gamePlayerID),\(localPlayer.displayName),\(localPlayer.alias)")
            } else {
                appTopViewController.present(viewController!, animated: true)
            }

            if promise.state == .pending {
                promise.reject(reason: Throwable("[GameCenter]: authed"))
            }
        }
        return promise
    }
}

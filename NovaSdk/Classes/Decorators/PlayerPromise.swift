//
//  Created on 2024/6/16.
//

import Foundation

open class PlayerPromise: NSObject {

    private var promise: PromiseInterface<Player>

    init(_ p: PromiseInterface<Player>) {
        self.promise = p
    }

    @discardableResult
    @objc public func then(_ run: @escaping (_ player: GamePlayer?) -> Void) -> PlayerPromise {
        func applyWithPlayer(_ player: Player?, _ promise: PromiseInterface<Player>) {
            if let player {
                let gamePlayer = player.reveal
                run(gamePlayer)
            } else {
                promise.reject(reason: Throwable("Player is NUll"))
            }
        }

        promise.then { [self](_, player) in
            applyWithPlayer(player, promise)
        }
        return PlayerPromise(promise)
    }

    @discardableResult
    @objc public func otherwise(_ run: @escaping (Throwable?) -> Void) -> PlayerPromise {
        PlayerPromise(
                promise.otherwise { interface, throwable in
                    run(Throwable(throwable.message))
                }
        )
    }

    @discardableResult
    @objc public func eventually(_ onFinished: @escaping () -> Void) -> PlayerPromise {
        promise.eventually(run: onFinished)
        return PlayerPromise(promise)
    }
}

extension PlayerPromise {
    static func reject(reason: KotlinThrowable) -> PromiseInterface<Player> {
        let promise = Promise<Player>.init(waitFor: nil)
        promise.reject(reason: reason)
        return promise
    }

    static func resolve(result: Player? = nil) -> PromiseInterface<Player> {
        let promise = Promise<Player>.init(waitFor: nil)
        promise.resolve(result: result)
        return promise
    }

}


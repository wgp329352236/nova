//
// Created by on 2025/4/24.
//

import Foundation

open class AdPromise : NSObject {

    private var promise: PromiseInterface<AdResult>

    init(_ p: PromiseInterface<AdResult>) {
        promise = p
    }

    @discardableResult
    @objc public func then(_ run: @escaping (_ result: AdResult?) -> Void) -> AdPromise {
        promise.then { _, result in
            run(result)
        }
        return AdPromise(promise)
    }

    @discardableResult
    @objc public func otherwise(_ run: @escaping (Throwable) -> Void) -> AdPromise {
        AdPromise(
                promise.otherwise { _, throwable in
                    run(Throwable(throwable))
                }
        )
    }

    @discardableResult
    @objc public func eventually(_ onFinished: @escaping () -> Void) -> AdPromise {
        promise.eventually(run: onFinished)
        return self
    }
}


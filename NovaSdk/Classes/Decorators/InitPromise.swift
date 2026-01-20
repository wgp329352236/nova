//
// Created by on 2025/2/11.
//

import Foundation

open class InitPromise: NSObject {

    private var promise: PromiseInterface<KotlinUnit>

    init(_ p: PromiseInterface<KotlinUnit>) {
        promise = p
    }

    @discardableResult
    @objc public func then(_ run: @escaping () -> Void) -> InitPromise {
        promise.then { (rejectAble: Rejectable, unit: KotlinUnit?) in
            guard unit != nil else {
                rejectAble.reject(reason: PromiseFailedReason(PromiseError.incompatibleResultType))
                return ()
            }
            run()
            return ()
        }
        return InitPromise(promise)
    }

    @discardableResult
    @objc public func otherwise(_ run: @escaping (Throwable?) -> Void) -> InitPromise {
        InitPromise(
                promise.otherwise { interface, throwable in
                    run(Throwable(throwable))
                }
        )
    }

    @discardableResult
    @objc public func eventually(_ onFinished: @escaping () -> Void) -> InitPromise {
        promise.eventually(run: onFinished)
        return InitPromise(promise)
    }
}

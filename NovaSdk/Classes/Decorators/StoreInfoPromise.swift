//
// Created by on 2025/5/8.
//

import Foundation


open class StoreInfoPromise: NSObject {

    private var promise: PromiseInterface<StoreInfo>

    init(_ p: PromiseInterface<StoreInfo>) {
        self.promise = p
    }

    @discardableResult
    @objc public func then(_ run: @escaping (_ info: StoreInfo) -> Void) -> StoreInfoPromise {
        promise.then { rejectable, info in
            if let info {
                run(info)
            } else {
                rejectable.reject(reason: Throwable("StoreInfo is NUll"))
            }
        }
        return StoreInfoPromise(promise)
    }

    @discardableResult
    @objc public func otherwise(_ run: @escaping (Throwable) -> Void) -> StoreInfoPromise {
        promise.otherwise { interface, throwable in
            run(Throwable(throwable))
        }
        return StoreInfoPromise(promise)
    }

    @discardableResult
    @objc public func eventually(_ onFinished: @escaping () -> Void) -> StoreInfoPromise {
        promise.eventually(run: onFinished)
        return self
    }
}


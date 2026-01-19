//
//  Created on 2024/6/17.
//

import Foundation

open class PurchasePromise: NSObject {

    private var promise: PromiseInterface<PurchaseResult>

    init(_ p: PromiseInterface<PurchaseResult>) {
        promise = p
    }

    @discardableResult
    @objc public func then(_ run: @escaping (_ result: PurchaseResult?) -> Void) -> PurchasePromise {
        promise.then { _, result in
            run(result)
        }
        return PurchasePromise(promise)
    }

    @discardableResult
    @objc public func otherwise(_ run: @escaping (Throwable) -> Void) -> PurchasePromise {
        PurchasePromise(
                promise.otherwise { _, throwable in
                    run(Throwable(throwable))
                }
        )
    }

    @discardableResult
    @objc public func eventually(_ onFinished: @escaping () -> Void) -> PurchasePromise {
        promise.eventually(run: onFinished)
        return self
    }
}

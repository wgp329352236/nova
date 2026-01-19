//
//  Created on 2024/7/7.
//

import Foundation

open class SharePromise: NSObject {

    private var promise: PromiseInterface<ShareResult>

    init(_ p: PromiseInterface<ShareResult>) {
        promise = p
    }

    @discardableResult
    @objc public func then(_ run: @escaping (_ result: ShareResult?) -> Void) -> SharePromise {
        promise.then { _, result in
            run(result)
        }
        return SharePromise(promise)
    }

    @discardableResult
    @objc public func otherwise(_ run: @escaping (Throwable) -> Void) -> SharePromise {
        SharePromise(
                promise.otherwise { interface, throwable in
                    run(Throwable(throwable))
                }
        )
    }

    @discardableResult
    @objc public func eventually(_ onFinished: @escaping () -> Void) -> SharePromise {
        promise.eventually(run: onFinished)
        return self
    }


}


//
//  Created on 2024/7/3.
//

import Foundation

open class UnitPromise: NSObject {

    private var promise: PromiseInterface<KotlinUnit>

    init(_ p: PromiseInterface<KotlinUnit>) {
        self.promise = p
    }

    @discardableResult
    @objc public func then(_ run: @escaping () -> Void) -> UnitPromise {
        promise.then { _, unit in
            run()
        }
        return UnitPromise(promise)
    }

    @discardableResult
    @objc public func otherwise(_ run: @escaping (Throwable) -> Void) -> UnitPromise {
        UnitPromise(
                promise.otherwise { _, throwable in
                    run(Throwable(throwable))
                }
        )
    }

    @discardableResult
    @objc public func eventually(_ onFinished: @escaping () -> Void) -> UnitPromise {
        promise.eventually(run: onFinished)
        return self
    }

}

extension UnitPromise {

    static func reject(reason: KotlinThrowable) -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>.init(waitFor: nil)
        promise.reject(reason: reason)
        return promise
    }

    static func resolve(result: Any? = nil) -> PromiseInterface<KotlinUnit> {
        let promise = Promise<KotlinUnit>.init(waitFor: nil)
        promise.resolve(result: KotlinUnit())
        return promise
    }

}


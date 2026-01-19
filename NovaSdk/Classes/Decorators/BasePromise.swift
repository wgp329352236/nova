//
//  Created on 2024/6/16.
//

import Foundation

class BasePromise<ResultType>: NSObject where ResultType: AnyObject {

    private var promise: PromiseInterface<ResultType>

    init(_ waitFor: Waitable?) {
        promise = Promise<ResultType>.init(waitFor: waitFor)
        super.init()
    }

    func then(_ run: @escaping (ResultType?) -> Any?) -> PromiseInterface<AnyObject> {
        promise.then { (rejectable: Rejectable, result: ResultType?) in
            run(result)
        }
    }

    func otherwise(_ run: @escaping (KotlinThrowable) -> Void) -> PromiseInterface<ResultType> {
        promise.otherwise { (interface: PromiseInterface<ResultType>, throwable: KotlinThrowable) in
            run(throwable)
        }
    }

    private func valid() {
        if promise.state == .pending {

        }
    }

    func reject(_ reason: KotlinThrowable) {
        if promise.state == .pending {
            promise.reject(reason: reason)
        } else {
            merror("promise is \(promise.state)")
        }
    }

    func resolve(result: ResultType?) {
        if promise.state == .pending {
            promise.resolve(result: result)
        } else {
            merror("promise is \(promise.state)")
        }
    }


    func takeDelegation(other: PromiseInterface<ResultType>) -> PromiseInterface<ResultType> {

        let delegate = Promise<ResultType>.init(waitFor: nil)
        promise.then { (rejectable: Rejectable, result: ResultType?) in
            delegate.resolve(result: result)
        }

        promise.otherwise { (interface: PromiseInterface<ResultType>, throwable: KotlinThrowable) in
            delegate.reject(reason: throwable)
        }

        return delegate

    }

}



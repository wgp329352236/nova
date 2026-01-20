//
//  Created on 2024/6/19.
//

import Foundation

class PaymentPromise<ResultType>: NSObject where ResultType: AnyObject {

    func runSync(_ block: @escaping () -> Void) {
        DispatchQueue.main.sync {
            block()
        }
    }


    var promise: PromiseInterface<ResultType>

    init(_ p: PromiseInterface<ResultType>) {
        promise = p
    }

    private func checkState() throws {
        if promise.state != PromiseState.pending {
            merror("[PaymentPromise]: promise state exception '\(promise.state)'")
            throw PromiseError.statusException
        }
    }

    func resolve(result: ResultType?) {
        do {
            try checkState()
            DispatchQueue.main.sync {
                promise.resolve(result: result)
            }
        } catch {
            merror("[PaymentPromise]: promise state exception. whose state is already \(promise.state)")
        }
    }

    func reject(reason: KotlinThrowable) {
        do {
            try checkState()
            DispatchQueue.main.sync {
                promise.reject(reason: reason)
            }
        } catch {
            merror("[PaymentPromise]: promise state exception. whose state is already \(promise.state)")
        }
    }
}


import Foundation

class StorePromise<ResultType>: NSObject where ResultType: AnyObject {

    func runSync(_ block: @escaping () -> Void) {
        DispatchQueue.main.sync {
            block()
        }
    }

    var raw: PromiseInterface<ResultType> {
        promise
    }

    private let promise: PromiseInterface<ResultType>

    init(waitFor: Waitable?) {
        promise = Promise<ResultType>(waitFor: waitFor)
    }

    func then(run: @escaping (Rejectable, ResultType?) -> Any?) -> PromiseInterface<AnyObject> {
        promise.then(run: run)
    }

    func otherwise(run: @escaping (PromiseInterface<ResultType>, KotlinThrowable) -> Void) -> PromiseInterface<ResultType>{
        promise.otherwise(run: run)
    }

    func resolve(result: ResultType?) {
        do {
            runInMain { [self] in
                if promise.state == .pending {
                    promise.resolve(result: result)
                } else {
                    merror("[PaymentPromise]: promise state exception. whose state is already \(promise.state)")
                    promise.reject(reason: Throwable("promise state exception."))
                }
            }
        } catch {
            merror("[PaymentPromise]: promise state exception. whose state is already \(promise.state)")
        }
    }

    func reject(reason: KotlinThrowable) {
        do {
            runInMain { [self] in
                if promise.state == .pending {
                    promise.reject(reason: reason)
                } else {
                    merror("[PaymentPromise]: promise state exception. whose state is already \(promise.state)")
//                    throw PromiseError.statusException
                }
            }
        } catch {
            merror("[PaymentPromise]: promise state exception. whose state is already \(promise.state)")
        }
    }

    func eventually(run: @escaping () -> Void) -> PromiseInterface<ResultType> {
        promise.eventually(run: run)
    }
}

extension StorePromise {
    static func resolve<ResultType>(result: ResultType?) -> StorePromise<ResultType> {
        let p = StorePromise<ResultType>(waitFor: nil)
        p.resolve(result: result)
        return p
    }
    
    static func reject<ResultType>(reason: KotlinThrowable) -> StorePromise<ResultType> {
        let p = StorePromise<ResultType>(waitFor: nil)
        p.reject(reason: reason)
        return p
    }

}

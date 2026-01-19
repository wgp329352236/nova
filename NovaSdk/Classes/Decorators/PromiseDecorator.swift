//
//  Created on 2024/6/16.
//

import Foundation

enum PromiseError: Error {
    case incompatibleResultType
    case statusException
}

extension PromiseError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .incompatibleResultType:
            return "Incompatible ResultType"
        case .statusException:
            return "status exception"
        }
    }
}

public class PromiseDecorator<ResultType>: NSObject where ResultType: AnyObject {

    private var promise: PromiseInterface<ResultType>

    public init(_ p: PromiseInterface<ResultType>) {
        promise = p
    }

    @discardableResult
    public func then(_ run: @escaping (ResultType?) throws -> AnyObject?) -> PromiseDecorator<AnyObject> {
        PromiseDecorator<AnyObject>(
                promise.then { (rejectable: Rejectable, result: ResultType?) -> Any? in
                    do {
                        let handled = try run(result)
                        return handled
                    } catch (let error) {
                        rejectable.reject(reason: PromiseFailedReason(error))
                    }
                    return nil
                }
        )
    }

    @discardableResult
    public func otherwise(_ run: @escaping (PromiseInterface<ResultType>, KotlinThrowable) throws -> Void) -> PromiseDecorator<ResultType> {
        PromiseDecorator<ResultType>(
                promise.otherwise { (interface: PromiseInterface<ResultType>, throwable: KotlinThrowable) in
                    do {
                        try run(interface, throwable)
                    } catch {
                        interface.reject(reason: PromiseFailedReason(error))
                    }
                }
        )
    }

    @discardableResult
    public func eventually(_ onFinished: @escaping () -> Void) -> PromiseDecorator<ResultType> {
        promise.eventually(run: onFinished)
        return self
    }

    public func resolve(_ result: ResultType) {
        if promise.state == .pending {
            promise.resolve(result: result)
        } else {
            merror("Promise is \(promise.state)")
        }
    }

    public func reject(_ reason: KotlinThrowable) {
        if promise.state == .pending {
            promise.reject(reason: reason)
        } else {
            merror("Promise is \(promise.state)")
        }
    }

    open func takeDelegation(other: PromiseInterface<ResultType>) {
        promise.takeDelegation(other: other)
    }

}

public class PromiseFailedReason: KotlinThrowable {
    public var error: Error

    public init(_ error: Error) {
        self.error = error
        super.init(message: error.localizedDescription)
    }

}

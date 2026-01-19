//
//  Created on 2024/6/17.
//

import Foundation

open class PackageSetPromise: NSObject {

//    private var promise: PromiseInterface
//
//    init(_ p: PromiseInterface) {
//        self.promise = p
//    }
//
//    init(_ decorator: PromiseDecorator<PackageSet>) {
//        let promise = Promise.init(waitFor: nil)
//        decorator.then { (player) in
//                    promise.resolve(result: player)
//                }.otherwise { (promise, throwable) in
//                    promise.reject(reason: throwable)
//                }
//        self.promise = promise
//    }
//
//    @discardableResult
//    @objc public func then(_ run: @escaping (_ products: PackageSet) -> Void) -> PackageSetPromise {
//        return PackageSetPromise(
//                promise.then(run: { (rejectable, result) -> Any? in
//                    if let packageSet = result as? PackageSet {
//                        run(packageSet)
//                        return packageSet
//                    } else {
//                        rejectable.reject(reason: PromiseFailedReason(PromiseError.incompatibleResultType))
//                        return nil
//                    }
//                })
//        )
//    }
//
//    @discardableResult
//    @objc public func otherwise(_ run: @escaping (Throwable) -> Void) -> PackageSetPromise {
//        return PackageSetPromise(
//                promise.otherwise(run: {
//                    (_, reason) -> Void in
//                    run(Throwable(reason))
//                })
//        )
//    }
//
//    @discardableResult
//    @objc public func eventually(_ onFinished: @escaping () -> Void) -> PackageSetPromise {
//        promise.eventually(run: onFinished)
//        return self
//    }
}


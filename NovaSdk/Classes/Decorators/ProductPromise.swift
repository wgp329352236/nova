//
//  Created on 2024/6/16.
//

import Foundation
import StoreKit

open class ProductPromise: NSObject {

    private var promise: PromiseInterface<NSArray>

    init(_ p: PromiseInterface<NSArray>) {
        self.promise = p
    }

    @discardableResult
    @objc public func then(_ run: @escaping (_ products: [ProductInfo]) -> Void) -> ProductPromise {
        promise.then { rejectable, array in
            guard let result = array else {
                rejectable.reject(reason: PromiseFailedReason(PromiseError.incompatibleResultType))
                return ()
            }
            var products: [ProductInfo] = []
            result.forEach { element in
                if let skProduct = element as? SKProduct {
                    let product = ProductInfo(productId: skProduct.productIdentifier)
                    if let currencyCode = skProduct.priceLocale.currencyCode {
                        product.price = "\(currencyCode) \(skProduct.price)"
                    }
                    product.title = skProduct.localizedTitle
                    product.description_ = skProduct.localizedDescription
                    products.append(product)
                } else if let sk2Product = element as? Product {
                    let product = ProductInfo(productId: sk2Product.id)
                    product.price = sk2Product.displayPrice
                    product.title = sk2Product.displayName
                    product.description_ = sk2Product.description
                    products.append(product)
                } else {

                }
            }
            run(products)
            return products
        }
        return ProductPromise(promise)
    }

    @discardableResult
    @objc public func otherwise(_ run: @escaping (Throwable) -> Void) -> ProductPromise {
        ProductPromise(
                promise.otherwise { interface, throwable in
                    run(Throwable(throwable))
                }
        )
    }

    @discardableResult
    @objc public func eventually(_ onFinished: @escaping () -> Void) -> ProductPromise {
        promise.eventually(run: onFinished)
        return self
    }
}


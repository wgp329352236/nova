//
//  Created on 2024/6/25.
//

import Foundation
import StoreKit


class ProductsResponse {
    var response: SKProductsResponse
    var products: [SKProduct] {
        get {
            response.products
        }
    }

    init(_ response: SKProductsResponse) {
        self.response = response
    }
}

class ProductsRequest: NSObject, SKProductsRequestDelegate {

    private var productIds: Set<String>?
    private var request: SKProductsRequest?
    private var requestPromise: PromiseInterface<ProductsResponse>?

    deinit {
        request?.delegate = nil
        requestPromise = nil
    }

    func fetch(_ productIds: Set<String>) -> PromiseInterface<ProductsResponse> {
        self.productIds = productIds
        requestPromise = Promise<ProductsResponse>(waitFor: nil)
        request = SKProductsRequest(productIdentifiers: productIds)
        request?.delegate = self
        request?.start()
        return requestPromise!
    }

    // MARK: - SKProductsRequestDelegate
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        runInMain { [self] in
            requestPromise?.resolve(result: ProductsResponse(response))

//            if response.products.first(where: { $0.productIdentifier == productIds!.first }) != nil {
//                requestPromise?.resolve(result: response.products.toKotlin())
//            } else {
//                requestPromise?.reject(reason: Throwable("Get invalid product"))
//            }
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        mdebug("[payment] request products didFail = \(error.localizedDescription)")
        //illegal attempt to access non-shared <object>@81d5c398 from other thread
        runInMain { [self] in
            requestPromise?.reject(reason: Throwable(error.localizedDescription))
        }
    }

    func requestDidFinish(_ request: SKRequest) {
        mdebug("[payment] requestDidFinish ")
    }
}

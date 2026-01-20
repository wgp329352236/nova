//
// Created by WGP on 2025/11/13.
//

import Foundation

open class BaseAd: NSObject {

    public var unitId: String
    public var handle: AdHandle

    open var isRunning: Bool = false
    open var isLoading: Bool = false
    open var isLoaded: Bool = false
    open var isReady: Bool = false
    open var isShowing: Bool = false

    open var eventInfo: AdEventInfo? = nil
    open var loadTime: Double = 0
    open var params: AdParams? = nil

    open var promise: Promise<AdResult>? = nil
    open var loadedData: LoadedData? = nil

    public init(_ unitId: String, _ handle: AdHandle) {
        self.unitId = unitId
        self.handle = handle
        super.init()
    }

    @objc
    open func reset() {
        isRunning = false
        eventInfo = nil
        params = nil
    }

    @objc
    open func reload(_ shouldReset: Bool = false) {
        loadedData = nil
        if shouldReset {
            reset()
        }
        load(unitId)
    }

    @discardableResult
    open func load(_ unitId: String, _ maxRetries: Int = 3) -> PromiseInterface<KotlinBoolean> {
        let promise = Promise<KotlinBoolean>.init(waitFor: nil)
        promise.reject(reason: Throwable("Ad is base"))
        return promise
    }

    @objc
    open func show(_ params: AdParams, _ customerData: String) -> PromiseInterface<AdResult> {
        if isRunning == true {
            reject(AdErrorType.adshowing.name, "Ad is already showing")
            if let promise = promise {
                return promise
            }
        }
        self.params = params

        promise = nil
        promise = Promise<AdResult>.init(waitFor: nil)

        return promise!
    }

    public func reject(_ errorType: String, _ message: String) {
        if let promise = promise, promise.state == PromiseState.pending {
            handle.onGameRequestResult(eventInfo, errorType, message)
            promise.reject(reason: AdErrorReason(errorType: errorType, message: message))
        }
    }

    public func resolve(_ result: AdResult) {
        if let promise = promise, promise.state == PromiseState.pending {
            promise.resolve(result: result)
        }
    }


}

//
//  Created on 2024/7/5.
//

import Foundation

enum TrackingConsumer {
    case adjust, td, firebase, facebook, tiktok
}

class BaseTracking: NSObject {

    var isInitialized = false

    private(set) var trackingName = "UNKNOWN"

    func initialize() {

    }

    func trackEvent(_ eventName: String, _ params: [String: Any]? = nil) {

    }

    func runAfterInitialized(_ block: @escaping () -> ()) {
        if isInitialized {
            runInMain {
                block()
            }
        } else {
            merror("\(trackingName) don't initialize")
        }
    }

}

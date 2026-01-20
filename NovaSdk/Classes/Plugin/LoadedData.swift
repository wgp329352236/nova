//
// Created by WGP on 2025/12/12.
//

import Foundation

open class LoadedData: NSObject {

    open var readAd: Any?
    open var eventInfo: AdEventInfo?

    open var isReady: Bool {
        readAd != nil
    }

    deinit {
        readAd = nil
        eventInfo = nil
    }

    public init(_ eventInfo: AdEventInfo? = nil) {
        self.eventInfo = eventInfo
    }

}

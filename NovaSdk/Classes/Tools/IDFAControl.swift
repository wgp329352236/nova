//
//  Created on 2024/6/19.
//

import Foundation
import AppTrackingTransparency
import AdSupport
import FBSDKCoreKit

class IDFAControl: NSObject {

    public static let shared: IDFAControl = {
        let instance = IDFAControl()
        return instance
    }()

    @objc func requestTracking() {
        if #available(iOS 14, *) {
            if (ATTrackingManager.trackingAuthorizationStatus == .notDetermined) {
                BaseBridge.shared.logEvent(TrackingEventName.shared.IDFA_AUTHORIZATION, ["type": "start"])
                ATTrackingManager.requestTrackingAuthorization { status in
                    if #available(iOS 17, *) {
                        Settings.shared.isAdvertiserTrackingEnabled = true
                    } else {
                        Settings.shared.isAdvertiserTrackingEnabled = (status == .authorized)
                    }
                    
                    BaseBridge.shared.logEvent(TrackingEventName.shared.IDFA_AUTHORIZATION, ["type": "end", "status" : "\(status.rawValue)", "status_name" : "\(status.rawValue)"])
                }
            }
        }
    }

//    var promise: Promise<AnyObject>?

//    lazy var config: IDFAConfig = GameKitBridge.shared.remoteGameConfig.idfaConfig
//    var presented: Bool = false
//
//    var enable: Bool {
//        get {
//            return GameKitBridge.shared.remoteGameConfig.idfaAllowed
//        }
//    }

//    func requestIDFA() {
//        if (promise == nil) {
//            promise = Promise(waitFor: nil)
//        }
//
//        if #available(iOS 14, *) {
//            if (ATTrackingManager.trackingAuthorizationStatus == .authorized) || (ATTrackingManager.trackingAuthorizationStatus == .denied) {
//                resolvePromise()
//                return
//            }
//        } else {
//            resolvePromise()
//        }
//    }

//    @objc func requestTracking() {
//        func logEvent(_ status: String) {
//            DispatchQueue.main.async {
//                Common.main.setAdvertiserTrackingEnabled()
//             }
//        }
//
//        if #available(iOS 14, *) {
//            ATTrackingManager.requestTrackingAuthorization { status in
//                switch (status) {
//                case .notDetermined, .restricted: break;
//                case .denied: logEvent("denied"); break;
//                case .authorized: logEvent("allowed"); break;
//                default: break;
//                }
//            }
//        } else {
//            // Fallback on earlier versions
//            resolvePromise()
//        }
//    }
}


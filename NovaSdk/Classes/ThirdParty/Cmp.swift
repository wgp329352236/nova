//
//  Created on 2024/7/5.
//

import Foundation

import CmpSdk

// Cmp 2.5.3
class Cmp {

    var cmpManager: CMPConsentTool? = nil

    var cmpConfig: CmpConfig? {
        if let appId = LocalConfig.shared.cmpId,
           let domain = LocalConfig.shared.cmpDomain {
            let appName = SystemTools.appName()
            let language = BaseBridge.shared.currentLanguage.lang.uppercased()
            let cmpConfig = CmpConfig.shared.setup(
                    withId: appId,
                    domain: domain,
                    appName: appName,
                    language: language)
            // You can also determine log levels or ask for Apple's App Tracking Transparency, for example
            if BaseBridge.shared.isDebug {
                cmpConfig.logLevel = CmpLogLevel.debug
            } else {
                cmpConfig.logLevel = CmpLogLevel.info
            }
            cmpConfig.isAutomaticATTRequest = true
            return cmpConfig
        }
        return nil
    }

    func initialize() {

    }

    private func onCmpButtonClicked(_ event: CmpButtonEvent) {
        mdebug("[MDA]: Cmp: OnCmpButtonClicked event: \(event.rawValue)")
        var selectType = "Unknown"
        switch (event) {
        case .acceptAll:
            selectType = "AcceptAll"
        case .rejectAll:
            selectType = "RejectAll"
        case .save:
            selectType = "Save"
        case .close:
            selectType = "Close"
        default:
            selectType = "Unknown"
        }
        BaseBridge.shared.logEvent(
                TrackingEventName.shared.DMA_AUTHORIZATION,
                ["type": "end", "select_type": selectType]
        )

        var adStorage = false
        var analyticsStorage = false
        var adUserData = false
        var adPersonalization = false

        if let cmpManager {
            if (cmpManager.hasVendorConsent("s26") &&
                    cmpManager.hasPurposeConsent("c54")
               ) {
                analyticsStorage = true
                adStorage = true
            }

            if (cmpManager.hasVendorConsent("s1") &&
                    cmpManager.hasVendorConsent("s26") &&
                    cmpManager.hasPurposeConsent("c52")
               ) {
                // Add your logic here
                adStorage = true
                analyticsStorage = true
                adUserData = true
                adPersonalization = true
            }
            TrackingManager.manager.setConsent(adStorage, analyticsStorage, adUserData, adPersonalization)
        }
    }

    func showView() -> PromiseInterface<KotlinInt> {
        mdebug("[MDA]: Cmp: showView")
        let promise = Promise<KotlinInt>.init(waitFor: nil)
        if let cmpConfig {
            cmpManager = CMPConsentTool(cmpConfig: cmpConfig)
                    .withOpenListener {
                        mdebug("[MDA]: Cmp: - Open")
                        BaseBridge.shared.logEvent(
                                TrackingEventName.shared.DMA_AUTHORIZATION,
                                ["type": "start"]
                        )
                    }
                    .withOnCMPNotOpenedListener {
                        mdebug("[MDA]: Cmp: - OnCMPNotOpened")
                        if promise.state == PromiseState.pending {
                            promise.reject(reason: Throwable("CMP NotOpened"))
                        }
                    }
                    .withCloseListener {
                        mdebug("[MDA]: Cmp: - close")
                        if promise.state == PromiseState.pending {
                            promise.resolve(result: KotlinInt(1))
                        }
                    }
                    .withErrorListener { (errorType: CmpErrorType, message: String?) in
                        mdebug("[MDA]: Cmp: - error Type = \(errorType), message = \(message ?? "") ")
                        BaseBridge.shared.logEvent(
                                TrackingEventName.shared.DMA_AUTHORIZATION,
                                ["type": "error", "message": message ?? ""]
                        )
                        if promise.state == PromiseState.pending {
                            promise.reject(reason: Throwable("CMP Error"))
                        }
                    }
                    .withCmpViewControllerConfigurationBlock { viewController in
                        mdebug("[MDA]: Cmp: CmpViewController Configuration")
                        if let viewController {
                            viewController.modalPresentationStyle = .fullScreen
                            viewController.providesPresentationContextTransitionStyle = true
                            viewController.definesPresentationContext = true
                        }
                    }
                    .withOnCmpButtonClickedCallback { [self] event in
                        onCmpButtonClicked(event)
                    }
                    .initialize()
        } else {
            if promise.state == PromiseState.pending {
                promise.reject(reason: Throwable("CMP is nil"))
            }
        }
        return promise
    }

}

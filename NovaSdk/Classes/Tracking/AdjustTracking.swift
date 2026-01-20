//
//  Created on 2024/7/5.
//

import Foundation
import AdjustSdk

typealias AttributionBlock = ([String: Any]) -> Void
// adjust 5.4.4
class AdjustTracking: BaseTracking, AdjustDelegate {

    var attributionBlock: AttributionBlock?

    private func callBack(_ attribution: ADJAttribution?) {
        if let attribution, let attributionBlock {
            let dict: [String: Any] = [
                "sdk_ad_tracker_name": (attribution.trackerName ?? ""),
                "sdk_ad_network": (attribution.network ?? ""),
                "sdk_ad_campaign": (attribution.campaign ?? ""),
                "sdk_ad_adgroup": (attribution.adgroup ?? ""),
                "sdk_ad_creative": (attribution.creative ?? ""),
                "sdk_ad_click_label": (attribution.clickLabel ?? ""),
                "sdk_ad_cost_type": (attribution.costType ?? ""),
                "sdk_ad_cost_amount": (attribution.costAmount ?? 0),
                "sdk_ad_cost_currency": (attribution.costCurrency ?? "")
            ];

            mdebug("attribution = \(dict)")
            attributionBlock(dict)
        }
    }

    func adjustAttributionChanged(_ attribution: ADJAttribution?) {
        callBack(attribution)
    }

    override var trackingName: String {
        "Adjust"
    }

    override func initialize() {
        if let appToken = LocalConfig.shared.adjustAppToken {
            var environment = ADJEnvironmentProduction
            if BaseBridge.shared.isDebug {
                environment = ADJEnvironmentSandbox
            }

            if let adjConfig = ADJConfig(
                    appToken: appToken,
                    environment: environment) {
                adjConfig.delegate = self
                if BaseBridge.shared.isDebug {
                    adjConfig.logLevel = ADJLogLevel.verbose
                } else {
                    adjConfig.logLevel = .info
                }
                adjConfig.enableCostDataInAttribution()
                adjConfig.enableSendingInBackground()
                adjConfig.enableDeviceIdsReadingOnce()
                adjConfig.eventDeduplicationIdsMaxSize = 20  // limit deduplication order id max size
                adjConfig.defaultTracker = LocalConfig.shared.adjustDefaultTracker

                //
                if let waitingString = LocalConfig.shared.adjustWaitingInterval?.trimmingCharacters(in: .whitespacesAndNewlines),
                   let waitingInterval = UInt(waitingString) {
                    adjConfig.attConsentWaitingInterval = min(max(0, waitingInterval), 120)
                }

                Adjust.initSdk(adjConfig)
                isInitialized = true

                Adjust.idfa { result in
                    if let idfa = result {
                        kvStorage.set(key: PackageSettingsKey.Adjust.shared.IDFA, data: idfa)
                    }
                }

                Adjust.idfv { result in
                    if let idfv = result {
                        kvStorage.set(key: PackageSettingsKey.Adjust.shared.IDFV, data: idfv)
                    }
                }

                Adjust.adid { result in
                    if let idfa = result, idfa.isNotEmpty {
                        kvStorage.set(key: PackageSettingsKey.Adjust.shared.ADID, data: idfa)
                        Adjust.addGlobalCallbackParameter(idfa, forKey: "external_id")
                    }
                }

                Adjust.attribution { [self] attribution in
                    callBack(attribution)
                }
            }
        }
    }

    func addGlobalCallbackParameter(_ param: String, forKey key: String) {
        Adjust.addGlobalCallbackParameter(param, forKey: key)
    }

    func attribution(_ block: @escaping ([AnyHashable: Any]) -> Void) {
        Adjust.attribution { adjAttribution in
            if let attribution = adjAttribution?.dictionary() {
                block(attribution)
            }
        }
    }

    func setAPNSToken(_ apnsToken: Data, _ block: ((String?, Error?) -> Void)? = nil) {
        Adjust.setPushToken(apnsToken)
    }

    override func trackEvent(_ eventToken: String, _ params: [String: Any]?) {
        runAfterInitialized {
            guard let event = ADJEvent(eventToken: eventToken) else {
                return
            }
            do {
                if let params {
                    params.forEach { key, value in
                        event.addPartnerParameter(key, value: "\(value)")
                    }
                }
                Adjust.trackEvent(event)
            } catch {
                mdebug("[Tracking]: Adjust - track - Params is error")
            }
        }
    }

    func trackRevenue(_ eventToken: String, _ price: Double, _ currency: String, _ orderId: String) {
        guard let event = ADJEvent(eventToken: eventToken) else {
            return
        }
        mdebug("[Adjust]: trackRevenue price=\(price), currency=\(currency), orderId=\(orderId)")
        event.setRevenue(price, currency: currency)
        event.setTransactionId(orderId)
        event.setDeduplicationId(orderId)
        event.addCallbackParameter("purchaseId", value: orderId)
        Adjust.trackEvent(event)
    }

    func trackAdRevenue(_ mediationName: String, _ source: String, _ placement: String, _ adUnitId: String, _ revenue: Double, _ currency: String, _ customerDataStr: String) {
        mdebug("[Adjust]: trackAdRevenue mediationName=\(mediationName), price=\(revenue), currency=\(currency), network_name=\(source), networt_placement=\(placement), customerDataStr=\(customerDataStr)")
        if let adRevenue = ADJAdRevenue(source: mediationName) {
            adRevenue.setRevenue(revenue, currency: currency)
            adRevenue.setAdRevenueUnit(adUnitId)
            adRevenue.setAdRevenueNetwork(source)
            adRevenue.setAdRevenuePlacement(placement)
            adRevenue.addCallbackParameter("customerDataStr", value: customerDataStr)
            Adjust.trackAdRevenue(adRevenue)
        }
    }

    func trackThirdPartySharing(_ adPersonalization: Bool, _ adUserData: Bool) {
        guard let thirdPartySharing = ADJThirdPartySharing(isEnabled: 1) else {
            return
        }

        func value(from data: Bool?) -> String {
            if let data, data == true {
                return "1"
            } else {
                return "0"
            }
        }

        let eea = value(from: BaseBridge.shared.remoteGameConfig?.isInEU)
        let personalization = value(from: adPersonalization)
        let userData = value(from: adUserData)

        thirdPartySharing.addGranularOption("google_dma", key: "eea", value: eea)
        thirdPartySharing.addGranularOption("google_dma", key: "ad_personalization", value: personalization)
        thirdPartySharing.addGranularOption("google_dma", key: "ad_user_data", value: userData)
        Adjust.trackThirdPartySharing(thirdPartySharing)

    }
}

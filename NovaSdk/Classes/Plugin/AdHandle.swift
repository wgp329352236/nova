//
// Created by WGP on 2025/11/13.
//

import Foundation
import FirebaseCore
import FirebaseAnalytics


public class AdHandle: NSObject {

    public let currentRoleId = BaseBridge.shared.currentGameRole?.roleId ?? ""
    public let clientInfo = BaseBridge.shared.clientInfo

    public func showSafari(_ link: String) -> PromiseInterface<KotlinUnit> {
        BaseBridge.shared.showSafari(link)
    }

}

// MARK: - AdEvent
public extension AdHandle {

    public func fetchAllAdUnitIds(_ adType: AdType, _ adMediation: AdMediation) -> [String] {
        BaseBridge.shared.fetchAllAdUnitIds(adType, adMediation)
    }

    public func onAdLoaded(_ eventInfo: AdEventInfo?, _ retryAttempt: Int, _ loadingTime: Double) {
        BaseBridge.shared.onAdLoaded(eventInfo, retryAttempt, loadingTime)
    }

    public func onAdFailedToLoad(
            _ eventInfo: AdEventInfo?,
            _ errorCode: Int,
            _ errorMessage: String,
            _ retryAttempt: Int,
            _ otherInfo: [String: Any]? = nil) {
        BaseBridge.shared.onAdFailedToLoad(eventInfo, errorCode, errorMessage, retryAttempt, otherInfo)
    }


    public func onAdClicked(_ eventInfo: AdEventInfo?) {
        BaseBridge.shared.onAdClicked(eventInfo)
    }

    public func onAdDisplayed(_ eventInfo: AdEventInfo?) {
        BaseBridge.shared.onAdDisplayed(eventInfo)
    }

    public func onAdDisplayFailed(
            _ eventInfo: AdEventInfo?,
            _ errorCode: Int,
            _ errorMessage: String,
            _ otherInfo: [String: Any]? = nil) {
        BaseBridge.shared.onAdDisplayFailed(eventInfo, errorCode, errorMessage, otherInfo)
    }

    public func onAdViewClose(
            _ eventInfo: AdEventInfo?,
            _ otherInfo: [String: Any]? = nil) {
        BaseBridge.shared.onAdViewClose(eventInfo, otherInfo)
    }

    public func onAdRewarded(
            _ eventInfo: AdEventInfo?,
            _ amount: Int,
            _ rewardType: String,
            _ otherInfo: [String: Any]
    ) {
        BaseBridge.shared.onAdRewarded(eventInfo, amount, rewardType, otherInfo)
    }

    public func onAdRevenuePaid(
            _ eventInfo: AdEventInfo?,
            _ revenue: Double,
            _ currency: String,
            _ otherInfo: [String: Any],
            _ firebaseParameter: [String: Any]
    ) {
        let eventParameters: [String: Any] = [
            TrackingEventParameter.shared.AD_REVENUE: otherInfo["AD_REVENUE"] ?? "",
            TrackingEventParameter.shared.AD_REVENUE_CURRENCY: otherInfo["AD_REVENUE_CURRENCY"] ?? "",
            TrackingEventParameter.shared.AD_PRECISION_TYPE: otherInfo["AD_PRECISION_TYPE"] ?? ""
        ]

        let firebaseParameters: [String: Any] = [
            AnalyticsParameterAdPlatform: firebaseParameter["adPlatform"] ?? "No ad_platform",
            AnalyticsParameterAdSource: firebaseParameter["adSource"] ?? "No ad_source",
            AnalyticsParameterAdFormat: firebaseParameter["adFormat"] ?? "No ad_format",
            AnalyticsParameterAdUnitName: firebaseParameter["adUnitName"] ?? "No ad_unit_name",
            AnalyticsParameterCurrency: firebaseParameter["currency"] ?? "No currency",
            AnalyticsParameterValue: firebaseParameter["value"] ?? 0.0
        ]

        BaseBridge.shared.onAdRevenuePaid(eventInfo, revenue, currency, eventParameters, firebaseParameter)
    }

    public func onGameRequestResult(
            _ eventInfo: AdEventInfo?,
            _ errorCode: String,
            _ errorMessage: String
    ) {
        BaseBridge.shared.onGameRequestResult(eventInfo, errorCode, errorMessage)
    }

}

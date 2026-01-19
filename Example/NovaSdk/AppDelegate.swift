//
//  AppDelegate.swift
//  NovaSdkDemo
//
//   Created on 2024/6/15.
//

import UIKit

import NovaSdk
import NovaCore

import AdjustSdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // Override point for customization after application launch.
        NovaAppDelegate.application(application, didFinishLaunchingWithOptions: launchOptions)
        NovaKit.shared.initialize(isDebug: true, language: Language.chineseSimplified).then {
            mdebug("[NovaKit]: Init Success")
        }.otherwise { throwable in
            mdebug("[NovaKit]: Init Fail: \(throwable?.message ?? "")")
        }
        return true
    }

    // Deep linking
    func application(
            _ app: UIApplication,
            open url: URL,
            options: [UIApplication.OpenURLOptionsKey: Any]
    ) -> Bool {
        NovaAppDelegate.application(app, open: url, options: options)

        if let scheme = url.scheme, scheme.isEmpty == false {
            // 处理URL
            let alert = UIAlertController(title: "Deep Link", message: "Deep Link: \(url)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
           return true
        }
        return true
    }

    func application(
            _ application: UIApplication,
            didFailToRegisterForRemoteNotificationsWithError error: any Error
    ) {
        print("Device Token error: \(error.localizedDescription)")
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        NovaAppDelegate.applicationDidBecomeActive(application)
        NovaKit.shared.showAppOpenAd(adUnitName: "appopen", placement: "placement-5566")
            .then { result in
                print("[DidBecomeActive]: - showAppOpenAd - result:\(result!)")
            }
            .otherwise { throwable in
                print("[DidBecomeActive]: - showAppOpenAd - throwable:\(throwable.message ?? "")")
            }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        NovaAppDelegate.applicationDidEnterBackground(application)
    }

    func application(
            _ application: UIApplication,
            didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        let tokenString = deviceToken.map {
                    String(format: "%02.2hhx", $0)
                }
                .joined()
        print("Device Token: \(tokenString)")
        NovaAppDelegate.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    private func application(
            _ application: UIApplication,
            performedFetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {

    }


    // Universal Links
    func application(
            _ application: UIApplication,
            continue userActivity: NSUserActivity,
            restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
    ) -> Bool {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            if let incomingURL = userActivity.webpageURL {
                // call the below method to resolve deep link
                ADJLinkResolution.resolveLink(
                        with: incomingURL,
                        resolveUrlSuffixArray: ["email.example.com", "short.example.com"],
                        callback: { [weak self] resolvedURL in
                            // add your code below to handle deep link
                            // (for example, open deep link content)
                            // resolvedURL object contains the deep link
                            if let resolvedDeeplink = resolvedURL {
                                
                                NSLog("scene continue restoration deeplink = \(resolvedDeeplink)")

                                // call the below method to send deep link to Adjust's servers
                                if let deeplink = ADJDeeplink(deeplink: resolvedDeeplink) {
                                    Adjust.processDeeplink(deeplink)
                                }
                            }
                        })
            }
        } else {
            return false
        }

        return true
    }

    //MARK: - deep-links
    func scene(
            _ scene: UIScene,
            willConnectTo session: UISceneSession,
            options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let userActivity = connectionOptions.userActivities.first,
              userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let incomingURL = userActivity.webpageURL
        else {
            return
        }

        // call the below method to resolve deep link
        ADJLinkResolution.resolveLink(
                with: incomingURL,
                resolveUrlSuffixArray: ["novasonic.go.link"],
                callback: { [weak self] resolvedURL in
                    // add your code below to handle deep link
                    // (for example, open deep link content)
                    // resolvedURL object contains the deep link

                    if let resolvedDeeplink = resolvedURL {
                        NSLog("scene willConnectTo deeplink = \(resolvedDeeplink)")

                        // call the below method to send deep link to Adjust's servers
                        if let deeplink = ADJDeeplink(deeplink: resolvedDeeplink) {
                            Adjust.processDeeplink(deeplink)
                        }
                    }
                })
    }

    func scene(
            _ scene: UIScene,
            continue userActivity: NSUserActivity
    ) {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            if let incomingURL = userActivity.webpageURL {
                // call the below method to resolve deep link
                ADJLinkResolution.resolveLink(
                        with: incomingURL,
                        resolveUrlSuffixArray: ["novasonic.go.link"],
                        callback: { [weak self] resolvedURL in
                            if let resolvedDeeplink = resolvedURL {
                                
                                NSLog("scene continue deeplink = \(resolvedDeeplink)")
                                
                                // call the below method to send deep link to Adjust's servers
                                if let deeplink = ADJDeeplink(deeplink: resolvedDeeplink) {
                                    Adjust.processDeeplink(deeplink)
                                }
                            }
                        }
                )
            }
        }
    }

    //MARK: - universal-links
    func scene(
            _ scene: UIScene,
            openURLContexts URLContexts: Set<UIOpenURLContext>
    ) {
        guard let incomingURL = URLContexts.first?.url else {
            return
        }

        // call the below method to send deep link to Adjust's servers
        if let deeplink = ADJDeeplink(deeplink: incomingURL) {
            
            NSLog("scene openURLContexts deeplink = \(deeplink)")

            
            Adjust.processDeeplink(deeplink)
        }
    }
}


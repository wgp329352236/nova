//
//  Created on 2024/6/16.
//

import Foundation

public class NovaAppDelegate: NSObject {

    @discardableResult
    @objc public static func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        func getNotificationSettings() {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                guard settings.authorizationStatus == .authorized else {
                    return
                }
                runInMain {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }

        func requestNotificationAuthorization() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                guard granted else {
                    return
                }
                getNotificationSettings()
            }
        }

        runInMain {
            requestNotificationAuthorization()
        }

        return ThirdPartyFactory.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }


    @discardableResult
    @objc public static func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        ThirdPartyFactory.shared.application(app, open: url, options: options)
    }

    @objc
    public static func applicationDidBecomeActive(_ application: UIApplication) {
    }

    @objc
    public static func applicationDidEnterBackground(_ application: UIApplication) {
    }

    @objc
    public static func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        TrackingManager.manager.setAPNSToken(deviceToken)
    }
}

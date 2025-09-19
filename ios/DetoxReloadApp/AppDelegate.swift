import UIKit
import React
import React_RCTAppDelegate
import ReactAppDependencyProvider

// CUSTOM CHANGE from react-native-bootsplash@6
import RNBootSplash

// CUSTOM CHANGE from react-native-fbsdk-next@13
import UIKit
import FBSDKCoreKit

// CUSTOM CHANGE react-native-maps
import GoogleMaps

// CUSTOM CHANGE react-native-notifications
import RNNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  var reactNativeDelegate: ReactNativeDelegate?
  var reactNativeFactory: RCTReactNativeFactory?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {

    // CUSTOM CHANGE react-native-maps
    GMSServices.provideAPIKey("XXX")

    let delegate = ReactNativeDelegate()
    let factory = RCTReactNativeFactory(delegate: delegate)
    delegate.dependencyProvider = RCTAppDependencyProvider()

    reactNativeDelegate = delegate
    reactNativeFactory = factory

    window = UIWindow(frame: UIScreen.main.bounds)

    let moduleName = "DetoxReloadApp"

    factory.startReactNative(
      withModuleName: moduleName,
      in: window,
      launchOptions: launchOptions
    )

    // CUSTOM CHANGE from react-native-fbsdk-next@13
    ApplicationDelegate.shared.application(
        application,
        didFinishLaunchingWithOptions: launchOptions
    )

    // CUSTOM CHANGE react-native-notifications
    RNNotifications.startMonitorNotifications()

    return true
  }

  // CUSTOM CHANGE from react-native-fbsdk-next@13
  func application(
      _ app: UIApplication,
      open url: URL,
      options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {
      ApplicationDelegate.shared.application(
          app,
          open: url,
          sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
          annotation: options[UIApplication.OpenURLOptionsKey.annotation]
      )

      // CUSTOM CHANGE react-native-navigations
      // Deep links (schema://)
      return RCTLinkingManager.application(app, open: url, options: options)
  }


  // CUSTOM CHANGE react-native-navigations
  // Universal links (https://url)
  func application(
    _ application: UIApplication,
    continue userActivity: NSUserActivity,
    restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
      return RCTLinkingManager.application(
        application,
        continue: userActivity,
        restorationHandler: restorationHandler
      )
    }

  // CUSTOM CHANGE react-native-notifications
  func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken withDeviceToken: Data) {
      RNNotifications.didRegisterForRemoteNotifications(withDeviceToken: withDeviceToken)
   }

  func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
      RNNotifications.didFailToRegisterForRemoteNotificationsWithError(error)
  }

  func application(
    _ application: UIApplication,
    didReceiveRemoteNotification userInfo: [AnyHashable: Any],
    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      RNNotifications.didReceiveBackgroundNotification(userInfo, withCompletionHandler: completionHandler)
  }

}

class ReactNativeDelegate: RCTDefaultReactNativeFactoryDelegate {
  override func sourceURL(for bridge: RCTBridge) -> URL? {
    self.bundleURL()
  }

  // CUSTOM CHANGE from react-native-bootsplash@6
  override func customize(_ rootView: RCTRootView) {
    super.customize(rootView)
    RNBootSplash.initWithStoryboard(Bundle.main.object(forInfoDictionaryKey: "UILaunchStoryboardName") as? String ?? "BootSplash", rootView: rootView) // ⬅️ initialize the splash screen
  }

  override func bundleURL() -> URL? {
#if DEBUG
    RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
#else
    Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
  }

}

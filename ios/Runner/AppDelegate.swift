import UIKit
import Flutter
import GoogleMaps
import FirebaseCore
import Firebase
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyAcvWQdfMH2eKHvaTvM3g5c3N8lLXpKxLg")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
         let firebaseAuth = Auth.auth()
        firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)
     }
}

import UIKit
import Flutter
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GMSService.provideAPIKEY("AIzaSyARHzX_3Esoj0g8zgkzhLj4IsXNfgTj4YM")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

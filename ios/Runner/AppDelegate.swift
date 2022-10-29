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
    GMSService.provideAPIKEY("AIzaSyBTygVJojXbFjWjM2Jr9firACU-NYkd6Wg")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

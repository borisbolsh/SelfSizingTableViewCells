import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var networkService = DefaultNetworkService()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    if #available(iOS 13.0, *) {
        window?.backgroundColor = .systemBackground
    } else {
        window?.backgroundColor = .white
    }
    window?.rootViewController = ViewController(networkService: networkService)
    window?.makeKeyAndVisible()
    return true
  }
  
}


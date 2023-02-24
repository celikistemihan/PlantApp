//
//  AppDelegate.swift
//  PlantApp
//
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        return true
    }
    
    private func setRootViewController() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.backgroundColor = .systemBackground
        let navigationController = UINavigationController(rootViewController: RoutingManager.shared.welcomeViewController)
        window.rootViewController = navigationController
        self.window = window
    }
}


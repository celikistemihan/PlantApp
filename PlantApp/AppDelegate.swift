//
//  AppDelegate.swift
//  PlantApp
//
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let paywallViewController = PaywallViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        paywallViewController.delegate = self
        
        if LocalState.hasOnboarded {
            let navigationController = UINavigationController(rootViewController: RoutingManager.shared.paywallViewController)
            window?.rootViewController = navigationController
        } else {
            let navigationController = UINavigationController(rootViewController: RoutingManager.shared.welcomeViewController)
            window?.rootViewController = navigationController
        }
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

extension AppDelegate: PaywallViewControllerDelegate {
    func didTapCloseButton() {
        LocalState.hasOnboarded = true
    }
}


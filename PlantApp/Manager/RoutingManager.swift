//
//  RoutingManager.swift
//  PlantApp
//
//

import Foundation

final class RoutingManager {
    static let shared = RoutingManager()
    
    lazy var welcomeViewController: OnboardingContainerViewController = {
        let controller = OnboardingContainerViewController()
        return controller
    }()
    
    lazy var homeViewController: HomeViewController = {
        let controller = HomeViewController()
        return controller
    }()
    
    lazy var paywallViewController: PaywallViewController = {
        let controller = PaywallViewController()
        return controller
    }()
}

extension RoutingManager {
    func proceedToOnboardingScreen() {
        let controller = OnboardingContainerViewController()
        NavigationUtility.push(controller)
    }
    
    func proceedToPaywallScreen() {
        let controller = PaywallViewController()
        NavigationUtility.push(controller)
    }
    
    func proceedToHomeScreen() {
        let controller = HomeViewController()
        NavigationUtility.push(controller)
    }
}

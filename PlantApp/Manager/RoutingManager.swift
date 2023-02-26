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
}

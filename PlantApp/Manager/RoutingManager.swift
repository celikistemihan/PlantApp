//
//  RoutingManager.swift
//  PlantApp
//
//

import Foundation

final class RoutingManager {
    static let shared = RoutingManager()
    
    lazy var welcomeViewController: HomeViewController = {
        let controller = HomeViewController()
        return controller
    }()
}

extension RoutingManager {
    func proceedToOnboardingScreen() {
        let controller = OnboardingContainerViewController()
        NavigationUtility.push(controller)
    }
}

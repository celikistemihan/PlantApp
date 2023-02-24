//
//  RoutingManager.swift
//  PlantApp
//
//  Created by aisenur on 23.02.2023.
//

import Foundation

final class RoutingManager {
    static let shared = RoutingManager()
    
    lazy var welcomeViewController: WelcomeViewController = {
        let controller = WelcomeViewController()
        return controller
    }()
}

extension RoutingManager {
    func proceedToOnboardingScreen() {
        let controller = OnboardingContainerViewController()
        NavigationUtility.push(controller)
    }
}

//
//  SecondOnboardingRouter.swift
//  PlantApp
//
//  Created by aisenur on 27.02.2023.
//

final class SecondOnboardingRouter: SecondOnboardingRouterProtocol {
    func proceedToPaywallScreen() {
        RoutingManager.shared.proceedToPaywallScreen()
    }
}

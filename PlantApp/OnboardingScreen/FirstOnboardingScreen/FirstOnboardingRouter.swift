//
//  FirstOnboardingRouter.swift
//  PlantApp
//
//  Created by aisenur on 27.02.2023.
//

final class FirstOnboardingRouter: FirstOnboardingRouterProtocol {
    func proceedToPaywallScreen() {
        RoutingManager.shared.proceedToPaywallScreen()
    }
}

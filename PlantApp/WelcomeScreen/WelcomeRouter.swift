//
//  WelcomeRouter.swift
//  PlantApp
//
//

final class WelcomeRouter: WelcomeRouterProtocol {
    func proceedToOnboardingScreen() {
        RoutingManager.shared.proceedToOnboardingScreen()
    }
}

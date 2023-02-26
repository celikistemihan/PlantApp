//
//  SecondOnboardingViewModel.swift
//  PlantApp
//
//

import Foundation

final class SecondOnboardingViewModel {
    private let router: SecondOnboardingRouterProtocol
    
    init(router: SecondOnboardingRouterProtocol) {
        self.router = router
    }
    
    func proceedToPaywallScreen() {
        router.proceedToPaywallScreen()
    }
}

//
//  FirstOnboardingViewModel.swift
//  PlantApp
//
//

import Foundation

final class FirstOnboardingViewModel {
    private let router: FirstOnboardingRouterProtocol
    
    init(router: FirstOnboardingRouterProtocol) {
        self.router = router
    }
    
    func proceedToPaywallScreen() {
        router.proceedToPaywallScreen()
    }
}

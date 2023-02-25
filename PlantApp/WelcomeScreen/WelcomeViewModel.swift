//
//  WelcomeViewModel.swift
//  PlantApp
//
//

import Foundation

final class WelcomeViewModel {
    private let router: WelcomeRouterProtocol
    
    init(router: WelcomeRouterProtocol) {
        self.router = router
    }
    
    func proceedToOnboardingScreen() {
        router.proceedToOnboardingScreen()
    }
}

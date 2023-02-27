//
//  PaywallViewModel.swift
//  PlantApp
//

import Foundation

final class PaywallViewModel {
    private let router: PaywallRouterProtocol

    init(router: PaywallRouterProtocol) {
        self.router = router
    }
    var count: Int {
        return cells.count
    }
    
    func proceedToHomeScreen() {
        router.proceedToHomeScreen()
    }
    
    func getCell(at index: Int) -> PaywallCellPresentation {
        return cells[index]
    }
}

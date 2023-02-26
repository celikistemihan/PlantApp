//
//  PaywallViewModel.swift
//  PlantApp
//

import Foundation

final class PaywallViewModel {
        
    init() {}
    
    var count: Int {
        return cells.count
    }
    
    func getCell(at index: Int) -> PaywallCellPresentation {
        return cells[index]
    }
}

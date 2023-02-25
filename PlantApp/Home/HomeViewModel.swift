//
//  HomeViewModel.swift
//  PlantApp
//
//

import Foundation

final class HomeViewModel {
    private var questions = [Question]()
    
    enum Change {
        case reload
    }
    
    var changeHandler: ((Change) -> Void)?
    
    init() {
        getQuestions()
    }
    
    var questionCount: Int {
        return questions.count
    }
    
    private func getQuestions() {
        FetchItemsService.shared.fetchData() { [weak self] response in
            guard let self = self else {
                return
            }
            self.questions = response
            self.changeHandler?(.reload)
        }
    }
}

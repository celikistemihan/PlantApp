//
//  HomeViewModel.swift
//  PlantApp
//
//

import Foundation

final class HomeViewModel {
    private var questions = [Question]()
    private var categories = [Category]()
    
    enum Change {
        case reload
    }
    
    var changeHandler: ((Change) -> Void)?
    
    init() {
        getQuestions()
        getCategories()
    }
    
    var questionCount: Int {
        return questions.count
    }
    
    var categoryCount: Int {
        return categories.count
    }
    
    private func getQuestions() {
        FetchItemsService.shared.fetchQuestionData() { [weak self] response in
            guard let self = self else {
                return
            }
            self.questions = response
            self.changeHandler?(.reload)
        }
    }
    
    private func getCategories() {
        FetchItemsService.shared.fetchCategoryData { [weak self] response in
            guard let self = self else {
                return
            }
            self.categories = response.data
            self.changeHandler?(.reload)
        }
    }
    
    func getQuestion(at index: Int) -> QuestionCellPresentation {
        return QuestionCellPresentation(data: questions[index])
    }
    
    func getCategory(at index: Int) -> CategoryCellPresentation {
        return CategoryCellPresentation(data: categories[index])
    }
}

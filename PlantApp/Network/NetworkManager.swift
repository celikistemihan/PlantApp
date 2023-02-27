//
//  NetworkManager.swift
//  PlantApp
//
//

import Foundation

typealias QuestionListCompletionHandler = ([Question]) -> Void
typealias CategoryListCompletionHandler = (MyData) -> Void


final class FetchItemsService {
    static let shared = FetchItemsService()
    
    private init() {}
    
    private enum Const {
        static let questionUrl = "https://dummy-api-jtg6bessta-ey.a.run.app/getQuestions"
        static let categoryUrl = "https://dummy-api-jtg6bessta-ey.a.run.app/getCategories"
    }
    
    func fetchQuestionData(completion: @escaping QuestionListCompletionHandler) {
        if let url = URL(string: Const.questionUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error occured: \(error.localizedDescription)")
                } else {
                    let decoder = JSONDecoder()
                    if let data = data {
                        guard let items = try? decoder.decode([Question].self, from: data) else { return }
                        print(items)
                        completion(items)
                    }
                }
            }.resume()
        }
    }
    
    func fetchCategoryData(completion: @escaping CategoryListCompletionHandler) {
        if let url = URL(string: Const.categoryUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error occured: \(error.localizedDescription)")
                } else {
                    let decoder = JSONDecoder()
                    if let data = data {
                        guard let items = try? decoder.decode(MyData.self, from: data) else { return }
                        print(items)
                        completion(items)
                    }
                }
            }.resume()
        }
    }
}

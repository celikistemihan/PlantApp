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
        static let baseUrl = "https://dummy-api-jtg6bessta-ey.a.run.app/getQuestions"
        static let another = "https://dummy-api-jtg6bessta-ey.a.run.app/getCategories"
    }
    
    func fetchQuestionData(completion: @escaping QuestionListCompletionHandler) {
        if let url = URL(string: Const.baseUrl) {
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
        if let url = URL(string: Const.another) {
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

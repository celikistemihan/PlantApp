//
//  NetworkManager.swift
//  PlantApp
//
//

import Foundation

typealias QuestionListCompletionHandler = ([Question]) -> Void


final class FetchItemsService {
    static let shared = FetchItemsService()
    
    private init() {}
    
    private enum Const {
        static let baseUrl = "https://dummy-api-jtg6bessta-ey.a.run.app/getQuestions"
    }
    
    func fetchData(completion: @escaping QuestionListCompletionHandler) {
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
}

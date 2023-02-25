//
//  QuestionModel.swift
//  PlantApp
//
//

import Foundation

struct Question: Decodable {
    let id: Int
    let title, subtitle: String
    let imageURI: String
    let uri: String
    let order: Int
}

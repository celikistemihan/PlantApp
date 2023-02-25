//
//  QuestionModel.swift
//  PlantApp
//
//

import Foundation

struct Question: Decodable {
    let id: Int
    let title, subtitle: String
    let image_uri: String
    let uri: String
    let order: Int
}

// MARK: - Datum
struct MyData: Decodable {
    let data: [Category]
    let meta: Meta
}

// MARK: - Datum
struct Category: Decodable {
    let title: String
    let image: Image
}

// MARK: - Image
struct Image: Decodable {
    let url: String
}

// MARK: - Meta
struct Meta: Decodable {
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Decodable {
    let page, pageSize, pageCount, total: Int
}

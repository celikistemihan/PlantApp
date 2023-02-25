//
//  CategoryCellPresentation.swift
//  PlantApp


import Foundation

struct CategoryCellPresentation {
    let text: String
    let image: String
}

extension CategoryCellPresentation {
    init(data: Category) {
        text = data.title
        image = data.image.url
    }
}

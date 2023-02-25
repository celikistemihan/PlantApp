//
//  QuestionCellPresentation.swift
//  PlantApp
//

import Foundation

struct QuestionCellPresentation {
    let text: String
    let image: String
}

extension QuestionCellPresentation {
    init(data: Question) {
        text = data.title
        image = data.image_uri
    }
}


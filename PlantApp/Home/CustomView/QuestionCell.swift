//
//  QuestionCell.swift
//  PlantApp
//
//  Created by aisenur on 25.02.2023.
//

import UIKit
import SnapKit

final class QuestionCell: UICollectionViewCell {
    
    static let identifier: String = "cell_identifier"

    
    //MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12.0
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func prepare(with presentation: QuestionCellPresentation) {
        titleLabel.text = presentation.text
        guard let url = URL(string: presentation.image) else { return }
        UIImage.loadFrom(url: url) { [weak self] image in
            self?.backgroundImage.image = image
        }
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension QuestionCell {
    func setupUI() {
        addSubview(containerView)
        containerView.addSubview(backgroundImage)
        containerView.addSubview(titleLabel)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
    }
}

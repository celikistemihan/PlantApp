//
//  CategoryCell.swift
//  PlantApp
//
//  Created by aisenur on 25.02.2023.
//

import UIKit
import SnapKit

final class CategoryCell: UICollectionViewCell {
    
    static let identifier: String = "category_cell_identifier"
    
    //MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12.0
        view.layer.borderWidth = 0.5
        view.layer.borderColor = CGColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.1)
        view.clipsToBounds = true
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(with presentation: CategoryCellPresentation) {
        titleLabel.text = presentation.text
        guard let url = URL(string: presentation.image) else { return }
        UIImage.loadFrom(url: url) { [weak self] image in
            self?.backgroundImage.image = image
        }
    }
}

//MARK: - SetupUI
private extension CategoryCell {
    func setupUI() {
        addSubview(containerView)
        containerView.addSubview(backgroundImage)
        containerView.addSubview(titleLabel)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(16)
        }
    }
}

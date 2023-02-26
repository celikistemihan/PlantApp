//
//  QuestionCell.swift
//  PlantApp
//

import UIKit
import SnapKit

final class QuestionCell: UICollectionViewCell {
    
    static let identifier: String = "question_cell_identifier"
    
    //MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12.0
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1).cgColor
        view.clipsToBounds = true
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont(name: "Rubik", size: 15)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(with presentation: QuestionCellPresentation) {
        titleLabel.text = presentation.text
        guard let url = URL(string: presentation.image) else { return }
        UIImage.loadFrom(url: url) { [weak self] image in
            self?.backgroundImage.image = image
        }
    }
    
}

//MARK: - Setup UI
private extension QuestionCell {
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
            make.leading.trailing.equalToSuperview().inset(14)
            make.bottom.equalToSuperview().inset(13)
            make.top.equalToSuperview().inset(111)
        }
    }
}

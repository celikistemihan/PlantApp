//
//  TwoLinedButton.swift
//  PlantApp
//
//

import UIKit
import SnapKit

//MARK: - ViewModel
struct TwoLinedButtonViewModel {
    let primaryText: String
    let secondaryText: String
    let imageView: String
    let borderWidth: CGFloat
    let borderColor: CGColor
}

final class TwoLinedButton: UIButton {
    //MARK: - Views
    private let leftImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont(name: "Rubik-Bold", size: 16)
        return label
    }()
    
    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        label.font = UIFont(name: "Rubik-Regular", size: 12.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        layer.cornerRadius = 14
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func configure(with viewModel: TwoLinedButtonViewModel) {
        primaryLabel.text = viewModel.primaryText
        secondaryLabel.text = viewModel.secondaryText
        leftImageView.image = UIImage(named: viewModel.imageView)
        self.layer.borderWidth = viewModel.borderWidth
        self.layer.borderColor = viewModel.borderColor
    }
}
//MARK: - SetupUI
extension TwoLinedButton {
    func setupUI() {
        addSubview(primaryLabel)
        addSubview(secondaryLabel)
        addSubview(leftImageView)
      
        primaryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(13)
            make.leading.equalTo(leftImageView.snp.trailing).offset(12)
        }
        
        secondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(primaryLabel.snp.bottom).offset(1)
            make.bottom.equalToSuperview().inset(13)
            make.leading.equalTo(primaryLabel)
        }
        
        leftImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(18)
        }
    }
}

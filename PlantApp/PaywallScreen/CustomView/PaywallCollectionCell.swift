//
//  PaywallCollectionCell.swift
//  PlantApp
//
//

import UIKit
import SnapKit

final class PaywallCollectionCell: UICollectionViewCell {
    
    static let identifier: String = "paywall_cell_identifier"
    
    //MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14.0
        view.layer.borderWidth = 0.5
        view.layer.borderColor = CGColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.1)
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.08)
        view.clipsToBounds = true
        return view
    }()
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Rubik", size: 20)
        label.textColor = .white
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Rubik", size: 13)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(with presentation: PaywallCellPresentation) {
        titleLabel.text = presentation.primaryText
        subTitleLabel.text = presentation.subText
        iconView.image = UIImage(named: presentation.image)
    }
}
//MARK: - SetupUI
private extension PaywallCollectionCell {
    func setupUI() {
        addSubview(containerView)
        containerView.addSubview(iconView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitleLabel)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        iconView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(16)
            make.width.equalTo(36)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(iconView.snp.bottom).offset(16)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.bottom.equalToSuperview().inset(16)
        }
    }
}

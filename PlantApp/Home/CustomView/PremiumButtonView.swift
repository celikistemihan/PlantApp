//
//  PremiumButton.swift
//  PlantApp


import UIKit
import SnapKit

final class PremiumButtonView: UIView {
    //MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.142, green: 0.126, blue: 0.102, alpha: 1).cgColor
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private let emailIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "email-icon")
        return imageView
    }()
    
    private let emailIconContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private let infoText: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "email-text")
        return imageView
    }()
    
    private let arrowIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - SetupUI
private extension PremiumButtonView {
    func setupUI() {
        addSubview(containerView)
        containerView.addSubview(emailIconContainer)
        emailIconContainer.addSubview(emailIcon)
        containerView.addSubview(infoText)
        containerView.addSubview(arrowIcon)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        emailIcon.snp.makeConstraints { make in
            make.size.equalTo(45)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalTo(infoText.snp.leading)
            make.centerY.equalTo(infoText)
            // make.width.equalTo(36)
        }
        
        infoText.snp.makeConstraints { make in
            make.trailing.lessThanOrEqualTo(arrowIcon.snp.leading).offset(7)
            make.top.bottom.equalToSuperview().inset(13)
        }
        
        arrowIcon.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(20)
        }
    }
}

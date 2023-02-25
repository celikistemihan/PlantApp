//
//  PaywallViewController.swift
//  PlantApp
//
//

import UIKit
import SnapKit

final class PaywallViewController: UIViewController {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0.062, green: 0.117, blue: 0.089, alpha: 1).cgColor
        view.clipsToBounds = true
        return view
    }()
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "paywall-header")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        // imageView.sizeToFit()
        return imageView
    }()
    
    private let paywallHeaderTextView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "paywall-header-text")
        return imageView
    }()
    
    private let bottomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Try free for 3 days", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 40/255, green: 175/255, blue: 110/255, alpha: 1)
        button.layer.cornerRadius = 12.0
        //button.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let paywallInfoText: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "paywall-info-text")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension PaywallViewController {
    func setupUI() {
        self.view.addSubview(containerView)
        containerView.addSubview(headerImageView)
        containerView.addSubview(paywallHeaderTextView)
        containerView.addSubview(bottomButton)
        containerView.addSubview(paywallInfoText)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(300)
        }
        
        paywallHeaderTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(264)
            make.height.equalTo(71)
        }
        
        bottomButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(70)
            make.height.equalTo(52)
        }
        
        paywallInfoText.snp.makeConstraints { make in
            make.top.equalTo(bottomButton.snp.bottom).offset(8)
            make.height.equalTo(24)
            make.leading.trailing.equalTo(bottomButton)
        }
    }
}

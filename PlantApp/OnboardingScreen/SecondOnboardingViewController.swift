//
//  SecondOnboardingViewController.swift
//  PlantApp
//

import SnapKit
import UIKit

final class SecondOnboardingViewController: UIViewController {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
//    private let backgroundImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "background")
//        return imageView
//    }()
    
    private let titleView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "second-onboarding-title")
        return imageView
    }()
    
    private let artworkView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "artwork")
        imageView.contentMode = .top
        return imageView
    }()
    
    private let plantView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "second-onboarding-center")
        imageView.contentMode = .top
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let bottomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)

        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 40/255, green: 175/255, blue: 110/255, alpha: 1)
        button.layer.cornerRadius = 12.0
        //button.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        setupUI()
    }
}

private extension SecondOnboardingViewController {
    func setupUI() {
        self.view.addSubview(containerView)
        containerView.addSubview(titleView)
        containerView.addSubview(plantView)
        containerView.addSubview(artworkView)
        containerView.addSubview(bottomButton)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(59)
            make.width.equalTo(277)
            make.height.equalTo(41)
        }
        
        plantView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(80)
            make.height.equalTo(523)
            make.width.equalTo(375)
        }
        
        bottomButton.snp.makeConstraints { make in
            make.top.equalTo(plantView.snp.bottom)
            make.width.equalTo(327)
            make.height.equalTo(56)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        artworkView.snp.makeConstraints { make in
            make.height.equalTo(185)
            make.width.equalTo(167)
            make.trailing.equalTo(plantView.snp.trailing).offset(-96)
            make.top.equalToSuperview().inset(128)
        }
    }
}

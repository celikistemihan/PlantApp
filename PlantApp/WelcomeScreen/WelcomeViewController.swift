//
//  WelcomeViewController.swift
//  PlantApp

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    var viewModel: WelcomeViewModel!
    
    //MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    private let titleView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "content")
        return imageView
    }()
    
    private let plantView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "center")
        return imageView
    }()
    
    private let bottomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 40/255, green: 175/255, blue: 110/255, alpha: 1)
        button.layer.cornerRadius = 12.0
        button.addTarget(self, action: #selector(didTapBottomButton), for: .touchUpInside)
        return button
    }()
    
    private let termsOfUse: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "terms-of-use")
        return imageView
    }()
    
    @objc private func didTapBottomButton() {
        viewModel.proceedToOnboardingScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = WelcomeViewModel(router: WelcomeRouter())
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupUI()
    }
}

//MARK: - SetupUI
private extension WelcomeViewController {
    func setupUI() {
        self.view.addSubview(containerView)
        containerView.addSubview(backgroundImage)
        containerView.addSubview(titleView)
        containerView.addSubview(plantView)
        containerView.addSubview(bottomButton)
        containerView.addSubview(termsOfUse)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(59)
            make.height.equalTo(85)
        }
        
        plantView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview()
        }
        
        bottomButton.snp.makeConstraints { make in
            make.top.equalTo(plantView.snp.bottom)
            make.height.equalTo(56)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        termsOfUse.snp.makeConstraints { make in
            make.top.equalTo(bottomButton.snp.bottom).offset(17)
            make.bottom.equalToSuperview().inset(29)
            make.height.equalTo(30)
            make.leading.trailing.equalToSuperview().inset(73)
        }
    }
}


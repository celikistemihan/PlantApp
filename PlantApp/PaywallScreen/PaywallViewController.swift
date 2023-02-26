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
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close-button"), for: .normal)
        return button
    }()
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "paywall-header")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let paywallHeaderTextView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "paywall-header-text")
        return imageView
    }()
    
    private let inactiveButton: TwoLinedButton = {
        let button = TwoLinedButton()
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05)
        button.configure(with: TwoLinedButtonViewModel(primaryText: "1 Month", secondaryText: "$2.99/month, auto renewable", imageView: "inactive"))
        return button
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
    
    private let paywallInfoText: UILabel = {
        let label = UILabel()
        label.text = "After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable"
        label.font = UIFont(name: "Rubik", size: 9)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.52)
        return label
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        //stackView.layoutMargins = UIEdgeInsets(top: 1, left: 40, bottom: 1, right: 40)
        return stackView
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik", size: 11)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5), for: .normal)
        //button.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik", size: 11)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5), for: .normal)
        //button.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let restoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Restore", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik", size: 11)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5), for: .normal)
        //button.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
        return button
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
        containerView.addSubview(closeButton)
        containerView.addSubview(paywallHeaderTextView)
        containerView.addSubview(bottomButton)
        containerView.addSubview(paywallInfoText)
        containerView.addSubview(inactiveButton)
        //        containerView.addSubview(bottomStackView)
        //        bottomStackView.addArrangedSubview(UIView())
        //        bottomStackView.addArrangedSubview(termsButton)
        //        bottomStackView.addArrangedSubview(privacyButton)
        //        bottomStackView.addArrangedSubview(restoreButton)
        //        bottomStackView.addArrangedSubview(UIView())
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(300)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(55)
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        paywallHeaderTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(264)
            make.height.equalTo(71)
        }
        
        inactiveButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(bottomButton.snp.top).offset(-26)
        }
        
        bottomButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(70)
            make.height.equalTo(52)
        }
        
        paywallInfoText.snp.makeConstraints { make in
            make.top.equalTo(bottomButton.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalTo(bottomButton)
        }
        //
        //        bottomStackView.snp.makeConstraints { make in
        //            make.top.equalTo(paywallInfoText.snp.bottom).offset(10)
        //            make.bottom.equalToSuperview().inset(34)
        //            make.leading.trailing.equalTo(bottomButton)
        //        }
    }
}

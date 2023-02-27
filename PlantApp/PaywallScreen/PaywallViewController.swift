//
//  PaywallViewController.swift
//  PlantApp
//
//

import UIKit
import SnapKit

protocol PaywallViewControllerDelegate: AnyObject {
    func didTapCloseButton()
}

final class PaywallViewController: UIViewController {
    
    var viewModel: PaywallViewModel!
    weak var delegate: PaywallViewControllerDelegate?
    
    private enum Const {
        static let oneMonthPrimaryText = "1 Month"
        static let oneMonthSecondaryText = "$2.99/month, auto renewable"
        static let oneYearPrimaryText = "1 Year"
        static let oneYearSecondaryText = "First 3 days free, then $529,99/year"
        static let paywallInfoText = "After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable"
        static let bottomButtonText = "Try free for 3 days"
    }
    
    //MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0.062, green: 0.117, blue: 0.089, alpha: 1).cgColor
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isUserInteractionEnabled = true
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "close-button"), for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        button.imageView?.isUserInteractionEnabled = true
        return button
    }()
 
    @objc func didTapCloseButton() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        viewModel.proceedToHomeScreen()
        delegate?.didTapCloseButton()
    }
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "paywall-header")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let paywallHeaderTextView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "paywall-header-text")
        return imageView
    }()
    
    private let paywallCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PaywallCollectionCell.self, forCellWithReuseIdentifier: PaywallCollectionCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let oneMonthSubButton: TwoLinedButton = {
        let button = TwoLinedButton()
        button.configure(with: TwoLinedButtonViewModel(primaryText: Const.oneMonthPrimaryText, secondaryText: Const.oneMonthSecondaryText, imageView: "inactive", borderWidth: 0.5, borderColor: CGColor(red: 1, green: 1, blue: 1, alpha: 0.3)))
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05)
        button.addTarget(self, action: #selector(oneMonthSubButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let oneYearSubButton: TwoLinedButton = {
        let button = TwoLinedButton()
        button.configure(with: TwoLinedButtonViewModel(primaryText: Const.oneYearPrimaryText, secondaryText: Const.oneYearSecondaryText, imageView: "active", borderWidth: 1.5, borderColor: CGColor(red: 40/255, green: 175/255, blue: 110/255, alpha: 1)))
        button.addTarget(self, action: #selector(oneYearSubButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //TODO: Refactor
    @objc func oneYearSubButtonTapped() {
        oneMonthSubButton.configure(with: TwoLinedButtonViewModel(primaryText: Const.oneMonthPrimaryText, secondaryText: Const.oneMonthSecondaryText, imageView: "inactive", borderWidth: 0.5, borderColor: CGColor(red: 1, green: 1, blue: 1, alpha: 0.3)))
        oneYearSubButton.configure(with: TwoLinedButtonViewModel(primaryText: Const.oneYearPrimaryText, secondaryText: Const.oneYearSecondaryText, imageView: "active", borderWidth: 1.5, borderColor: CGColor(red: 40/255, green: 175/255, blue: 110/255, alpha: 1)))
    }
    
    //TODO: Refactor
    @objc func oneMonthSubButtonTapped() {
        oneMonthSubButton.configure(with: TwoLinedButtonViewModel(primaryText: Const.oneMonthPrimaryText, secondaryText: Const.oneMonthSecondaryText, imageView: "active", borderWidth: 1.5, borderColor:  CGColor(red: 40/255, green: 175/255, blue: 110/255, alpha: 1)))
        oneYearSubButton.configure(with: TwoLinedButtonViewModel(primaryText: Const.oneYearPrimaryText, secondaryText: Const.oneYearSecondaryText, imageView: "inactive", borderWidth: 0.5, borderColor: CGColor(red: 1, green: 1, blue: 1, alpha: 0.3)))
    }
    
    private let bottomButton: UIButton = {
        let button = UIButton()
        button.setTitle(Const.bottomButtonText, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 40/255, green: 175/255, blue: 110/255, alpha: 1)
        button.layer.cornerRadius = 12.0
        //button.addTarget(self, action: #selector(bottomButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let paywallInfoText: UILabel = {
        let label = UILabel()
        label.text = Const.paywallInfoText
        label.font = UIFont(name: "Rubik", size: 9)
        label.numberOfLines = 0
        label.contentMode = .center
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
        self.viewModel = PaywallViewModel(router: PaywallRouter())
        containerView.bringSubviewToFront(closeButton)
        
        paywallCollectionView.delegate = self
        paywallCollectionView.dataSource = self
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
    }
}

//MARK: - CollectionView Methods
extension PaywallViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaywallCollectionCell.identifier, for: indexPath) as! PaywallCollectionCell
        let item = viewModel.getCell(at: indexPath.row)
        cell.prepare(with: item)
        return cell
    }
}

extension PaywallViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 130)
    }
}

//MARK: - SetupUI
private extension PaywallViewController {
    //TODO: ScrollView ekle
    func setupUI() {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(headerImageView)
        containerView.addSubview(closeButton)
        containerView.addSubview(paywallHeaderTextView)
        containerView.addSubview(bottomButton)
        containerView.addSubview(paywallInfoText)
        containerView.addSubview(paywallCollectionView)
        containerView.addSubview(oneMonthSubButton)
        containerView.addSubview(oneYearSubButton)
        //        containerView.addSubview(bottomStackView)
        //        bottomStackView.addArrangedSubview(UIView())
        //        bottomStackView.addArrangedSubview(termsButton)
        //        bottomStackView.addArrangedSubview(privacyButton)
        //        bottomStackView.addArrangedSubview(restoreButton)
        //        bottomStackView.addArrangedSubview(UIView())
        
        scrollView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalTo(view)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.scrollView)
            make.left.right.equalTo(self.view)
        }
        
        headerImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(paywallCollectionView.snp.top).offset(24)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(75)
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(26)
            make.height.equalTo(26)
        }
        
        paywallHeaderTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalTo(paywallCollectionView.snp.top).offset(-24)
            make.height.equalTo(71)
        }
        
        paywallCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(oneMonthSubButton)
            make.height.equalTo(130)
            make.bottom.equalTo(oneMonthSubButton.snp.top).offset(-24)
        }
        
        oneMonthSubButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(oneYearSubButton.snp.top).offset(-26)
        }
        
        oneYearSubButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(bottomButton.snp.top).offset(-26)
        }
        
        bottomButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(oneYearSubButton)
            make.bottom.equalToSuperview().inset(70)
            make.height.equalTo(52)
        }
        
        paywallInfoText.snp.makeConstraints { make in
            make.top.equalTo(bottomButton.snp.bottom).offset(8)
            make.leading.trailing.equalTo(bottomButton)
            make.height.equalTo(50)
        }
        //
        //        bottomStackView.snp.makeConstraints { make in
        //            make.top.equalTo(paywallInfoText.snp.bottom).offset(10)
        //            make.bottom.equalToSuperview().inset(34)
        //            make.leading.trailing.equalTo(bottomButton)
        //        }
    }
}

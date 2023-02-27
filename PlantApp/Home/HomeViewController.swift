//
//  HomeViewController.swift
//  PlantApp
//
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel!
    let premiumView = PremiumButtonView()
    let tabBarVC = UITabBarController()
    
    enum Const {
        static let imageEdgeInsets = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0)
        static let titleOffset = UIOffset(horizontal: 0, vertical: -20)
    }
    
    //TODO: ScrollView ekle parent olarak
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomeViewModel()
        bindViewModel()
        setupUI()
        configureTabBar()
        
        questionCollectionView.dataSource = self
        questionCollectionView.delegate = self
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //MARK: - TabBar Items Configuration
    private func configureTabBar() {
        tabBarVC.tabBar.tintColor = UIColor(red: 40/255, green: 175/255, blue: 110/255, alpha: 1)
        
        let firstItem = UITabBarItem(title: "Home", image: UIImage(named: "home-icon"), tag: 0)
        let secondItem = UITabBarItem(title: "Diagnose", image: UIImage(named: "diagnose-icon"), tag: 1)
        let fourthItem = UITabBarItem(title: "My Garden", image: UIImage(named: "garden-icon"), tag: 3)
        let fifthItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile-icon"), tag: 4)
        
        //Dummy ViewControllers
        let firstVC = FirstVC()
        firstVC.tabBarItem = firstItem
        firstVC.tabBarItem.badgeColor = .green
        
        let secondVC = SecondVC()
        secondVC.tabBarItem = secondItem
        
        let thirdVC = ThirdVC()
        
        let fourthVC = FourthVC()
        fourthVC.tabBarItem = fourthItem
        
        let fifthVC = FifthVC()
        fifthVC.tabBarItem = fifthItem
        
        tabBarVC.setViewControllers([firstVC, secondVC, thirdVC, fourthVC, fifthVC], animated: false)
        tabBarVC.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        calculateTabBarItems(viewControllers: tabBarVC.viewControllers!)
        setupMiddleButton()
    }
    
    func calculateTabBarItems(viewControllers: [UIViewController]) {
        for vc in viewControllers {
            vc.tabBarItem.imageInsets = Const.imageEdgeInsets
            vc.tabBarItem.titlePositionAdjustment = Const.titleOffset
        }
    }
    
    //MARK: - Middle TabBar Item Configuration
    func setupMiddleButton() {
           let scanButton = UIButton(frame: CGRect(x: 0, y: 0, width: 74, height: 64))
           var scanButtonFrame = scanButton.frame
           scanButtonFrame.origin.y = tabBarVC.view.bounds.height - scanButtonFrame.height - 30
           scanButtonFrame.origin.x = tabBarVC.view.bounds.width/2 - scanButtonFrame.size.width/2
           scanButton.frame = scanButtonFrame

           scanButton.backgroundColor = .clear
           scanButton.layer.cornerRadius = scanButtonFrame.height/2
           view.addSubview(scanButton)

           scanButton.setImage(UIImage(named: "scan-icon"), for: .normal)
           view.layoutIfNeeded()
       }

    //MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    private let headerView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home-header-title")
        return imageView
    }()
    
    private let leafImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home-header-leafs")
        return imageView
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for plants"
        searchBar.searchBarStyle = .default
        searchBar.backgroundImage = UIImage()
        searchBar.layer.cornerRadius = 12.0
        searchBar.setSearchFieldBackgroundImage(UIImage(named: "search-bar"), for: .normal)
        return searchBar
    }()
    
    private let questionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(QuestionCell.self, forCellWithReuseIdentifier: QuestionCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private let getStartedText: UILabel = {
        let label = UILabel()
        label.text = "Get Started"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
}

//MARK: - Binding
private extension HomeViewController {
    func bindViewModel() {
        viewModel.changeHandler = { [weak self] change in
            DispatchQueue.main.async {
                self?.apply(change: change)
            }
        }
    }
    
    func apply(change: HomeViewModel.Change) {
        switch change {
        case .reload:
            questionCollectionView.reloadData()
            categoryCollectionView.reloadData()
        }
    }
}

//MARK: - CollectionView Methods
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.questionCollectionView {
            return viewModel.questionCount
        }
        return viewModel.categoryCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.questionCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuestionCell.identifier, for: indexPath) as! QuestionCell
            let question = viewModel.getQuestion(at: indexPath.row)
            cell.prepare(with: question)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
            let category = viewModel.getCategory(at: indexPath.row)
            cell.prepare(with: category)
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.questionCollectionView {
            return CGSize(width: 240, height: 164)
        }
        return CGSize(width: (collectionView.frame.width/2) * 0.90, height: 164)
    }
}

//MARK: - SetupUI
private extension HomeViewController {
    func setupUI() {
        self.view.addSubview(containerView)
        self.view.addSubview(tabBarVC.view)
        containerView.addSubview(headerView)
        containerView.addSubview(leafImageView)
        containerView.addSubview(searchBar)
        containerView.addSubview(getStartedText)
        containerView.addSubview(premiumView)
        containerView.addSubview(questionCollectionView)
        containerView.addSubview(categoryCollectionView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tabBarVC.view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(64)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(126)
            make.top.equalToSuperview().inset(50)
        }
        
        searchBar.snp.makeConstraints { make in
            make.leading.trailing.equalTo(premiumView)
            make.top.equalTo(headerView.snp.bottom).offset(14)
        }
        
        leafImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        premiumView.snp.makeConstraints { make in
            make.top.equalTo(leafImageView.snp.bottom).offset(24)
            make.leading.trailing.equalTo(questionCollectionView)
        }
        
        getStartedText.snp.makeConstraints { make in
            make.leading.trailing.equalTo(questionCollectionView).offset(5)
            make.top.equalTo(premiumView.snp.bottom).offset(24)
        }
        
        questionCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(getStartedText.snp.bottom).offset(16)
            make.height.equalTo(200)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(questionCollectionView.snp.bottom)
            make.leading.trailing.equalTo(questionCollectionView)
            make.bottom.equalToSuperview()
        }
    }
}

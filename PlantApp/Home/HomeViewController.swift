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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomeViewModel()
        bindViewModel()
        setupUI()
        questionCollectionView.dataSource = self
        questionCollectionView.delegate = self
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
    }
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
//    private let scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        return scrollView
//    }
    
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

private extension HomeViewController {
    
    func setupUI() {
        self.view.addSubview(containerView)
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
        
        return CGSize(width: 158, height: 164)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //        return UIEdgeInsets(top: 15, left: 0, bottom: 25, right: 0)
    //    }
}

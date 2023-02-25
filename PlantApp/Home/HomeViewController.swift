//
//  HomeViewController.swift
//  PlantApp
//
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel!
    private var cellPresentation: [QuestionCellPresentation] = []
    let premiumView = PremiumButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomeViewModel()
        bindViewModel()
        setupUI()
        collectionView.dataSource = self
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(QuestionCell.self, forCellWithReuseIdentifier: QuestionCell.identifier)
        return collectionView
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
            collectionView.reloadData()
        }
    }
}

private extension HomeViewController {
    
    func setupUI() {
        view.addSubview(premiumView)
        
        premiumView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(327)
            make.height.equalTo(67)
        }
        
//        collectionView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.questionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuestionCell.identifier, for: indexPath) as! QuestionCell
        cell.prepare(with: cellPresentation[indexPath.row])
        return cell
    }

    
}

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
        view.clipsToBounds = true
        return view
    }()
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "paywall-header")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension PaywallViewController {
    func setupUI() {
        self.view.addSubview(containerView)
        containerView.addSubview(headerImageView)
    }
}

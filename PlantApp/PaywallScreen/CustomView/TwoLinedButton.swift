//
//  TwoLinedButton.swift
//  PlantApp
//
//

import UIKit
import SnapKit

final class TwoLinedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private let primaryLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.text = "1 Month"
        label.font = UIFont(name: "Rubik-Bold", size: 16)
        return label
    }()
    
    private let secondaryLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.font = UIFont(name: "Rubik-Regular", size: 12.0)
        label.text = "$2.99/month, auto renewable"
        return label
    }()
}

extension TwoLinedButton {
    func setupUI() {
        addSubview(primaryLabel)
        addSubview(secondaryLabel)
        clipsToBounds = true
        layer.cornerRadius = 14
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
        
        primaryLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(12)
        }
        
        secondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(primaryLabel.snp.bottom).offset(1)
            make.bottom.equalToSuperview().inset(13)
            make.leading.equalTo(primaryLabel)
        }
    }

}

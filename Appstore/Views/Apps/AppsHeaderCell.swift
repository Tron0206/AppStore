//
//  AppsHeaderCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 16/05/2022.
//

import UIKit


class AppsHeaderCell: UICollectionViewCell {
    
    static let identifier = "AppsHeaderCell"
    
    let companyLabel: UILabel = {
        let label = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
        label.textColor = .blue
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24))
        label.numberOfLines = 0
        return label
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView(cornerRadius: 8)
        iv.backgroundColor = .red
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let stackView = VerticalStackView(arrangedSubviews: [companyLabel, titleLabel, imageView], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
    }
}

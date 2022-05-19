//
//  AppsHeaderCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 16/05/2022.
//

import UIKit


class AppsHeaderCell: UICollectionViewCell {
    
    static let identifier = "AppsHeaderCell"
    
    var app: SocialApp! {
        didSet {
            companyLabel.text = app.name
            titleLabel.text = app.tagline
            imageView.sd_setImage(with: URL(string: app.imageUrl), completed: nil)
        }
    }
    
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

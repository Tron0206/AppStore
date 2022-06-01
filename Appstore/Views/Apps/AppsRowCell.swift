//
//  AppsRowCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 14/05/2022.
//

import UIKit


class AppsRowCell: UICollectionViewCell {
    
    static let identifier = "AppsRowCell"
    
    var app: FeedResult! {
        didSet {
            nameLabel.text = app.name
            companyLabel.text = app.artistName
            imageView.sd_setImage(with: URL(string: app.artworkUrl100), completed: nil)
        }
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView(cornerRadius: 16)
        iv.backgroundColor = .purple
        iv.constrainWidth(constant: 64)
        iv.constrainHeight(constant: 64)
        return iv
    }()
    
    private let nameLabel = UILabel(text: "App name", font: .systemFont(ofSize: 20))
    
    private let companyLabel = UILabel(text: "Company name", font: .systemFont(ofSize: 13))
    
    private let getButton: UIButton = {
        let button = UIButton(title: "GET")
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.constrainWidth(constant: 80)
        button.constrainHeight(constant: 32)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 16
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4), getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
    }
}

//
//  AppDetailCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 27/05/2022.
//

import UIKit


class AppDetailCell: UICollectionViewCell {
    
    static let identifier = "AppDetailCell"
    
    var app: Result! {
        didSet {
            nameLabel.text = app?.trackName
            if let urlString = app?.artworkUrl100,
               let url = URL(string: urlString) {
                appIconImageView.sd_setImage(with: url)
            }
            releaseNotesLabel.text = app?.releaseNotes
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    private let appIconImageView: UIImageView = {
        let iv = UIImageView(cornerRadius: 16)
        iv.constrainHeight(constant: 140)
        iv.constrainWidth(constant: 140)
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
        return label
    }()
    
    private let priceButton: UIButton = {
        let button = UIButton(title: "$4.99")
        button.backgroundColor = .systemBlue
        button.constrainHeight(constant: 32)
        button.constrainWidth(constant: 80)
        button.layer.cornerRadius = 32 / 2
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let whatsNewLabel: UILabel = {
        let label = UILabel(text: "What's New", font: .boldSystemFont(ofSize: 20))
        return label
    }()
    
    private let releaseNotesLabel: UILabel = {
        let label = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let infoStackView = UIStackView(arrangedSubviews: [appIconImageView,
                                                          VerticalStackView(arrangedSubviews: [nameLabel,
                                                                                               UIStackView(arrangedSubviews: [priceButton, UIView()]),
                                                                                              UIView()],
                                                                            spacing: 12)],
                                        customSpacing: 20)
        let mainStackView = VerticalStackView(arrangedSubviews: [infoStackView,
                                                                whatsNewLabel,
                                                                releaseNotesLabel], spacing: 20)
        addSubview(mainStackView)
        mainStackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

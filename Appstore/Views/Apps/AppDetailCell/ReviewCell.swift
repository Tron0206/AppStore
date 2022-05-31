//
//  ReviewCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 30/05/2022.
//

import UIKit


class ReviewCell: UICollectionViewCell {
    
    static let identifier = "ReviewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel(text: "Review title", font: .boldSystemFont(ofSize: 18))
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel(text: "AUthor", font: .boldSystemFont(ofSize: 16))
        return label
    }()
    
    let starsStackView: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0..<5).forEach { _ in
            let imageView = UIImageView(image: UIImage(named: "star"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant: 24)
            arrangedSubviews.append(imageView)
        }
        arrangedSubviews.append(UIView())
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        return stackView
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel(text: "Review body\nReview body\nReview body\n", font: .systemFont(ofSize: 18), numberOfLines: 8)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let stackView = VerticalStackView(arrangedSubviews: [UIStackView(arrangedSubviews: [titleLabel, UIView(), authorLabel]),
                                                            starsStackView,
                                                            bodyLabel],
                                          spacing: 12)
        titleLabel.setContentCompressionResistancePriority(.init(rawValue: 0), for: .horizontal)
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .systemGray6
        layer.cornerRadius = 16
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

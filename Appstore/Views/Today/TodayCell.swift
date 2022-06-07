//
//  TodayCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 01/06/2022.
//

import UIKit


class TodayCell: BaseTodayCell {
    
    static let identifier = "TodayCell"
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
            imageView.image = UIImage(named: todayItem.imageName)
            descriptionLabel.text = todayItem.description
            backgroundColor = todayItem.backgroundColor
        }
    }
    
    let categoryLabel: UILabel = {
        let label = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 20))
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(text: "Utilizing your Time", font: .boldSystemFont(ofSize: 28))
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel(text: "All the tools and apps you need to intelligently organize your life the right way.", font: .systemFont(ofSize: 16), numberOfLines: 3)
        label.textAlignment = .justified
        return label
    }()
    
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "garden"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        clipsToBounds = true
        let containerView = UIView()

        containerView.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 240, height: 240))
        let stackView = VerticalStackView(arrangedSubviews: [categoryLabel,
                                                            titleLabel,
                                                            containerView,
                                                            descriptionLabel],
                                          spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

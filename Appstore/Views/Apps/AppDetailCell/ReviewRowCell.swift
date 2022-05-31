//
//  ReviewRowCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 30/05/2022.
//

import UIKit


class ReviewRowCell: UICollectionViewCell {
    
    static let identifier = "ReviewRowCell"
    
    let nameOfSection = UILabel(text: "Reviews & Ratings", font: .boldSystemFont(ofSize: 24))
    
    let reviewHorizontalController = ReviewHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(reviewHorizontalController.view)
        reviewHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

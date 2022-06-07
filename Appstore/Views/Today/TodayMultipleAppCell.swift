//
//  TodayMultipleAppCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 06/06/2022.
//

import UIKit


class TodayMultipleAppCell: BaseTodayCell {
    
    static let identifier = "TodayMultipleAppCell"
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
            backgroundColor = todayItem.backgroundColor
        }
    }
    
    let categoryLabel: UILabel = {
        let label = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 20))
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(text: "Utilizing your Time", font: .boldSystemFont(ofSize: 32), numberOfLines: 2)
        return label
    }()
    
    let multiplyController = UIViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        clipsToBounds = true
        multiplyController.view.backgroundColor = .red
        let stackView = VerticalStackView(arrangedSubviews: [categoryLabel,
                                                             titleLabel,
                                                             multiplyController.view],
                                          spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

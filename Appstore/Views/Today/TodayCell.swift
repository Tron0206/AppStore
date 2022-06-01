//
//  TodayCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 01/06/2022.
//

import UIKit


class TodayCell: UICollectionViewCell {
    
    static let identifier = "TodayCell"
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "garden"))
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.centerInSuperview(size: .init(width: 250, height: 250))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

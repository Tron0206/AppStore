//
//  ScreenshotCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 30/05/2022.
//

import UIKit


class ScreenshotCell: UICollectionViewCell {
    
    static let identifier = "ScreenshotCell"
    
    let screenshotImageView: UIImageView = {
        let iv = UIImageView(cornerRadius: 12)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(screenshotImageView)
        screenshotImageView.fillSuperview()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

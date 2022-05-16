//
//  AppsPageHeader.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 16/05/2022.
//

import UIKit


class AppsPageHeader: UICollectionReusableView {
    
    static let identifier = "AppsPageHeader"
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

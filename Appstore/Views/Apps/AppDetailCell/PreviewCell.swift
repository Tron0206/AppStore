//
//  PreviewCell.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 29/05/2022.
//

import UIKit


class PreviewCell: UICollectionViewCell {
    
    static let identifier = "PreviewCell"
    
    let previewScreenshotsController = PreviewScreenshotsController()
    
    let nameOfSection = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 24))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(previewScreenshotsController.view)
        addSubview(nameOfSection)
        nameOfSection.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        previewScreenshotsController.view.anchor(top: nameOfSection.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0 ))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

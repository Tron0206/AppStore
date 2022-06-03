//
//  PreviewScreenshotsController.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 29/05/2022.
//

import UIKit


class PreviewScreenshotsController: HorizontalSnappingController {
    
    var app: Result? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: ScreenshotCell.identifier)
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 35)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotCell.identifier, for: indexPath) as! ScreenshotCell
        let screenshotUrl = app?.screenshotUrls[indexPath.item]
        cell.screenshotImageView.sd_setImage(with: URL(string: screenshotUrl ?? ""))
        return cell
    }
}

extension PreviewScreenshotsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
}

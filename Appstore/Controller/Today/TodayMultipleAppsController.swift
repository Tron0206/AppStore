//
//  TodayMultipleAppsController.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 07/06/2022.
//

import UIKit


class TodayMultipleAppsController: BaseListController {
    
    var results: [FeedResult]! {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MultipleAppCell.self, forCellWithReuseIdentifier: MultipleAppCell.identifier)
        collectionView.isScrollEnabled = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(4, results.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleAppCell.identifier, for: indexPath) as! MultipleAppCell
        cell.app = results[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}


extension TodayMultipleAppsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: 64)
    }
}

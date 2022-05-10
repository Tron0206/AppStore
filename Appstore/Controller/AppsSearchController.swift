//
//  AppsSearchController.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 10/05/2022.
//

import UIKit


class AppsSearchController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .red
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

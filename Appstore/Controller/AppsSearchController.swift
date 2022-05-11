//
//  AppsSearchController.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 10/05/2022.
//

import UIKit


class AppsSearchController: UICollectionViewController {
    
    fileprivate var appResults = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.identifier)
        
        fetchITunesApps()
    }
    
    fileprivate func fetchITunesApps() {
        
        Service.shared.fetchApps { results, error  in
            
            if let error = error {
                print("Failed to fetch app: \(error)" )
                return
            }
            
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.identifier, for: indexPath) as! SearchResultCell
        let app = appResults[indexPath.item]
        
        cell.nameLabel.text = app.trackName
        cell.categoryLabel.text = app.primaryGenreName
        cell.ratingsLabel.text = "Rating: \(String(format: "%.1f", app.averageUserRating))"
        return cell
    }
}

extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}

//
//  AppsController.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 13/05/2022.
//

import Foundation
import UIKit


class AppsPageController: BaseListController {
    
    var groups: [AppGroup] = []
    var socialApps: [SocialApp] = []
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        fetchData()
        
    }
    
    fileprivate func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchWithUrl(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/25/apps.json") { appGroup, error in
            dispatchGroup.leave()
            guard let appGroup = appGroup else {
                return
            }
            self.groups.append(appGroup)
        }
        
        dispatchGroup.enter()
        Service.shared.fetchWithUrl(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/25/apps.json") { appGroup, error in
            dispatchGroup.leave()
            guard let appGroup = appGroup else {
                return
            }
            self.groups.append(appGroup)
        }
        dispatchGroup.enter()
        Service.shared.fetchSocialApps { socialApps, error in
            dispatchGroup.leave()
            self.socialApps = socialApps ?? []
        }
        
        //Completion
        dispatchGroup.notify(queue: .main) {
            self.activityIndicatorView.stopAnimating()
            self.collectionView.reloadData()
        }
        
    }
    
    private func setupView() {
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: AppsGroupCell.identifier)
        
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsPageHeader.identifier)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupCell.identifier, for: indexPath) as! AppsGroupCell
        let appGroup = groups[indexPath.item]
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        cell.horizontalController.didSelectHandler = { [weak self] feedResult in
            let detailController = AppDetailController()
            detailController.appId = feedResult.id
            detailController.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(detailController, animated: true)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsPageHeader.identifier, for: indexPath) as! AppsPageHeader
        header.appHeaderHorizontalController.socialApps = self.socialApps
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}


//MARK: Extensions

extension AppsPageController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}

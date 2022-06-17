//
//  TodayController.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 31/05/2022.
//

import UIKit


final class TodayController: BaseListController {
    
    var items = [TodayItem]()
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .darkGray
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Refactoring!
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
        fetchData()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = .systemGray5
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.identifier)
        collectionView.register(TodayMultipleAppsCell.self, forCellWithReuseIdentifier: TodayMultipleAppsCell.identifier)
    }
    
    private func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        var topFreeApps: AppGroup?
        var topPaidApps: AppGroup?
        
        dispatchGroup.enter()
        Service.shared.fetchGenericJSONData(urlString: NetworkURL.topFree) { (results: AppGroup?, error) in
            if let error = error {
                print("Error - \(error)")
                return
            }
            
            topFreeApps = results
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        Service.shared.fetchGenericJSONData(urlString: NetworkURL.topPaid) { (results: AppGroup?, error) in
            if let error = error {
                print("Error - \(error)")
                return
            }
            topPaidApps = results
            
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.activityIndicatorView.stopAnimating()
            self.items = [
                TodayItem(category: "LIFE HACK",
                          title: "Utilizing your Time",
                          imageName: "garden",
                          description: "All the tools an apps you need to intelligently organize your life the right way.",
                          backgroundColor: .white,
                          cellIdentifier: TodayCell.identifier,
                          apps: []),
                TodayItem(category: "THE DAILY LIST",
                          title: topFreeApps?.feed.title ?? "",
                          imageName: "",
                          description: "",
                          backgroundColor: .white,
                          cellIdentifier: TodayMultipleAppsCell.identifier,
                          apps: topFreeApps?.feed.results ?? []),
                TodayItem(category: "HOLIDAYS",
                          title: "Travel on a Budget",
                          imageName: "holiday",
                          description: "Find out all you need to know on how to travel without packing everything",
                          backgroundColor: UIColor(red: 251/255, green: 246/255, blue: 184/255, alpha: 1),
                          cellIdentifier: TodayCell.identifier,
                          apps: []),
                TodayItem(category: "THE DAILY LIST",
                          title: topPaidApps?.feed.title ?? "",
                          imageName: "",
                          description: "",
                          backgroundColor: .white,
                          cellIdentifier: TodayMultipleAppsCell.identifier,
                          apps: topPaidApps?.feed.results ?? [])
            ]
            
            
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.cellIdentifier, for: indexPath) as! BaseTodayCell
        cell.todayItem = item
        (cell as? TodayMultipleAppsCell)?.multipleController.collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleMultipleAppsTap(gesture:))))
        return cell
    }
    
    @objc fileprivate func handleMultipleAppsTap(gesture: UIGestureRecognizer) {
        let collectionView = gesture.view
        var superView = collectionView?.superview
        while superView != nil {
            if let cell = superView as? TodayMultipleAppsCell {
                guard let indexPath = self.collectionView.indexPath(for: cell) else { return }
                openFullscreenMultipleAppsController(for: indexPath)
            }
            superView = superView?.superview
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if items[indexPath.item].cellIdentifier == TodayMultipleAppsCell.identifier {
            openFullscreenMultipleAppsController(for: indexPath)
            return
        }
        
        let appFullscreenController = AppFullscreenController()
        appFullscreenController.todayItem = items[indexPath.row]
        appFullscreenController.modalTransitionStyle = .flipHorizontal
        present(appFullscreenController, animated: true)
    }
    
    private func openFullscreenMultipleAppsController(for indexPath: IndexPath) {
        let fullscreenController = TodayMultipleAppsController(mode: .fullscreen)
        fullscreenController.apps = items[indexPath.item].apps
        let navigationController = BackEnabledNavigationController(rootViewController: fullscreenController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}


extension TodayController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 64, height: 460)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}

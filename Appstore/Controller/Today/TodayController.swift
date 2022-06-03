//
//  TodayController.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 31/05/2022.
//

import UIKit


class TodayController: BaseListController {
    
    private var startingFrame: CGRect?
    private var appFullscreenController: AppFullscreenController!
    
    private var topAnchor: NSLayoutConstraint?
    private var leadingAnchor: NSLayoutConstraint?
    private var widthAnchor: NSLayoutConstraint?
    private var heightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = .systemGray5
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayCell.identifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCell.identifier, for: indexPath) as! TodayCell
        cell.backgroundColor = .white
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appFullscreenController = AppFullscreenController()
        appFullscreenController.dismissHandler = { [weak self] in
            self?.handleRemoveRedView()
        }
        let redView = appFullscreenController.view!
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))
        redView.layer.cornerRadius = 16
        view.addSubview(redView)
        addChild(appFullscreenController)
        self.appFullscreenController = appFullscreenController
        //absolute coordinate of cell
        guard let cell = collectionView.cellForItem(at: indexPath),
              //????
              let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        //
        // auto layout constraint animations
        // 4 anchors
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingAnchor = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthAnchor = redView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightAnchor = redView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topAnchor, leadingAnchor, widthAnchor, heightAnchor].forEach { $0?.isActive = true }
        
        //Update view
        //Question about layoutSubviews(), layoutIfNeeded
        self.view.layoutIfNeeded()
        
        //Open animation
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7,
                       options: .curveEaseOut,
                       animations: {
            self.topAnchor?.constant = 0
            self.leadingAnchor?.constant = 0
            self.widthAnchor?.constant = self.view.frame.width
            self.heightAnchor?.constant = self.view.frame.height
            self.view.layoutIfNeeded() //Starts animation
            self.tabBarController?.tabBar.isHidden = true

            //????????
                                    },
                       completion:nil)
    }
    
    //Close animation
    @objc func handleRemoveRedView() {
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.7,
                       options: .curveEaseOut,
                       animations: {
            self.appFullscreenController.tableView.contentOffset = .zero
            guard let startingFrame = self.startingFrame else {  return }

            self.topAnchor?.constant = startingFrame.origin.y
            self.leadingAnchor?.constant = startingFrame.origin.x
            self.widthAnchor?.constant = startingFrame.width
            self.heightAnchor?.constant = startingFrame.height
            
            self.view.layoutIfNeeded()
            //????????
            self.tabBarController?.tabBar.isHidden = false
                                    },
                       completion: { _ in
            self.appFullscreenController.view.removeFromSuperview()
            self.appFullscreenController.removeFromParent()
        })
    }
}


extension TodayController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}

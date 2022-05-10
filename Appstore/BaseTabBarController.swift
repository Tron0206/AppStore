//
//  BaseTabBarController.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 10/05/2022.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .systemGroupedBackground
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "Apps"
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Apps"
        redNavController.tabBarItem.image = UIImage(named: "apps")
        redNavController.navigationBar.prefersLargeTitles = true
        configureNavController(redNavController)
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .white
        blueViewController.navigationItem.title = "Search"
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.navigationBar.prefersLargeTitles = true
        blueNavController.tabBarItem.title = "Search"
        blueNavController.tabBarItem.image = UIImage(named: "search")
        configureNavController(blueNavController)
        
        viewControllers = [
            redNavController,
            blueNavController
        ]
    }
    
    private func configureNavController(_ nav: UINavigationController) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [.foregroundColor : UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor : UIColor.black]
        appearance.backgroundColor = .systemGroupedBackground
        nav.navigationBar.standardAppearance = appearance
        nav.navigationBar.scrollEdgeAppearance = appearance
    }
    

}

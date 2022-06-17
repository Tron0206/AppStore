//
//  BackEnabledNavigationController.swift
//  Appstore
//
//  Created by Zhasur Sidamatov on 13/06/2022.
//

import UIKit


class BackEnabledNavigationController: UINavigationController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
}

extension BackEnabledNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}

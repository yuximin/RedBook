//
//  RootViewController.swift
//  RedBook
//
//  Created by apple on 2022/10/10.
//

import UIKit

class RootViewController: UITabBarController {
    
    private let tabBarItems: [RootTabBarItem] = [.home, .shopping, .message, .mine]

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildViewControllers()
    }
    
    // MARK: - private
    
    private func setupChildViewControllers() {
        for tabBarItem in tabBarItems {
            let viewController = tabBarItem.viewController
            viewController.tabBarItem = UITabBarItem(title: tabBarItem.title, image: nil, selectedImage: nil)
            addChild(viewController)
        }
    }

}

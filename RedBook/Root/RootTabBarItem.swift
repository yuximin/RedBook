//
//  RootTabBarItem.swift
//  RedBook
//
//  Created by apple on 2022/10/10.
//

import Foundation
import UIKit

enum RootTabBarItem: Int {
    case home
    case shopping
    case message
    case mine
    
    var title: String {
        switch self {
        case .home:
            return "首页"
        case .shopping:
            return "购物"
        case .message:
            return "消息"
        case .mine:
            return "我"
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return YNavigationController(rootViewController: HomeViewController())
        case .shopping:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .white
            return viewController
        case .message:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .white
            return viewController
        case .mine:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .white
            return viewController
        }
    }
}

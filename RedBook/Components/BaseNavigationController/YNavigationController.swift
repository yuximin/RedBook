//
//  YNavigationController.swift
//  RedBook
//
//  Created by apple on 2022/11/10.
//

import UIKit

class YNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 设置`bottomBar`隐藏及显示，push第2个控制器时隐藏(这里必须在调用super之前执行，否则不生效)
        if viewControllers.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        // 设置`bottomBar`隐藏及显示
        if let viewController = viewControllers.first {
            // 第1个控制器显示`bottomBar`
            viewController.hidesBottomBarWhenPushed = false
        }
        
        if viewControllers.count >= 2 {
            // 第2个控制器隐藏`bottomBar`，这样在这之后的控制器都不会显示`bottomBar`
            viewControllers[1].hidesBottomBarWhenPushed = true
        }
    }
}

extension YNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard let navigationControllerStyle = viewController as? YNavigationControllerStyleProtocol else {
            return
        }
        
        viewController.navigationController?.isNavigationBarHidden = navigationControllerStyle.isNavigationBarHidden
    }
}

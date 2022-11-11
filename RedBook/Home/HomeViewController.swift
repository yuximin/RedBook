//
//  HomeViewController.swift
//  RedBook
//
//  Created by apple on 2022/10/10.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Home"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let viewController = HomeRecommendViewController()
        addChild(viewController)
        view.addSubview(viewController.view)
    }

}

// MARK: - YNavigationControllerStyleProtocol
extension HomeViewController: YNavigationControllerStyleProtocol {
    var isNavigationBarHidden: Bool {
        true
    }
}

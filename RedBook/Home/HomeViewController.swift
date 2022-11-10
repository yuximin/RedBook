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

}

// MARK: - YNavigationControllerStyleProtocol
extension HomeViewController: YNavigationControllerStyleProtocol {
    var isNavigationBarHidden: Bool {
        false
    }
}

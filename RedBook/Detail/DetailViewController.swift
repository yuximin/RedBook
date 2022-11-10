//
//  DetailViewController.swift
//  RedBook
//
//  Created by apple on 2022/11/10.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }

}

extension DetailViewController: YNavigationControllerStyleProtocol {
    var isNavigationBarHidden: Bool {
        false
    }
}

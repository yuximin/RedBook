//
//  YNavigationControllerStyleProtocol.swift
//  RedBook
//
//  Created by apple on 2022/11/10.
//

import Foundation
import UIKit

protocol YNavigationControllerStyleProtocol {
    var isNavigationBarHidden: Bool { get }
}

extension YNavigationControllerStyleProtocol where Self: UIViewController  {
    var isNavigationBarHidden: Bool {
        false
    }
}

//
//  AppDelegate.swift
//  RedBook
//
//  Created by apple on 2022/10/8.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: RootViewController())
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
    
}


//
//  AppDelegate.swift
//  InitiumTest
//
//  Created by SuVincent on 29/3/2017.
//  Copyright © 2017 SuVincent. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        let mainView = RootViewController()
        nav.viewControllers = [mainView]
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()

        return true
    }
}


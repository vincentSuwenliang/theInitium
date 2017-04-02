//
//  AppDelegate.swift
//  InitiumTest2
//
//  Created by SuVincent on 29/3/2017.
//  Copyright © 2017 SuVincent. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarItem1 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let tabBarItem2 = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)

        let nav1 = UINavigationController()
        let firstVC = NewsViewController()
        firstVC.tabBarItem = tabBarItem1
        nav1.viewControllers = [firstVC]

        let secondVC = UIViewController()
        secondVC.tabBarItem = tabBarItem2

        let tabBarController = UITabBarController()

        tabBarController.viewControllers = [nav1, secondVC]

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

}


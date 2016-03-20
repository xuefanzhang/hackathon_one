//
//  AppDelegate.swift
//  one
//
//  Created by Xuefan Zhang on 3/17/16.
//  Copyright © 2016 Xuefan Zhang. All rights reserved.
//

import UIKit

enum TabBarItem: Int {
    case GetCare    = 0
    case Globe      = 1
    case Chart      = 2
}

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?



    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let globeIcon = UIImage(named: "tabbar-feed")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let globeItem: UITabBarItem = UITabBarItem.init(title: "", image: globeIcon, tag: 0)
        globeItem.imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0)
        
        let getCareIcon = UIImage(named: "tabbar-GetCare")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let getCareItem = UITabBarItem.init(title: "", image: getCareIcon, tag: 1)
        getCareItem.imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0)
        
        let chartIcon = UIImage(named: "tabbar-user")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let chartItem = UITabBarItem.init(title: "", image: chartIcon, tag: 2)
        chartItem.imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0)
        
        let navigationController = UINavigationController(rootViewController: ViewController())
        navigationController.tabBarItem = globeItem
        let getCareController = UIViewController()
        getCareController.tabBarItem = getCareItem
        let userController = UIViewController()
        userController.tabBarItem = chartItem
        
        let viewControllers = [navigationController, getCareController, userController]
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.shadowImage = UIImage()
        tabBarController.viewControllers = viewControllers
        tabBarController.tabBar.backgroundImage = UIImage(named: "img-tabbar")
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


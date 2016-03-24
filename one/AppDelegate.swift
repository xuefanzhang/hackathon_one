//
//  AppDelegate.swift
//  one
//
//  Created by Xuefan Zhang on 3/17/16.
//  Copyright © 2016 Xuefan Zhang. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let backgroundColor = UIColor(red: 121/255, green: 120/255, blue: 123/255, alpha: 1)

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let feedIcon = UIImage(named: "tabbar-feed")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let feedItem: UITabBarItem = UITabBarItem.init(title: "", image: feedIcon, tag: 0)
        feedItem.imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0)
        
        let getCareIcon = UIImage(named: "tabbar-GetCare")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let getCareItem = UITabBarItem.init(title: "", image: getCareIcon, tag: 1)
        getCareItem.imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0)
        
        let chartIcon = UIImage(named: "tabbar-user")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let chartItem = UITabBarItem.init(title: "", image: chartIcon, tag: 2)
        chartItem.imageInsets = UIEdgeInsetsMake(-10, 0, 10, 0)

        let globeViewController = ViewController()
        globeViewController.title = "Week"
        let navigationController = UINavigationController(rootViewController: globeViewController)
        navigationController.navigationBar.barTintColor = backgroundColor
        navigationController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.translucent = false
        let titleFont = UIFont(name: "MuseoSlab-500", size: 15)
        let titleTextColor = UIColor(red: 56/255, green: 56/255, blue: 56/255, alpha: 1)
        navigationController.navigationBar.titleTextAttributes = [NSFontAttributeName: titleFont!,
            NSForegroundColorAttributeName: titleTextColor]
        navigationController.tabBarItem = feedItem
        let getCareController = UIViewController()
        getCareController.view.backgroundColor = UIColor(patternImage: UIImage(named: "videovisits")!)
        
        getCareController.tabBarItem = getCareItem
        let userController = UIViewController()
        userController.tabBarItem = chartItem
        
        let viewControllers = [navigationController, getCareController, userController]
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.shadowImage = UIImage()
        tabBarController.viewControllers = viewControllers
        tabBarController.tabBar.backgroundImage = UIImage(named: "img-tabbar")
        window?.rootViewController = tabBarController

        window?.backgroundColor = backgroundColor
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


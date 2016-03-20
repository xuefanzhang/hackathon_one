//
//  ViewController.swift
//  one
//
//  Created by Xuefan Zhang on 3/17/16.
//  Copyright © 2016 Xuefan Zhang. All rights reserved.
//

import UIKit
import PagingMenuController

class ViewController: UIViewController {
    let bubbleCount = 40
    var pagingMenuController: PagingMenuController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.clearColor()
        
        var viewControllers = [WeekViewController]()
        
        for i in 1...bubbleCount {
            let weekViewController = WeekViewController()
            var trimesterNumber: Int
            weekViewController.weekLabel.text = "WEEK \(i)"
        
            if 1...14 ~= i {
                trimesterNumber = 1
            } else if 15...27 ~= i {
                trimesterNumber = 2
            } else {
                trimesterNumber = 3
            }
            weekViewController.trimesterLabel.text = "TRIMESTER \(trimesterNumber)"
            weekViewController.dayLabel.text = "DAY 5"
            weekViewController.babySizeLabel.text = "At 2 inches, .5 ounces, your baby is about the size of a lime!"
            
            weekViewController.title = "\(i)"
            viewControllers.append(weekViewController)
        }
        
        let options = PagingMenuOptions()
        options.menuItemMargin = 10
        options.menuHeight = 60
        
        options.menuItemMode = .RoundRect(radius: 20, horizontalPadding: 10, verticalPadding: 10, selectedColor: UIColor(red: 162/255, green: 192/255, blue: 85/255, alpha: 1))
        options.menuDisplayMode = .Standard(widthMode: .Fixed(width: 320/8), centerItem: true, scrollingMode: PagingMenuOptions.MenuScrollingMode.ScrollEnabledAndBouces)

        pagingMenuController = PagingMenuController(viewControllers: viewControllers, options: options)
        
        pagingMenuController!.view.frame.origin.y += 64
        pagingMenuController!.view.frame.size.height -= 64
        
        addChildViewController(pagingMenuController!)
        view.addSubview(pagingMenuController!.view)
        pagingMenuController!.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


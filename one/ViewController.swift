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
            weekViewController.textLabel.text = "Week \(i)"
            weekViewController.title = "\(i)"
            viewControllers.append(weekViewController)
        }
        
        let options = PagingMenuOptions()
        options.menuItemMargin = 10
        options.menuHeight = 60
        options.menuItemMode = .RoundRect(radius: 40, horizontalPadding: 10, verticalPadding: 10, selectedColor: UIColor.greenColor())
        options.menuDisplayMode = .Standard(widthMode: .Fixed(width: 320/8), centerItem: false, scrollingMode: PagingMenuOptions.MenuScrollingMode.ScrollEnabledAndBouces)

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


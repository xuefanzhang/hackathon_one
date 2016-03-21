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
    let weekCount = 40
    let currentWeek = 12
    var pagingMenuController: PagingMenuController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.clearColor()
        
        var viewControllers = [WeekViewController]()
        
        var circleColors = [UIColor](count: weekCount, repeatedValue: UIColor())
        var textColors = [UIColor](count:weekCount, repeatedValue: UIColor.whiteColor())
        
        for i in 1...weekCount {
            let weekViewController = WeekViewController()
            var trimesterNumber: Int
            weekViewController.weekLabel.text = "WEEK \(i)"
        
            if 1...14 ~= i {
                trimesterNumber = 1
                if i < currentWeek {
                    circleColors[i-1] = UIColor(red: 162/255, green: 192/255, blue: 85/255, alpha: 0.3)
                    textColors[i-1] = UIColor.whiteColor().colorWithAlphaComponent(0.3)
                }
                else if i == currentWeek {
                    circleColors[i-1] = UIColor(red: 162/255, green: 192/255, blue: 85/255, alpha: 1)
                } else {
                    circleColors[i-1] = UIColor(red: 162/255, green: 192/255, blue: 85/255, alpha: 0.7)
                    textColors[i-1] = UIColor.whiteColor().colorWithAlphaComponent(0.7)
                }
            } else if 15...27 ~= i {
                trimesterNumber = 2
                circleColors[i-1] = UIColor(red: 235/255, green: 193/255, blue: 83/255, alpha: 0.7)
            } else {
                trimesterNumber = 3
                circleColors[i-1] = UIColor(red: 237/255, green: 133/255, blue: 73/255, alpha: 0.7)
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
        options.circleBackgroundColors = circleColors
        options.textColors = textColors
        options.backgroundColor = UIColor(red: 121/255, green: 120/255, blue: 123/255, alpha: 1)
        options.selectedBackgroundColor = UIColor.clearColor()
        options.menuItemMode = .Underline(height: 2, color: UIColor.whiteColor(), horizontalPadding: 10, verticalPadding: 0)
        options.menuDisplayMode = .Standard(widthMode: .Fixed(width: 320/8), centerItem: true, scrollingMode: PagingMenuOptions.MenuScrollingMode.ScrollEnabledAndBouces)

        pagingMenuController = PagingMenuController(viewControllers: viewControllers, options: options)

        addChildViewController(pagingMenuController!)
        view.addSubview(pagingMenuController!.view)
        pagingMenuController!.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


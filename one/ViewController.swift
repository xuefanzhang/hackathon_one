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
            
            weekViewController.title = "\(i)"
            
            if i == 12 {
                weekViewController.babySizeImageView.image = UIImage(named: "img-wk12LimeFetus")!
                weekViewController.babySizeLabel.text = "At 2 inches, .5 ounces, your baby is about the size of a lime!"
                weekViewController.appointments = [
                    AppointmentObject(m: "Feb", d: "25", t: "Nuchal Translucency Ultrasound", l: "UCSF Prenatal Diagnostic Center")
                ]
                weekViewController.bottomImageView = UIImageView(image: UIImage(named: "wk12")!)
                weekViewController.bottomImageView.sizeToFit()
                
            } else if i == 6 {
                weekViewController.babySizeImageView.image = UIImage(named: "img-wk6sweetpeaFetus")!
                weekViewController.babySizeLabel.text = "At about 1/4 of an inch, your baby is the size of a sweet pea!"
                weekViewController.appointments = [
                    AppointmentObject(m: "Dec", d: "13", t: "Appointment because no sushi", l: "loc")
                ]
                weekViewController.bottomImageView = UIImageView(image: UIImage(named: "wk6")!)
                weekViewController.bottomImageView.sizeToFit()
                weekViewController.bottomScrollView
            } else if i == 25 {
                weekViewController.babySizeImageView.image = UIImage(named: "img-wk25rutabagaFetus")!
                weekViewController.babySizeLabel.text = "At 13.5 inches, 1.5 lbs., your baby's weight is similar to a rutabaga!"
                weekViewController.appointments = [
                    AppointmentObject(m: "May", d: "27", t: "Screening: Anemia and gestational...", l: "One Medical Phlebotomy")
                ]
                weekViewController.bottomImageView = UIImageView(image: UIImage(named: "wk25")!)
                weekViewController.bottomImageView.sizeToFit()
            } else if i == 34 {
                weekViewController.babySizeImageView.image = UIImage(named: "img-wk25cantaloupeFetus")!
                weekViewController.babySizeLabel.text = "At 20 inches, 5 lbs., your baby is about the size of a cantaloupe!"
                weekViewController.appointments = [
                    AppointmentObject(m: "JUL", d: "20", t: "Prenatal Visit.", l: "One Medical - Laurel Heights")
                ]
                weekViewController.bottomImageView = UIImageView(image: UIImage(named: "wk34")!)
                weekViewController.bottomImageView.sizeToFit()
            }
            viewControllers.append(weekViewController)
        }
        
        let options = PagingMenuOptions()
        options.menuItemMargin = 10
        options.menuHeight = 60
        options.circleBackgroundColors = circleColors
        options.textColors = textColors
        options.backgroundColor = UIColor(red: 121/255, green: 120/255, blue: 123/255, alpha: 1)
        options.selectedBackgroundColor = UIColor.clearColor()
        options.menuItemMode = .Underline(height: 2, color: UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1), horizontalPadding: 10, verticalPadding: 0)
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


//
//  WeekViewController.swift
//  one
//
//  Created by Xuefan Zhang on 3/17/16.
//  Copyright © 2016 Xuefan Zhang. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {
    
    var textLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGrayColor()
        
        textLabel.frame = CGRectMake(0, 0, 200, 30)
        textLabel.center = view.center
        textLabel.textAlignment = .Center
        textLabel.font = UIFont.systemFontOfSize(24)
        view.addSubview(textLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

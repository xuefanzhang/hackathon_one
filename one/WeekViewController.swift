//
//  WeekViewController.swift
//  one
//
//  Created by Xuefan Zhang on 3/17/16.
//  Copyright © 2016 Xuefan Zhang. All rights reserved.
//

import UIKit

struct AppointmentObject {
    var month:String
    var date:String
    var title:String
    var location:String
    
    init(m: String, d:String, t: String, l: String) {
        month = m
        date = d
        title = t
        location = l
    }
}

class WeekViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let trimesterLabel = UILabel()
    let weekLabel = UILabel()
    let dayLabel = UILabel()
    let divider1 = UILabel()
    let divider2 = UILabel()
    
    let thisWeekLabel = UILabel()
    
    let appointmentsTableView = UITableView()
    
    //var appointments: [Dictionary<String, String>] = []
    var appointments: [AppointmentObject] = [
        AppointmentObject(m: "Feb", d: "25", t: "Nuchal Translucency Ultrasound", l: "UCSF Prenatal Diagnostic Center"),
        AppointmentObject(m: "Jan", d: "13", t: "Appointment because no sushi", l: "loc")
    ]
    
    let babySizeImageView = UIImageView()
    let babySizeLabel = UILabel()
    
    let tabBarImageView = UIImageView()
    let getCareImageView = UIImageView()
    let globeImageView = UIImageView()
    let chartImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(patternImage: UIImage(named: "img-bgDefault")!)
        
        trimesterLabel.textColor = UIColor.whiteColor()
        trimesterLabel.font = UIFont(name: "MuseoSlab-500", size: 15)
        trimesterLabel.sizeToFit()
        trimesterLabel.frame = CGRectMake(40, 10, CGRectGetWidth(trimesterLabel.bounds), CGRectGetHeight(trimesterLabel.bounds))
        view.addSubview(trimesterLabel)
        
        divider1.text = "|"
        divider1.textColor = UIColor.whiteColor()
        divider1.font = UIFont(name: "MuseoSlab-500", size: 15)
        divider1.sizeToFit()
        divider1.frame = CGRectMake(160, 10, CGRectGetWidth(divider1.bounds), CGRectGetHeight(divider1.bounds))
        view.addSubview(divider1)
        
        
        weekLabel.textColor = UIColor.whiteColor()
        weekLabel.font = UIFont(name: "MuseoSlab-500", size: 15)
        weekLabel.sizeToFit()
        weekLabel.frame = CGRectMake(180, 10, CGRectGetWidth(weekLabel.bounds), CGRectGetHeight(weekLabel.bounds))
        view.addSubview(weekLabel)
        
        divider2.text = "|"
        divider2.textColor = UIColor.whiteColor()
        divider2.font = UIFont(name: "MuseoSlab-500", size: 15)
        divider2.sizeToFit()
        divider2.frame = CGRectMake(250, 10, CGRectGetWidth(divider2.bounds), CGRectGetHeight(divider2.bounds))
        view.addSubview(divider2)
        
        dayLabel.textColor = UIColor.whiteColor()
        dayLabel.font = UIFont(name: "MuseoSlab-500", size: 15)
        dayLabel.sizeToFit()
        dayLabel.frame = CGRectMake(270, 10, CGRectGetWidth(dayLabel.bounds), CGRectGetHeight(dayLabel.bounds))
        view.addSubview(dayLabel)

        
        thisWeekLabel.text = "THIS WEEK"
        thisWeekLabel.textColor = UIColor(red: 234/255, green: 194/255, blue: 81/255, alpha: 1)
        divider2.font = UIFont(name: "Lato-Semibold", size: 15) //not bolding wtf
        thisWeekLabel.sizeToFit()
        thisWeekLabel.frame = CGRectMake(15, 50, CGRectGetWidth(thisWeekLabel.bounds), CGRectGetHeight(thisWeekLabel.bounds))
        view.addSubview(thisWeekLabel)
        
        appointmentsTableView.frame = CGRectMake(15, 60, 340, 200);
        appointmentsTableView.delegate = self
        appointmentsTableView.dataSource = self
        
        appointmentsTableView.backgroundColor = UIColor.clearColor()
        appointmentsTableView.backgroundView = nil
        appointmentsTableView.separatorStyle = .None
        appointmentsTableView.rowHeight = 60
        appointmentsTableView.allowsSelection = false
        
        appointmentsTableView.registerClass(AppointmentTableViewCell.self, forCellReuseIdentifier: AppointmentTableViewCell.cellIdentifier())
        
        view.addSubview(appointmentsTableView)

        babySizeImageView.image = UIImage(named: "img-wk12LimeFetus")!
        babySizeImageView.frame = CGRectMake(15, 280, 87, 96)
        view.addSubview(babySizeImageView)
        
        babySizeLabel.font = UIFont(name: "MuseoSlab-700", size: 22)
        babySizeLabel.textColor = UIColor.whiteColor()
        babySizeLabel.numberOfLines = 0
        babySizeLabel.lineBreakMode = .ByWordWrapping
        babySizeLabel.frame = CGRectMake(15, 390, view.bounds.width - 30, 80)
        view.addSubview(babySizeLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.appointments.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clearColor()
        return headerView
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let reuseIdentifier = AppointmentTableViewCell.cellIdentifier()
        
        let cell:AppointmentTableViewCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! AppointmentTableViewCell
        
        let appointment = self.appointments[indexPath.section]
        
        cell.monthLabel.text    = appointment.month
        cell.dateLabel.text     = appointment.date
        cell.titleLabel.text    = appointment.title
        cell.locationLabel.text = appointment.location
        
        
        
        cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.1)
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.whiteColor().colorWithAlphaComponent(0.3).CGColor
        cell.layer.borderWidth = 1

        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print ("You selected cell #\(indexPath.row)!")
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

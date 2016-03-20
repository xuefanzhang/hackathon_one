//
//  AppointmentTableViewCell.swift
//  one
//
//  Created by Xuefan Zhang on 3/19/16.
//  Copyright © 2016 Xuefan Zhang. All rights reserved.
//

import UIKit

class AppointmentTableViewCell: UITableViewCell {
    
    class func cellIdentifier() -> String {
        return NSStringFromClass(AppointmentTableViewCell.self) as String
    }
    
    let monthLabel = UILabel()
    let dateLabel = UILabel()
    let titleLabel = UILabel()
    let locationLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        monthLabel.font = UIFont(name: "Lato-Light", size: 15)
        monthLabel.textColor = UIColor.whiteColor()
        self.contentView.addSubview(monthLabel)
        
        dateLabel.font = UIFont(name: "MuseoSlab-500", size: 22)
        dateLabel.textColor = UIColor.whiteColor()
        self.contentView.addSubview(dateLabel)
        
        titleLabel.font = UIFont(name: "MuseoSlab-500", size: 15)
        titleLabel.textColor = UIColor.whiteColor()
        self.contentView.addSubview(titleLabel)

        locationLabel.font = UIFont(name: "Lato-Light", size: 15)
        locationLabel.textColor = UIColor.whiteColor()
        self.contentView.addSubview(locationLabel)
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)!
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        monthLabel.sizeToFit()
        dateLabel.sizeToFit()
        titleLabel.sizeToFit()
        locationLabel.sizeToFit()
        
        let appointmentCellLeftMargin: CGFloat = 10
        let appointmentCellTopMargin: CGFloat = 10
        let centerMargin: CGFloat = 20
        let maxDateLabelWidth = fmax(CGRectGetWidth(monthLabel.bounds), CGRectGetWidth(dateLabel.bounds))
        
        monthLabel.frame = CGRectMake(appointmentCellLeftMargin, appointmentCellTopMargin, maxDateLabelWidth, monthLabel.bounds.height)
        dateLabel.frame = CGRectOffset(monthLabel.frame, 0, monthLabel.bounds.height)
        titleLabel.frame = CGRectMake(CGRectGetMaxX(monthLabel.frame) + centerMargin, appointmentCellTopMargin, titleLabel.bounds.width, titleLabel.bounds.height)
        locationLabel.frame = CGRectOffset(titleLabel.frame, 0, titleLabel.bounds.height)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

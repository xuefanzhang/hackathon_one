//
//  MenuItemView.swift
//  PagingMenuController
//
//  Created by Yusuke Kita on 5/9/15.
//  Copyright (c) 2015 kitasuke. All rights reserved.
//

import UIKit

public class MenuItemView: UIView {
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .Center
        label.userInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public let backgroundCircleView: UIView = {
        let roundRectView = UIView()
        roundRectView.opaque = true;
        roundRectView.translatesAutoresizingMaskIntoConstraints = false
        roundRectView.layer.masksToBounds = true
        roundRectView.layer.cornerRadius = 20 // this should not be hard-coded, but 'hack'athon ;)
        
        return roundRectView
    }()
    
    private var options: PagingMenuOptions!
    private var widthLabelConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    
    internal init(title: String, options: PagingMenuOptions) {
        super.init(frame: .zero)
        
        self.options = options
        
        setupView()
        setupBackgroundCircleView(nil)
        layoutBackgroundCircleView()
        setupLabel(title: title, color: nil)
        layoutLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    // MARK: - Cleanup
    
    internal func cleanup() {
        titleLabel.removeFromSuperview()
        backgroundCircleView.removeFromSuperview()
    }
    
    // MARK: - Constraints manager
    
    internal func updateLabelConstraints(size size: CGSize) {
        // set width manually to support ratotaion
        if case .SegmentedControl = options.menuDisplayMode {
            let labelSize = calculateLableSize(size: size)
            widthLabelConstraint.constant = labelSize.width
        }
    }
    
    // MARK: - Label changer
    
    internal func focusLabel(selected selected: Bool) {
        if case .RoundRect = options.menuItemMode {
            backgroundColor = UIColor.clearColor()
        } else {
            backgroundColor = selected ? options.selectedBackgroundColor : options.backgroundColor
        }
        titleLabel.font = selected ? options.selectedFont : options.font

        // adjust label width if needed
        let labelSize = calculateLableSize()
        widthLabelConstraint.constant = labelSize.width
    }
    
    // MARK: - Constructor
    
    private func setupView() {
        if case .RoundRect = options.menuItemMode {
            backgroundColor = UIColor.clearColor()
        } else {
            backgroundColor = options.backgroundColor
        }
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    internal func setupLabel(title title: String?, color: UIColor?) {
        if (title != nil) {
            titleLabel.text = title
        }
        if (color != nil) {
            titleLabel.textColor = color
        }
        titleLabel.font = options.font
        addSubview(titleLabel)
    }

    internal func setupBackgroundCircleView(color: UIColor?) {
        // TODO:(Michael) make a custom color in the options
        if (color != nil) {
            backgroundCircleView.backgroundColor = color
        }
        addSubview(backgroundCircleView)
    }
    
    private func layoutLabel() {
        let viewsDictionary = ["label": titleLabel]
        
        let labelSize = calculateLableSize()

        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: [], metrics: nil, views: viewsDictionary)
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options: [], metrics: nil, views: viewsDictionary)
        
        NSLayoutConstraint.activateConstraints(horizontalConstraints + verticalConstraints)
        
        widthLabelConstraint = NSLayoutConstraint(item: titleLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1.0, constant: labelSize.width)
        widthLabelConstraint.active = true
    }

    private func layoutBackgroundCircleView() {
        let viewsDictionary = ["circleView": backgroundCircleView]

        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[circleView]-10-|", options: [], metrics: nil, views: viewsDictionary)
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[circleView]-10-|", options: [], metrics: nil, views: viewsDictionary)
        NSLayoutConstraint.activateConstraints(horizontalConstraints + verticalConstraints)
    }
    
    // MARK: - Size calculator
    
    private func calculateLableSize(size size: CGSize = UIApplication.sharedApplication().keyWindow!.bounds.size) -> CGSize {
        guard let text = titleLabel.text else { return .zero }
        
        let labelSize = NSString(string: text).boundingRectWithSize(CGSizeMake(CGFloat.max, CGFloat.max), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: titleLabel.font], context: nil).size

        let itemWidth: CGFloat
        switch options.menuDisplayMode {
        case let .Standard(widthMode, _, _):
            itemWidth = labelWidth(size: labelSize, widthMode: widthMode)
        case .SegmentedControl:
            itemWidth = size.width / CGFloat(options.menuItemCount)
        case let .Infinite(widthMode):
            itemWidth = labelWidth(size: labelSize, widthMode: widthMode)
        }
        
        let itemHeight = floor(labelSize.height)
        return CGSizeMake(itemWidth + calculateHorizontalMargin() * 2, itemHeight)
    }
    
    private func labelWidth(size size: CGSize, widthMode: PagingMenuOptions.MenuItemWidthMode) -> CGFloat {
        switch widthMode {
        case .Flexible: return ceil(size.width)
        case let .Fixed(width): return width
        }
    }
    
    private func calculateHorizontalMargin() -> CGFloat {
        if case .SegmentedControl = options.menuDisplayMode {
            return 0.0
        }
        return options.menuItemMargin
    }
}

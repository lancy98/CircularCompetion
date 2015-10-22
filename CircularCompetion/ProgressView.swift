//
//  ProgressView.swift
//  CircularCompetion
//
//  Created by Lancy on 22/05/15.
//  Copyright (c) 2015 Coder. All rights reserved.
//

import UIKit

/**
This class can be used to show the completion in the form of Donot.
*/
class ProgressView: UIView {
    
    var label: UILabel!
    var representationView: RepresentationView!
    
    override func awakeFromNib() {
        addRepresentationView()
        addLabel()
        
        let angle: Double = -90.0
        //The completion should start from top(i.e, 0 percent is at the top).
        representationView!.transform = CGAffineTransformMakeRotation(CGFloat(angle.toRadians))
    }
    
    /**
    Adds the label to the ProgressView.
    */
    func addLabel() {
        label = UILabel(frame: bounds)
        label.textAlignment = .Center
        label.font = UIFont(name: "Helvetica-bold", size: 16)
        let percent = Int(representationView!.progress * 100)
        label.text = "\(percent)%"
        
        fillSubview(label)
    }
    
    /**
    Adds the representation view to ProgressView.
    Representation view will display the donut progress indicator.
    */
    func addRepresentationView() {
        representationView = RepresentationView(frame: bounds)
        representationView.backgroundColor = UIColor.clearColor()
        fillSubview(representationView)
    }
    
    /** 
    Progress that needs to be represented in the Donut bar.
    */
    var progress: Double {
        get {
            return representationView!.progress
        }
        set(inProgress) {
            if inProgress >= 0.0 && inProgress <= 1.0 {
                if representationView != nil{
                    representationView!.progress = inProgress
                    let percent = Int(inProgress * 100)
                    if label != nil {
                        label.text = " \(percent)%"
                    }
                }
            }
        }
    }
}

extension UIView {
    /**
    This method can be called when you want to add a subview to the receiver and the subview should fill the receiver (i.e, subview frame = superview bounds),
    
    - parameter subview: The subview the should be added to the receiver.
    */
    func fillSubview(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[subview]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["subview" : subview]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[subview]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["subview" : subview]))
    }
}

extension Double {
    
    /**
    Use this method to convert the receiver value to radians.
    Note: The receiver value is assumed to be in degrees before converting it into radians.
    */
    var toRadians: Double {
        return ((M_PI * self) / 180.0)
    }
}

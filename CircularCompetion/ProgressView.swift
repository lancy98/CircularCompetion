//
//  ProgressView.swift
//  CircularCompetion
//
//  Created by Lancy on 22/05/15.
//  Copyright (c) 2015 Coder. All rights reserved.
//

import UIKit

@IBDesignable
class ProgressView: UIView {
    
    var label: UILabel!
    
    override func awakeFromNib() {
        label = UILabel(frame: bounds)
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(40)
        let percent = Int(internalProgress * 100)
        label.text = " \(percent)%"
        
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(label)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: NSLayoutFormatOptions(0), metrics:  nil, views:["label": label]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options: NSLayoutFormatOptions(0), metrics:  nil, views:["label": label]))
    }
    
    // The value contains
    @IBInspectable var progress: Double {
        get {
            return internalProgress
        }
        set(inProgress) {
            if inProgress > 0.0 && inProgress < 1.0 {
                internalProgress = inProgress
                let percent = Int(internalProgress * 100)
                if label != nil {
                    label.text = " \(percent)"
                }
            }
        }
    }
    
    private func toRad(degree: Double) -> Double {
        return ((M_PI * degree) / 180.0)
    }
    
    private var internalProgress: Double = 0.1
    
    private let safePadding = CGFloat(20.0)
    private var radius: CGFloat {
        return frame.size.width/2.0 - safePadding
    }
    
    private var angle: Double {
        return (360.0 * progress)
    }
    
    private var bgColor: UIColor {
        return UIColor.grayColor()
    }
    
    private var competionCircleColor: UIColor {
        return UIColor(red: 0.0, green: (126.0/255.0), blue: 0.0, alpha: 1.0)
    }
    
    // Progress can be between 0.0 and 1.0.
    private func drawProgress(progress: Double, rect: CGRect, color: UIColor) {
    
        let endAngle = CGFloat(M_PI*2.0*progress)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextAddArc(context, rect.size.width/2.0, rect.size.height/2.0, radius, 0, endAngle, 0)
        
        color.setStroke()
        
        CGContextSetLineWidth(context, 20)
        CGContextSetLineCap(context, kCGLineCapButt)
        
        CGContextDrawPath(context, kCGPathStroke)
    }
    
    override func drawRect(rect: CGRect) {
        
        super.drawRect(rect)
        
        //background circle.
        drawProgress(1.0, rect: rect, color: bgColor)
        // Competion circle.
        drawProgress(progress, rect: rect, color: competionCircleColor)
    }

}

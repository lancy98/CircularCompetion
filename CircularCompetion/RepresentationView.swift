//
//  RepresentationView.Swift
//  CircularCompetion
//
//  Created by Lancy on 22/05/15.
//  Copyright (c) 2015 Coder. All rights reserved.
//

import UIKit

class RepresentationView: UIView {
    
    /**
    Width of the circle as a float value.
    */
    var circleWidth: CGFloat = 10
    
    /**
    This is the distance from the cornor of the rectangle.
    */
    private let safePadding = CGFloat(10.0)
    
    /** 
    Radius of the donut bar.
    */
    private var radius: CGFloat {
        return min(frame.size.width/2.0, frame.size.height/2.0) - safePadding
    }
    
    /** 
    Background color representation.
    */
    private var bgColor: UIColor {
        return UIColor.grayColor()
    }
    
    /**
    Progress color representation. 
    */
    private var competionCircleColor: UIColor {
        return UIColor.greenColor()
    }
    
    /**
    Progress that needs to be represented in the Donut bar.
    */
    var progress: Double = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    /** 
    Draws the progress to the view in the form of donut.
    Progress can be between 0.0 and 1.0.
    
    - parameter progress: The progress value to be shown in the view.
    - parameter rect: The rectangle in which the progress needs to be drawn.
    - parameter color: The color that depicts the progress.
    */
    private func drawProgress(progress: Double, rect: CGRect, color: UIColor) {
        
        let startAngle = CGFloat(0)
        let endAngle = CGFloat(M_PI*2.0*progress)
        
        let context = UIGraphicsGetCurrentContext()
        CGContextAddArc(context, rect.size.width/2.0, rect.size.height/2.0, radius, startAngle, endAngle, 0)
        
        color.setStroke()
        
        CGContextSetLineWidth(context, circleWidth)
        CGContextSetLineCap(context, CGLineCap.Butt)
        
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
    }
    
    override func drawRect(rect: CGRect) {
        
        super.drawRect(rect)
        
        //background circle.
        drawProgress(1.0, rect: rect, color: bgColor)
        // Competion circle.
        drawProgress(progress, rect: rect, color: competionCircleColor)
    }
}


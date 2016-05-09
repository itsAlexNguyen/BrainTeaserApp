//
//  AnimationEngine.swift
//  BrainTeaser
//
//  Created by Alex Nguyen on 2016-05-08.
//  Copyright © 2016 Alex Nguyen. All rights reserved.
//

import UIKit
import pop

class AnimationEngine {
    
    class var offScreenRightPosition: CGPoint {
        return CGPointMake(UIScreen.mainScreen().bounds.width, CGRectGetMidY(UIScreen.mainScreen().bounds))
    }
    class var offScreenLeftPosition: CGPoint {
        return CGPointMake(-UIScreen.mainScreen().bounds.width, CGRectGetMidY(UIScreen.mainScreen().bounds))
    }
    class var screenCenterPosition: CGPoint {
        return CGPointMake(CGRectGetMidX(UIScreen.mainScreen().bounds), CGRectGetMidY(UIScreen.mainScreen().bounds))
    }
    let ANIM_DELAY = 0.8
    var originalConstants = [CGFloat]()
    var constraints: [NSLayoutConstraint]!
    
    init(constraints: [NSLayoutConstraint]) {
        for constraint in constraints {
            originalConstants.append(constraint.constant)
            constraint.constant = AnimationEngine.offScreenRightPosition.x
        }
        self.constraints = constraints
    }
    
    func animateOnScreen(delay: Int){
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(Double(delay) * Double(NSEC_PER_SEC)))
        
        dispatch_after(time, dispatch_get_main_queue()) {
            var index = 0
            repeat {
                let moveAnimation = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant)
                moveAnimation.toValue = self.originalConstants[index]
                moveAnimation.springBounciness = 12
                moveAnimation.springSpeed = 12
                
                let constraint = self.constraints[index]
                constraint.pop_addAnimation(moveAnimation, forKey: "moveOnScreen")
                index = index + 1
            } while (index < self.constraints.count)
        }
    }
}
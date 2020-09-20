//
//  MAWishfulAnimations.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/07.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit


public extension UIButton{
    
    
    // MARK:- Spring outwards Animation
    
    var springOutAnimation: CASpringAnimation{
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = NSValue(cgAffineTransform: CGAffineTransform(scaleX: 1.0, y: 1.0))
        animation.toValue = NSValue(cgAffineTransform:CGAffineTransform(scaleX: 0, y: 0))
        animation.damping = 0.2
        animation.initialVelocity = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.duration = 0.25
        return animation
    }
    
    // MARK:- horizontalShaking Animation
    var horizontalShakingAnimation: CAKeyframeAnimation{
        
        let keyFrameAnimation = CAKeyframeAnimation()
        
        keyFrameAnimation.keyPath = "position.x"
        keyFrameAnimation.values = [self.center.x - Defaults.shakeLength,
                                    self.center.x + Defaults.shakeLength,
                                    self.center.x - Defaults.shakeLength/2,
                                    self.center.x + Defaults.shakeLength/2,
                                    self.center.x]
        keyFrameAnimation.keyTimes = [0, 0.15, 0.3, 0.45, 0.60]
        keyFrameAnimation.duration = 0.85
        return keyFrameAnimation
    }
    
    // MARK:- Vertical bouncing Animation
    
    var verticalSpringAnimation: CASpringAnimation{
        
        let animation = CASpringAnimation(keyPath: "position.y")
        animation.fromValue = self.frame.origin.y - self.frame.height/6
        animation.toValue =  self.frame.origin.y  + self.frame.height/6
        animation.damping = 0.8
        animation.initialVelocity = 0.4
        animation.repeatCount = 1
        animation.duration = 1.0
        return animation
    }
    
    // MARK:- Zoom in and out with transparency
    var zoomingWithTransparencyAnimation: CAAnimationGroup{
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [zoomInAnimation, changeOpacityAnimation]
        groupAnimation.duration = 0.25
        groupAnimation.autoreverses = true
        return groupAnimation
    }
    var zoomInAnimation: CABasicAnimation{
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = CGAffineTransform(scaleX: 1.0, y: 1.0)
        animation.toValue = CGAffineTransform(scaleX: Defaults.zoomInScale, y: Defaults.zoomInScale)
        return animation
    }
    
    var zoomOutWithTransparencyAnimation: CAAnimationGroup{
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [zoomOutAnimation, changeOpacityAnimation]
        groupAnimation.duration = 0.25
        groupAnimation.autoreverses = true
        return groupAnimation
    }
    var zoomOutAnimation: CABasicAnimation{
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = CGAffineTransform(scaleX: 1.0, y: 1.0)
        animation.toValue = CGAffineTransform(scaleX: Defaults.zoomOutScale, y: Defaults.zoomOutScale)
        return animation
    }
    var changeOpacityAnimation:CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = Defaults.transparencyFactor
        return animation
    }
    
    // MARK :- Rotate by angle
    
    var rotateBy45Degree:CABasicAnimation{
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi/4
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.duration = 0.50
        
        return animation
    }
    
    var rotateBy90Degree:CABasicAnimation{
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi/2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.duration = 0.50
        
        return animation
    }
    var rotateBy180Degree:CABasicAnimation{
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.duration = 0.50
        
        return animation
    }
    
    var rotateBy360Degree:CABasicAnimation{
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = 2 * CGFloat.pi
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.duration = 0.50
        
        return animation
    }
}

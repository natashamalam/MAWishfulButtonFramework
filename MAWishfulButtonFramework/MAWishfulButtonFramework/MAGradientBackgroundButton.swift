//
//  MAGradientBackgroundButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/08.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MAGradientBackgroundButton: MAGradientBaseButton {
    
    @IBInspectable
    public var darkerShade: UIColor = UIColor.darkGray{
        didSet{
            setGradientBackground()
        }
    }
    
    @IBInspectable
    public var lighterShade: UIColor = UIColor.lightGray{
        didSet{
            setGradientBackground()
        }
    }
    
    @IBInspectable
    public var startPointX: CGFloat = 0.0{
        didSet{
            setGradientBackground()
        }
    }
    @IBInspectable
    public var startPointY: CGFloat = 0.5{
        didSet{
            setGradientBackground()
        }
    }
    @IBInspectable
    public var endPointX: CGFloat = 0.5{
        didSet{
            setGradientBackground()
        }
    }
    @IBInspectable
    public var endPointY: CGFloat = 0.0{
        didSet{
            setGradientBackground()
        }
    }
    
    func setGradientBackground(){
        gradientLayer.colors = [darkerShade.cgColor, lighterShade.cgColor,]
        gradientLayer.locations = [0, 0.4]
        gradientLayer.startPoint = CGPoint(x:startPointX, y: startPointY)
        gradientLayer.endPoint = CGPoint(x:endPointX, y: endPointY)
    }
    func updateGradientFrame(){
        gradientLayer.frame = self.bounds
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientFrame()
        self.clipsToBounds = true
        self.setTitle(nil, for: .normal)
        
        if titleTextColor == nil{
            titleTextColor = Defaults.buttonTitleColor
        }
        self.titleTextLabel.titleFrame = self.bounds
        
    }
    
}

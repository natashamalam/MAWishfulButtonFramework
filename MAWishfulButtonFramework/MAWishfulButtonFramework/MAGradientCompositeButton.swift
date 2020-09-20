//
//  MAGradientCompositeButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/14.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MAGradientCompositeButton: MACompositeBaseButton {

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
            startPointX = min(startPointX, 1.0)
            setGradientBackground()
        }
    }
    @IBInspectable
    public var startPointY: CGFloat = 0.5{
        didSet{
            startPointY = min(startPointY, 1.0)
            setGradientBackground()
        }
    }
    @IBInspectable
    public var endPointX: CGFloat = 0.5{
        didSet{
            endPointX = min(endPointX, 1.0)
            setGradientBackground()
        }
    }
    @IBInspectable
    public var endPointY: CGFloat = 0.0{
        didSet{
            endPointY = min(endPointY, 1.0)
            setGradientBackground()
        }
    }
    
    func setGradientBackground(){
        gradientLayer.colors = [darkerShade.cgColor, lighterShade.cgColor]
        gradientLayer.locations = [0, 0.5]
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
        self.setTitle(nil, for:.normal)
        self.imageLayer.contentFrame = updateImageFrame()
        self.titleTextLabel.titleFrame = updateTitleFrame()
    }
}

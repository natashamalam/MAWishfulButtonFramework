//
//  MAGradientBorderButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/08.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MAGradientBorderButton: MAGradientBaseButton {

    let shapeLayer = CAShapeLayer()
    
    @IBInspectable
    public var darkerShade: UIColor = UIColor.systemPink{
        didSet{
            setGradientBorder()
        }
    }
       
    @IBInspectable
    public var lighterShade: UIColor = UIColor.systemOrange{
        didSet{
            setGradientBorder()
        }
    }
    
    @IBInspectable
    public var gradientBorderWidth: CGFloat = 2.0{
        didSet{
            setGradientBorder()
        }
    }
    @IBInspectable
    public var startPointX: CGFloat = 1.0{
        didSet{
            setGradientBorder()
        }
    }
    @IBInspectable
    public var startPointY: CGFloat = 0.0{
        didSet{
            setGradientBorder()
        }
    }
    @IBInspectable
    public var endPointX: CGFloat = 0.0{
        didSet{
            setGradientBorder()
        }
    }
    @IBInspectable
    public var endPointY: CGFloat = 1.0{
        didSet{
            setGradientBorder()
        }
    }
   
    func setGradientBorder(){
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        shapeLayer.lineWidth = gradientBorderWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        
        gradientBorderLayer.colors = [darkerShade.cgColor, lighterShade.cgColor]
        gradientBorderLayer.locations = [0.0, 0.5]
        gradientBorderLayer.startPoint = CGPoint(x:startPointX, y: startPointY)
        gradientBorderLayer.endPoint = CGPoint(x:endPointX, y: endPointY)
        gradientBorderLayer.frame = self.bounds
        gradientBorderLayer.mask = shapeLayer
    }
    func upgradeFrame(){
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        gradientBorderLayer.frame = self.bounds
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = Defaults.clearBackgroudColor
        self.setTitle(nil, for: .normal)
        if titleTextColor == nil{
             titleTextColor = Defaults.buttonTitleColor
        }
        self.titleTextLabel.titleFrame = self.bounds
        
        upgradeFrame()
    }
    
    

}

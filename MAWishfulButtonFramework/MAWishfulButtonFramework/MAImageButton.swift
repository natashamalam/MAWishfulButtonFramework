//
//  MAImageButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/07.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit


@IBDesignable
public class MAImageButton: MAWishfulBaseButton {
    
    @IBInspectable
    public override var backgroundColor: UIColor?{
        get{
            if let color = self.layer.backgroundColor{
                return UIColor(cgColor: color)
            }
            return nil
        }
        set{
            if let backgroundColor = newValue{
                self.layer.backgroundColor = backgroundColor.cgColor
            }
        }
    }
    
    @IBInspectable
    public var imageOffsetXY : CGFloat = 15.0{
        didSet{
            self.imageLayer.imageOffset = imageOffsetXY
        }
    }
    
    @IBInspectable
    public var contentImage : UIImage? {
        didSet{
            imageLayer.contentFrame = updateImageFrame()
            
            if let image = contentImage{
                self.imageLayer.contentImage = image
            }
            else{
                self.imageLayer.contentImage = UIImage(named: "apple_white")
            }
        }
    }
    
    override var buttonPath: UIBezierPath{
        return UIBezierPath(ovalIn: self.bounds)
    }
    
    func updateImageFrame()->CGRect{
        let contentFrame = CGRect(
            x: self.bounds.origin.x + imageOffsetXY,
            y: self.bounds.origin.y + imageOffsetXY,
            width: (self.bounds.width - 2 * imageOffsetXY) ,
            height: self.bounds.height - (2 * imageOffsetXY) )
        return contentFrame
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setTitle(nil, for:.normal)
        
        if backgroundColor == nil {
            backgroundColor = Defaults.clearBackgroudColor
        }
        if borderWidth == 0.0{
            borderWidth = 2.0
        }
        if borderColor == nil{
            borderColor = Defaults.borderColor
        }
        
        imageLayer.contentFrame = updateImageFrame()
        
    }
    
    
}

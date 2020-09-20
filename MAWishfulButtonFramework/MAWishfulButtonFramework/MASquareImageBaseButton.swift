//
//  MASquareImageBaseButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/14.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MASquareImageBaseButton: MAImageButton {
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    public override func layoutSubviews() {
       super.layoutSubviews()
        imageLayer.contentFrame = updateImageFrame()
    }
    
    override var buttonPath : UIBezierPath{
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
        return path
    }

   

}

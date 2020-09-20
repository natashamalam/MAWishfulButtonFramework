//
//  MAWishfulAdvancedButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/09.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MAWishfulAdvancedButton: MAWishfulBaseButton {
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    public var buttonTitle: String = "Button"{
        didSet{
             self.titleTextLabel.titleText = buttonTitle
        }
    }
    
    @IBInspectable
    public var fontSize: CGFloat = Defaults.fontSize{
        didSet{
            self.titleTextLabel.titleFontSize = fontSize
        }
    }
       
    @IBInspectable
    public var textAlignment: String = "center"{
        didSet{
            self.titleTextLabel.titleAlignment = textAlignment
        }
    }
    
    @IBInspectable
    public var titleTextColor: UIColor?{
        didSet{
            if let textColor = titleTextColor{
                self.titleTextLabel.titleTextColor = textColor
            }
        }
     }
    
    override var buttonPath: UIBezierPath{
        return UIBezierPath(roundedRect: self.bounds, cornerRadius: self.cornerRadius)
    }
    
  
}

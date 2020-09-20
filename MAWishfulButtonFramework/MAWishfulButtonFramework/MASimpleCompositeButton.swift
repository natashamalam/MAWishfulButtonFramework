//
//  MACompositeButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/13.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MASimpleCompositeButton: MACompositeBaseButton {
    
    @IBInspectable
    public var titleBackgroundColor: UIColor = UIColor.systemBlue{
        didSet{
            self.titleTextLabel.layer.backgroundColor = titleBackgroundColor.cgColor
        }
    }
    
    @IBInspectable
    public var imageBackgroundColor: UIColor?{
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        self.setTitle(nil, for:.normal)
        self.imageLayer.contentFrame = updateImageFrame()
        self.titleTextLabel.titleFrame = updateTitleFrame()
        
    }
    
    
}

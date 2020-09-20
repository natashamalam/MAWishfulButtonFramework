//
//  MARectangularButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/07.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MARectangularButton: MAWishfulAdvancedButton {
    
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.setTitle(nil, for: .normal)
        if backgroundColor == nil{
            backgroundColor = Defaults.buttonBackgroundColor
        }
        if titleTextColor == nil{
            titleTextColor = Defaults.buttonTitleColor
        }
        self.titleTextLabel.titleFrame = self.bounds
    }

}

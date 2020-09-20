//
//  MACircularImageBaseButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/14.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MACircularImageBaseButton: MAImageButton {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
       
        self.layer.cornerRadius = self.bounds.height/2
        imageLayer.contentFrame = updateImageFrame()
        
        
    }

   
}

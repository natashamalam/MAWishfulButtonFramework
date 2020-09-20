//
//  MAInnerBorderLayer.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/08.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

public class MAInnerBorderLayer: CAShapeLayer {

    var boundingRect: CGRect = .zero{
        didSet{
            self.path = updateLayerPath().cgPath
        }
    }
    
    var layerCornerRadius: CGFloat = 0.0{
        didSet{
            self.path = updateLayerPath().cgPath
        }
    }
    
    var layerOffSet : CGFloat = 2.0{
        didSet{
            self.path = updateLayerPath().cgPath
        }
    }
    
    var layerLineWidth : CGFloat = 1.0{
        didSet{
             self.lineWidth = layerLineWidth
        }
    }
    
    var layerStrokeColor: UIColor = UIColor.systemBlue{
        didSet{
            self.strokeColor = layerStrokeColor.cgColor
        }
    }
  
    var layerFillColor: UIColor = UIColor.clear{
       didSet{
            self.fillColor = layerFillColor.cgColor
        }
    }
     
    override init() {
        super.init()
        self.path = updateLayerPath().cgPath
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.path = updateLayerPath().cgPath
    }
    
    init(_ boundingRect: CGRect = .zero, cornerRadius: CGFloat = 0.0, strokeColor:UIColor = UIColor.systemBlue){
        super.init()
        self.layerCornerRadius = cornerRadius
        self.boundingRect = boundingRect
        self.layerStrokeColor = strokeColor
    }
    
    func updateLayerPath()->UIBezierPath{
        let boundingRect = self.boundingRect.insetBy(dx: layerOffSet, dy: layerOffSet)
        return UIBezierPath(roundedRect: boundingRect, cornerRadius: layerCornerRadius)
        
    }
}

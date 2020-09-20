//
//  MAWishfulBaseButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/07.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MAWishfulBaseButton: UIButton {
    
    public let titleTextLabel = MACompositeTitleLabel()
    public let imageLayer = MAImageLayer()
    
    public var appliedAnimation : AnimationSuit?
    
    
    @IBInspectable
    public var borderWidth: CGFloat = 0.0{
        didSet{
           self.layer.borderWidth = borderWidth
        }
     }
    
    @IBInspectable
    public var borderColor: UIColor?{
        get{
            if let color = self.layer.borderColor{
                return UIColor(cgColor: color)
            }
            return nil
        }
        set{
            if let buttonBorderColor = newValue{
               self.layer.borderColor = buttonBorderColor.cgColor
            }
        }
    }
  
    @IBInspectable
    public var shadowColor: UIColor = UIColor.clear{
        didSet{
            applyShadow()
        }
    }
    
  
    @IBInspectable
    public var shadowOpacity: Float = 1.0{
        didSet{
            applyShadow()
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat = 10.0{
        didSet{
            applyShadow()
        }
    }
    //needed for applying shadow
    var buttonPath : UIBezierPath{
        return UIBezierPath(rect: self.bounds)
    }

    func applyShadow(){
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = min(shadowOpacity, 1.0)
        self.layer.shadowPath = buttonPath.cgPath
    }
    
    //call back closure for handling event upon button tap
    public var buttonPressed: ((UIButton)->())?

    private func addCustomLayers() {
        layer.masksToBounds = false
        self.layer.addSublayer(imageLayer)
        self.addSubview(titleTextLabel)
    }
    
    public override init(frame: CGRect) {
         super.init(frame: frame)
         self.clipsToBounds = true
        
         addCustomLayers()
        
         addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
     }
           
     public required init?(coder: NSCoder) {
         super.init(coder: coder)
         self.clipsToBounds = true
         
         addCustomLayers()
         addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
     }
     
    @objc func buttonClicked(_ sender: UIButton){
        
        if let animation = appliedAnimation{
            switch animation {
            case .horizontalShaking:
                self.layer.add(horizontalShakingAnimation, forKey: "horizontalShaking")
            case .verticalBouncing:
                self.layer.add(verticalSpringAnimation, forKey: "bouncing")
            case .zoomIn:
                self.layer.add(zoomingWithTransparencyAnimation, forKey: "zoomIn")
            case .zoomOut:
                self.layer.add(zoomOutWithTransparencyAnimation, forKey: "zoomOut")
            case .springOut:
                 self.layer.add(springOutAnimation, forKey: "springOut")
            case .rotateBy45Degree:
                 self.imageLayer.add(rotateBy45Degree, forKey: "rotateBy45Degree")
            case .rotateBy90Degree:
                self.imageLayer.add(rotateBy90Degree, forKey: "rotateBy90Degree")
            case .rotateBy180Degree:
                self.imageLayer.add(rotateBy180Degree, forKey: "rotateBy180Degree")
            case .rotateBy360Degree:
                self.imageLayer.add(rotateBy360Degree, forKey: "rotateBy360Degree")
            }
        }
        buttonPressed?(sender)
    }
  
    
}

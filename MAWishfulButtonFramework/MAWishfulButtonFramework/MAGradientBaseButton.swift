//
//  MAGradientBaseButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/15.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MAGradientBaseButton: UIButton {
    
    let gradientLayer = CAGradientLayer()
    let gradientBorderLayer = CAGradientLayer()
    let titleTextLabel = MACompositeTitleLabel()
    
    public var appliedAnimation : AnimationSuit?
    
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
    
    //call back closure for handling event upon button tap
    public var buttonPressed: ((UIButton)->())?
    
    func addCustomLayers() {
        layer.masksToBounds = false
        
        self.layer.addSublayer(gradientBorderLayer)
        self.layer.insertSublayer(gradientLayer, below: self.titleLabel?.layer)
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
            case .rotateBy360Degree, .rotateBy180Degree, .rotateBy90Degree, .rotateBy45Degree:
                break
            }
        }
        buttonPressed?(sender)
    }
    
}

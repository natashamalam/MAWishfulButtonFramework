//
//  MACompositeBaseButton.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/14.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

@IBDesignable
public class MACompositeBaseButton: UIButton {
    
    let gradientLayer = CAGradientLayer()
    let imageLayer = MAImageLayer()
    let titleTextLabel = MACompositeTitleLabel()
    
    public var appliedAnimation : AnimationSuit?
    
    public var buttonPressed: ((UIButton)->())?
    
    @IBInspectable
    public var imagePosition: String = "left"{
        didSet{
            self.imageLayer.contentFrame = updateImageFrame()
        }
    }
    
    @IBInspectable
    public var contentImage : UIImage? {
        didSet{
            if let image = contentImage{
                self.imageLayer.contentImage = image
                self.imageLayer.contentFrame = updateImageFrame()
            }
        }
    }
    
    @IBInspectable
    public var frameOffset: CGFloat = 5.0{
        didSet{
            self.imageLayer.contentFrame = updateImageFrame()
            self.titleTextLabel.titleFrame = updateTitleFrame()
        }
    }
    
    @IBInspectable
    public var imageSizingFactor: CGFloat = 0.0{
        didSet{
            self.imageLayer.imageOffset = imageSizingFactor
            self.titleTextLabel.titleFrame = updateTitleFrame()
        }
    }
    
    @IBInspectable
    public var buttonTitle: String?{
        didSet{
            if let titleText = buttonTitle{
                self.titleTextLabel.titleFrame = updateTitleFrame()
                self.titleTextLabel.titleText = titleText
            }
        }
    }
    
    @IBInspectable
    public var textColor: UIColor = UIColor.white{
        didSet{
            self.titleTextLabel.titleTextColor = textColor
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
    public var cornerRadius: CGFloat = 0.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    private func addCustomLayers() {
        self.layer.insertSublayer(gradientLayer, below: self.titleLabel?.layer)
        self.addSubview(titleTextLabel)
        gradientLayer.addSublayer(imageLayer)
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
    
    func updateImageFrame()->CGRect{
        
        let contentFrame: CGRect
        
        let buttonLayerWidth = self.bounds.width
        let buttonLayerHeight = self.bounds.height
        let buttonLayerOriginX = self.bounds.origin.x
        let buttonLayerOriginY = self.bounds.origin.y
        
        if imagePosition.caseInsensitiveCompare("right") == .orderedSame{
            
            contentFrame = CGRect(x: buttonLayerWidth - buttonLayerWidth/4 - frameOffset,
                                  y: buttonLayerOriginY,
                                  width: buttonLayerWidth/4,
                                  height: buttonLayerHeight)
        }
        else if imagePosition.caseInsensitiveCompare("bottom") == .orderedSame{
            contentFrame = CGRect(x: buttonLayerOriginX,
                                  y: buttonLayerHeight/2,
                                  width: buttonLayerWidth,
                                  height: buttonLayerHeight/2 - frameOffset)
        }
        else if imagePosition.caseInsensitiveCompare("top") == .orderedSame{
            contentFrame = CGRect(x: self.bounds.origin.x,
                                  y: buttonLayerOriginY + frameOffset,
                                  width: buttonLayerWidth,
                                  height: buttonLayerHeight/2 - frameOffset)
        }
            
        else{
            contentFrame = CGRect(x: buttonLayerOriginX + frameOffset,
                                  y: buttonLayerOriginY ,
                                  width: buttonLayerWidth/4,
                                  height: buttonLayerHeight)
        }
        
        return contentFrame
        
    }
    
    
    func updateTitleFrame()->CGRect{
        
        let titleFrame: CGRect
        
        let buttonLabelWidth = self.bounds.width
        let buttonLabelHeight = self.bounds.height
        let buttonLabelOriginX = self.bounds.origin.x
        let buttonLabelOriginY = self.bounds.origin.y
        
        let imageLayerOriginX = self.imageLayer.contentFrame.origin.x
        let imageLayerOriginY = self.imageLayer.contentFrame.origin.y
        let imageLayerWidth = self.imageLayer.contentFrame.width
        let imageLayerHeight = self.imageLayer.contentFrame.height
        
        
        if imagePosition.caseInsensitiveCompare("right") == .orderedSame{
            //title will strt from origin
            titleFrame = CGRect(x: buttonLabelOriginX,
                                y: buttonLabelOriginY,
                                width: buttonLabelWidth - imageLayerWidth - frameOffset ,
                                height: buttonLabelHeight)
        }
            //title will start from origin
        else if imagePosition.caseInsensitiveCompare("bottom") == .orderedSame{
            titleFrame = CGRect(x: buttonLabelOriginX,
                                y: buttonLabelOriginY,
                                width: buttonLabelWidth,
                                height: buttonLabelHeight - imageLayerHeight - frameOffset)
        }
        else if imagePosition.caseInsensitiveCompare("top") == .orderedSame{
            titleFrame = CGRect(x: buttonLabelOriginX,
                                y: imageLayerOriginY + imageLayerHeight,
                                width: buttonLabelWidth,
                                height: buttonLabelHeight - frameOffset - imageLayerHeight)
        }
        else{
            let titleFrameOriginX =  imageLayerOriginX + imageLayerWidth
            
            titleFrame = CGRect(x: titleFrameOriginX,
                                y: buttonLabelOriginY,
                                width: (buttonLabelWidth - titleFrameOriginX),
                                height: buttonLabelHeight)
        }
        
        return titleFrame
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

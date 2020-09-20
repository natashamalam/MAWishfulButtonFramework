//
//  MACompositeTitleLabel.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/13.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

public class MACompositeTitleLabel: UILabel {
    
    public var titleFrame: CGRect = .zero{
        didSet{
            self.frame = titleFrame
            configureTitleProperties()
        }
    }
    public var titleText: String = "Button"{
        didSet{
            configureTitleProperties()
        }
    }
    public var titleFontSize: CGFloat = Defaults.fontSize{
        didSet{
            self.font = UIFont.systemFont(ofSize: titleFontSize)
        }
    }
    public var titleTextColor: UIColor = UIColor.systemBlue{
        didSet{
            self.textColor = titleTextColor
        }
    }
    
    public var titleAlignment: String = "center"{
        didSet{
            configureTitleProperties()
        }
    }
    
    func configureTitleProperties() {
        self.clipsToBounds = true
        self.text = titleText
        self.textAlignment = getAlignment()
        self.font = getLabelFont()
        self.textColor = titleTextColor
    }
    
    func getLabelFont()->UIFont{
        return UIFont.systemFont(ofSize: titleFontSize)
    }
    
    func getAlignment()->NSTextAlignment{
        if titleAlignment.caseInsensitiveCompare("left") == .orderedSame{
            return NSTextAlignment.left
        }
        if titleAlignment.caseInsensitiveCompare("right") == .orderedSame{
            return NSTextAlignment.right
        }
        if titleAlignment.caseInsensitiveCompare("justified") == .orderedSame{
            return NSTextAlignment.justified
        }
        else{
            return NSTextAlignment.center
        }
    }
}

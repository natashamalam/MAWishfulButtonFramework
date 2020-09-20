//
//  MAImageLayer.swift
//  MAWishfulButtonFramework
//
//  Created by Mahjabin Alam on 2020/09/08.
//  Copyright © 2020 RoleWithVirtualization. All rights reserved.
//

import UIKit

public class MAImageLayer: CAShapeLayer {
    
    public var contentFrame: CGRect = .zero{
        didSet{
             self.frame = configureImageFrame()
        }
    }
    
    public var contentImage : UIImage?{
        didSet{
            if let image = contentImage{
                self.contents = image.cgImage
            }
            else{
                self.contents = UIImage(named:"call_white")?.cgImage
            }
            self.contentsGravity = .resizeAspect
        }
    }
    
    public var imageOffset: CGFloat = 0{
        didSet{
            self.frame = configureImageFrame()
        }
    }
    
    public var imageBackgroundColor: UIColor = UIColor.clear{
        didSet{
            self.backgroundColor = imageBackgroundColor.cgColor
        }
    }
    
    func configureImageFrame()->CGRect{
        return self.contentFrame.insetBy(dx: imageOffset, dy: imageOffset)
    }

}

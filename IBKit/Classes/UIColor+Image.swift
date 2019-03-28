//
//  UIColor+Image.swift
//
//  Created by nya on 3/12/16.
//

import UIKit

public extension UIColor {
    
    var image: UIImage {
        return image()
    }
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            abort()
        }
        
        context.setFillColor(cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!;
    }
}

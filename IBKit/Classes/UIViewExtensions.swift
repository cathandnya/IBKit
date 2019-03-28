//
//  UIViewExtensions.swift
//
//  Created by nya on 2018/04/10.
//

import UIKit

@IBDesignable
public extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            return layer.borderColor.flatMap({ UIColor(cgColor: $0) })
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            return layer.shadowColor.flatMap({ UIColor(cgColor: $0) })
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable
    var transformX: CGFloat {
        get {
            return transform.tx
        }
        set {
            var t = transform
            t.tx = newValue
            transform = t
        }
    }

    @IBInspectable
    var transformY: CGFloat {
        get {
            return transform.ty
        }
        set {
            var t = transform
            t.ty = newValue
            transform = t
        }
    }
}

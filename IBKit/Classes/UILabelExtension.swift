//
//  UILabelExtension.swift
//
//  Created by nya on 2019/03/12.
//

import UIKit

@IBDesignable
public extension UILabel {
    
    @IBInspectable
    var kerning: CGFloat {
        get {
            guard let astr = attributedText else {
                return 0
            }
            return astr.attributes(at: 0, effectiveRange: nil)[.kern] as? CGFloat ?? 0
        }
        set {
            let attributedText = self.attributedText ?? NSAttributedString(string: text ?? "", attributes: nil)
            let attribString = NSMutableAttributedString(attributedString: attributedText)
            attribString.addAttributes([.kern: newValue], range: NSRange(location: 0, length: attributedText.length))
            self.attributedText = attribString
        }
    }
    
    @IBInspectable
    var lineHeight: CGFloat {
        get {
            guard let astr = attributedText else {
                return 0
            }
            return (astr.attributes(at: 0, effectiveRange: nil)[.paragraphStyle] as? NSParagraphStyle)?.minimumLineHeight ?? 0
        }
        set {
            let attributedText = self.attributedText ?? NSAttributedString(string: text ?? "", attributes: nil)
            let attribString = NSMutableAttributedString(attributedString: attributedText)
            attribString.addAttributes([.paragraphStyle: {
                let style = ((attribString.attributes(at: 0, effectiveRange: nil)[.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle) ?? NSMutableParagraphStyle()
                style.minimumLineHeight = newValue
                style.maximumLineHeight = newValue
                return style
            }()], range: NSRange(location: 0, length: attributedText.length))
            self.attributedText = attribString
        }
    }
}

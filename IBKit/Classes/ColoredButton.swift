//
//  ColoredButton.swift
//
//  Created by nya on 2018/02/26.
//

import UIKit

@IBDesignable
public class ColoredButton: UIButton {
    
    // 背景色
    @IBInspectable
    public var normalBackgroundColor: UIColor? {
        didSet {
            setBackgroundImage(normalBackgroundColor?.image, for: .normal)
        }
    }
    
    // ハイライト色
    @IBInspectable
    public var highlightedBackgroundColor: UIColor? {
        didSet {
            setBackgroundImage(highlightedBackgroundColor?.image, for: .highlighted)
        }
    }
    
    // disable色
    @IBInspectable
    public var disabledBackgroundColor: UIColor? {
        didSet {
            setBackgroundImage(disabledBackgroundColor?.image, for: .disabled)
        }
    }

    // selected色
    @IBInspectable
    public var selectedBackgroundColor: UIColor? {
        didSet {
            setBackgroundImage(selectedBackgroundColor?.image, for: .selected)
        }
    }

    @IBInspectable
    public var imageColor: UIColor? {
        didSet {
            guard let image = image(for: .normal) else {
                return
            }
            tintColor = imageColor
            setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        }
    }
    
    @IBInspectable
    public var kerning: CGFloat = 0.0 {
        didSet {
            var attr: [NSAttributedString.Key: Any] = [.kern: kerning]
            if let color = titleColor(for: .normal) {
                attr[.foregroundColor] = color
            }
            
            let attributedText = attributedTitle(for: .normal) ?? NSAttributedString(string: title(for: .normal) ?? "", attributes: nil)
            let attribString = NSMutableAttributedString(attributedString: attributedText)
            attribString.addAttributes(attr, range: NSRange(location: 0, length: attributedText.length))
            setAttributedTitle(attribString, for: .normal)
        }
    }
}

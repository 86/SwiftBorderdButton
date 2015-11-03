//
//  BorderdButton.swift
//  SwiftBorderdButton
//
//  Created by daisuke yamanaka on 2015/05/23.
//  Copyright (c) 2015年 triaedz. All rights reserved.
//

import UIKit

@IBDesignable

public class BorderdButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
                layer.cornerRadius = cornerRadius
                layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.CGColor
        }
    }
    
    @IBInspectable var borderColorDisable: UIColor?
    
    public override var enabled: Bool {
        didSet {
            if enabled {
                layer.borderColor = borderColor?.CGColor
                layer.opacity = 1.0
            } else {
                if (borderColorDisable != nil) {
                    layer.borderColor = borderColorDisable?.CGColor
                } else {
                    layer.borderColor = currentTitleColor.CGColor
                }
                layer.opacity = 0.4
            }
        }
    }
    
    var backgroundColorCached: UIColor?
    var backgroundColorHighlighted: UIColor? {
        return backgroundColor?.darkerColor()
    }
    
    public override var highlighted: Bool {
        didSet {
            guard highlighted != oldValue else { return }
            
            if highlighted {
                backgroundColorCached = backgroundColor
                backgroundColor = backgroundColorHighlighted
            } else {
                backgroundColor = backgroundColorCached
            }
        }
    }
    
}

extension UIColor {
    
    func lighterColor(brightness: CGFloat = 0.25) -> UIColor {
        return colorWithAppendingBrightness(1 + brightness)
    }
    
    func darkerColor(brightness: CGFloat = 0.25) -> UIColor {
        return colorWithAppendingBrightness(1 - brightness)
    }
    
    private func colorWithAppendingBrightness(aBrightness: CGFloat) -> UIColor {
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness * aBrightness, alpha: alpha)
        } else {
            return self
        }
    }
    
}

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
}

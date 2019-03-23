//
//  CustomButton.swift
//  Kavak
//
//  Created by Jose Chourio on 3/21/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet {
            updateBorderColor()
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet {
            updateBorderWidth()
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateBorderColor() {
        self.layer.borderColor = borderColor.cgColor
    }
    
    func updateBorderWidth() {
        self.layer.borderWidth = borderWidth
    }
    
    func updateCornerRadius() {
        self.layer.cornerRadius = cornerRadius
    }
    
    override var isEnabled: Bool {
        willSet {
            if newValue == false {
                self.setTitleColor(UIColor.gray, for: UIControl.State.disabled)
            } else {
                self.setTitleColor(UIColor.white, for: UIControl.State.normal)
            }
        }
    }
}

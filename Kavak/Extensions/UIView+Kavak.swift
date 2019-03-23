//
//  UIView+Kavak.swift
//  Kavak
//
//  Created by Jose Chourio on 3/22/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import UIKit

extension UIView {
    
    func addRoundedCorners(radius: CGFloat?) {
        if  radius != nil {
             self.layer.cornerRadius = radius!
        } else {
            self.layer.cornerRadius =  self.frame.size.width / 2
        }
        self.clipsToBounds = true
    }
}

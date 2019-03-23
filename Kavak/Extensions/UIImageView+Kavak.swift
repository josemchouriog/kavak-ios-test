//
//  UIImageView+Kavak.swift
//  Kavak
//
//  Created by Jose Chourio on 3/22/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func setImageFromUrl(string:String?, placeholderImageName: String?) {
        guard let placeHolder = placeholderImageName, let imageUrlString = string else {
           return
        }
        
        let url = URL(string: imageUrlString)
        if url != nil {
            self.sd_setImage(with: url, placeholderImage: UIImage(named: placeHolder), options: [], completed: nil)
        } else {
             self.image  = UIImage(named: placeHolder)
        }
        return
    }
}

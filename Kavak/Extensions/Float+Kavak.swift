//
//  Float+Kavak.swift
//  Kavak
//
//  Created by Jose Chourio on 3/23/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import Foundation

extension Float {
    
    func roundTo(places:Int, dividedBy: Int = 1) -> Float {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = places
        formatter.roundingMode = .floor
        return (formatter.string(from:NSNumber.init(value: self/Float(dividedBy)))! as NSString).floatValue
    }
}

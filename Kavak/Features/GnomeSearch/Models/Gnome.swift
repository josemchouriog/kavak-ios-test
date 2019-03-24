//
//  Gnome.swift
//  Kavak
//
//  Created by Jose Chourio on 3/19/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import Foundation

struct Gnome: Decodable {
    var id: Int?
    var name: String?
    var picture: String?
    var age: Int?
    var weight: Float?
    var height: Float?
    var hairColor: String?
    var professions: [String]?
    var friends: [String]?
    
    enum CodingKeys: String,CodingKey {
        case id
        case name
        case picture = "thumbnail"
        case age
        case weight
        case height
        case hairColor = "hair_color"
        case professions
        case friends
    }
}

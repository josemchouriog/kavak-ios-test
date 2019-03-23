//
//  GnomeSearchEndPoints.swift
//  Kavak
//
//  Created by Jose Chourio on 3/22/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import Foundation

class APIGnome {
    
    static func search(completion:@escaping ([Gnome]?,String?)->Void) {
        let url = URL(string: Constants.API.EndPointUrl)!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard error == nil else {
                if let error = error as NSError?, error.code == -1009 {
                    completion(nil, Constants.ErrorMessage.NoInternetConnection)
                } else {
                      completion(nil, error?.localizedDescription)
                }
                return
            }
            
            guard let data = data else {
                completion(nil, Constants.ErrorMessage.DefaultErrorMessage)
                return
            }
            
            let decoder = JSONDecoder()
            let resultsDictionary = try! decoder.decode([String:[Gnome]].self, from: data)
            
            if let gnomesArray = resultsDictionary[Constants.API.RequestResultDictionaryKey] as [Gnome]? {
                completion(gnomesArray, nil)
            }
        }
        task.resume()
    }
}

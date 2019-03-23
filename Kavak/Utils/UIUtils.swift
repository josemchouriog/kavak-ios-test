//
//  UIUtils.swift
//  Kavak
//
//  Created by Jose Chourio on 3/22/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import Foundation
import UIKit

class UIUtils {
    
    static func instantiateNewViewController <GenericTypeViewController: UIViewController>(withStoryBoardName: String, withStoryBoardID: String, destinationViewController: GenericTypeViewController.Type) -> GenericTypeViewController? {
        if let newViewController = UIStoryboard(name: withStoryBoardName, bundle: nil).instantiateViewController(withIdentifier: withStoryBoardID) as? GenericTypeViewController {
            return newViewController
        } else {
            return nil
        }
    }
}


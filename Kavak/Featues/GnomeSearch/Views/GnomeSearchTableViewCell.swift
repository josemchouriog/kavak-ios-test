//
//  GnomeSearchTableViewCell.swift
//  Kavak
//
//  Created by Jose Chourio on 3/19/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import UIKit

class GnomeSearchTableViewCell: UITableViewCell {
 
    //MARK: ViewController's IBOutlets
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    //MARK: TableViewCell's LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
       
    }
    
    //MARK: UI Configuration's Methods
    func setUI() {
        picture.addRoundedCorners(radius: nil)
    }
    
    func setCellData(array: [Gnome], row: Int) {
        lblName.text = array[row].name != nil ? array[row].name: ""
        if let age = array[row].age {
            lblAge.text = "\(String(describing: age)) \(Constants.ProfileMessage.Age)"
        } else {
            lblAge.text = "\(Constants.ProfileMessage.ZeroValue)"
        }
        picture.setImageFromUrl(string: array[row].picture, placeholderImageName: Constants.Icon.icPlaceHolderGnome)
    }
}

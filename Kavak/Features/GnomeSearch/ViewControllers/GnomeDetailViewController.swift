//
//  GnomeDetailViewController.swift
//  Kavak
//
//  Created by Jose Chourio on 3/21/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import UIKit

class GnomeDetailViewController: UIViewController {

    //MARK: ViewController's IBOutlets
    @IBOutlet weak var imgProfilePicture: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblWeightTitle: UILabel!
    @IBOutlet weak var lblWeightInfo: UILabel!
    @IBOutlet weak var lblHeightTitle: UILabel!
    @IBOutlet weak var lblHeightInfo: UILabel!
    @IBOutlet weak var lblHairTitle: UILabel!
    @IBOutlet weak var lblHairInfo: UILabel!
    @IBOutlet weak var lblProfessionsTitle: UILabel!
    @IBOutlet weak var lblProfessionsInfo: UILabel!
    @IBOutlet weak var lblFriendsTitle: UILabel!
    @IBOutlet weak var lblFriendsInfo: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    

    //MARK: ViewController's Variables
    var gnome: Gnome?

    var professionsTextHeight: CGFloat = 0
    var friendsTextHeight: CGFloat = 0
    var scrollViewStaticContentHeight: CGFloat = 385
    var scrollViewBounceHeight: CGFloat = 23
    
    //MARK: ViewController's Constants
    /**
        This constant is the sum of the leading and the trailing space to substract before calculating the height of the text of a label when its content is dynamic
     
        ## Important Note ##
        In this ViewController is being use to calculate the height of the text of the labels lblProfessionsTitle and lblProfessionsInfo which content is dynamic
    */
    let leadingAndTrailingSpaceToSubstract: CGFloat = 88
    
    //MARK: ViewController's LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUI()
        getProfessionsLabelContentHeight()
        getFriendsLabelContentHeight()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        changeScrollViewHeight()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changeContentViewHeightConstraint()
    }
    
    //MARK: UI Configuration's Methods
    func setUI() {
        setNavigationBar()
        configureProfilePicture()
        setUserData()
    }
    
    func setNavigationBar() {
        setNavigationBar(color: UIColor.white)
        setNavigationBar(title: Constants.ViewControllerNavigationTitle.GnomeDetail)
    }
    
    func setUserData() {
        imgProfilePicture.setImageFromUrl(string: gnome?.picture, placeholderImageName: Constants.Icon.icWelcomeGnome)
        
        lblName.text = gnome?.name != nil ? gnome?.name: "\(Constants.ProfileMessage.NoName)"
        
        if let age = gnome?.age {
            lblAge.text = "\(String(describing: age)) \(Constants.ProfileMessage.Age)"
        } else {
             lblAge.text = "\(Constants.ProfileMessage.NoAge)"
        }
        
        if let weight =  gnome?.weight {
            lblWeightInfo.text = "\(weight.roundTo(places: 2)) \(Constants.Measurement.Kilograms)"
        } else {
            lblWeightInfo.text = "\(Constants.ProfileMessage.ZeroValue) \(Constants.Measurement.Kilograms)"
        }
        
        if let height =  gnome?.height {
            if height < 100 {
                lblHeightInfo.text = "\(height.roundTo(places: 2, dividedBy: 100)) \(Constants.Measurement.Centimeters)"
            } else {
                lblHeightInfo.text = "\(height.roundTo(places: 2, dividedBy: 100)) \(Constants.Measurement.Meters)"
            }
           
        } else {
            lblWeightInfo.text = "\(Constants.ProfileMessage.ZeroValue) \(Constants.Measurement.Centimeters)"
        }
        
        lblHairInfo.text = gnome?.hairColor != nil ? gnome?.hairColor: "\(Constants.ProfileMessage.NoHairColor)"
       
        if let professions = gnome?.professions, !professions.isEmpty  {
            lblProfessionsInfo.text = professions.joined(separator:", ")
        } else {
            lblProfessionsInfo.text = "\(Constants.ProfileMessage.NoProfession)"
        }
        
        if let friends = gnome?.friends, !friends.isEmpty  {
            lblFriendsInfo.text = friends.joined(separator:", ")
        } else {
            lblFriendsInfo.text = "\(Constants.ProfileMessage.NoFriend)"
        }
    }
    
    func configureProfilePicture() {
        imgProfilePicture.addRoundedCorners(radius: nil)
    }
    
    func getProfessionsLabelContentHeight() {
        professionsTextHeight  = lblProfessionsInfo.text!.getHeight(withConstrainedWidth: UIScreen.main.bounds.width - leadingAndTrailingSpaceToSubstract, font: self.lblProfessionsInfo.font)
    }
    
    //MARK: ScrollView configuration's Methods
    func getFriendsLabelContentHeight() {
        friendsTextHeight  = lblFriendsInfo.text!.getHeight(withConstrainedWidth: UIScreen.main.bounds.width - leadingAndTrailingSpaceToSubstract, font: self.lblFriendsInfo.font)
    }
    
    func changeScrollViewHeight() {
        self.scrollView.contentSize.height = getScrollViewContentHeight()
    }
    
    /**
        This method adjusts the height of the ContentView inside of the ScrollView with the total height of the ScrollView including the bounce defined.
     
        ## Important Note ##
        It is called after the ScrollView's height is updated.
    */
    func changeContentViewHeightConstraint() {
        self.contentViewHeightConstraint.constant = scrollView.contentSize.height -  scrollView.bounds.size.height
    }
    
    /**
        This method allows to get the proper height that the ScrollView should have in order to fit accordingly the whole content of the Profile Info Section.
     
        ## Important Note ##
        It adds up the static content, the dynamic content and the bounce height defined.
    */
    func getScrollViewContentHeight() -> CGFloat {
        return scrollViewStaticContentHeight + getScrollViewDynamicContentHeight() + scrollViewBounceHeight
    }
    
    func getScrollViewDynamicContentHeight() -> CGFloat {
        return professionsTextHeight + friendsTextHeight
    }
}

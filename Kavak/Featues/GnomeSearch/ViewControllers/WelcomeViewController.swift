//
//  WelcomeViewController.swift
//  Kavak
//
//  Created by Jose Chourio on 3/21/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    //MARK: ViewController's Variables
    var gnomesArray = [Gnome]()
    
    //MARK: ViewController's LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: UI Configuration's Methods
    func setUI() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func gotoGnomesSearchTableViewController() {
        let newViewController = UIUtils.instantiateNewViewController(withStoryBoardName: Constants.StoryBoard.Main, withStoryBoardID: Constants.ViewController.GnomeSearchTableViewController, destinationViewController: GnomeSearchTableViewController.self)
        
        if newViewController != nil {
            newViewController?.gnomesArray = self.gnomesArray
            navigationController?.pushViewController(newViewController!, animated: true)
        }
    }
    
    //MARK: IBAction's Methods
    @IBAction func btnGetGnomesInformationTapped(_ sender: Any) {
        showProgressHud()
        APIGnome.search { (gnomesResultsArray, errorMessage) in
            DispatchQueue.main.async { [weak self] in
                self!.hideProgressHud()
                guard errorMessage == nil else {
                    self!.showAlert(withTitle: Constants.ErrorMessage.Error, withMessage: errorMessage!, withButtonTitle: Constants.ButtonTitle.Ok)
                    return
                }
                
                if let gnomesSearchArray = gnomesResultsArray, !gnomesSearchArray.isEmpty {
                    self!.gnomesArray = gnomesSearchArray.sorted(by: { $0.name! < $1.name!})
                    self!.gotoGnomesSearchTableViewController()
                
                } else {
                    self!.showAlert(withTitle: Constants.ErrorMessage.Error, withMessage: errorMessage!, withButtonTitle: Constants.ErrorMessage.Error)
                }
            }
        }
    }
}

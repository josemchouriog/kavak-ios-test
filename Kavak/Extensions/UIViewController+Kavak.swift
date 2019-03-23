//
//  UIViewController+Kavak.swift
//  Kavak
//
//  Created by Jose Chourio on 3/21/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {
    
    //MARK: Messages Display's Methods
    func showAlert(withTitle: String, withMessage: String, withButtonTitle: String) {
        let alert = UIAlertController(title: withTitle, message: withMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: withButtonTitle, style: .default) { action in
            
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Progress Indicator's Methods
    func showProgressHud() {
        SVProgressHUD.setDefaultAnimationType(.flat)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.show()
    }
    
    func hideProgressHud() {
        SVProgressHUD.dismiss()
    }
    
    //MARK: NavigationBar's Methods
    func setNavigationBar(title: String?, with color: UIColor = UIColor.white) {
        guard let navigationBarTitle = title, !navigationBarTitle.isEmpty else { return }
        self.setNavigationBar(color: color)
        self.setNavigationBar(title: navigationBarTitle)
        self.setNavigationBar(fontName: Constants.Letter.SFProTextBold, fontColor: UIColor.black, fontSize: 16)
    }
    
    func setNavigationBar(fontName:String, fontColor: UIColor, fontSize: CGFloat) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: fontName, size: fontSize)!,NSAttributedString.Key.foregroundColor: fontColor]
    }
    
    func setNavigationBar(title: String?) {
        guard let navigationBarTitle = title, !navigationBarTitle.isEmpty else { return }
        self.title = title
    }
    
    func setNavigationBar(color: UIColor) {
        self.navigationController?.navigationBar.barTintColor  = color
    }
    
    func setBackButtonTitle() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Constants.Letter.SFProDisplayLight, size: 16)!,NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: Constants.ButtonTitle.Back, style: .plain, target: nil, action: nil)
    }
}

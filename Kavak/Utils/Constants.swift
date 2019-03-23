//
//  Constants.swift
//  Kavak
//
//  Created by Jose Chourio on 3/22/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import Foundation

struct Constants {
    
    struct ViewController {
        static let WelcomeViewController = "WelcomeViewController"
        static let GnomeSearchTableViewController = "GnomeSearchTableViewController"
        static let GnomeDetailViewController = "GnomeDetailViewController"
    }
    
    struct ViewControllerNavigationTitle {
        static let  GnomeSearch = "Gnome Search"
        static let  GnomeDetail = "Gnome Detail"
    }
    
    struct StoryBoard {
        static let Main = "Main"
    }
    
    struct TableViewCell {
        static let GnomeSearchTableViewCell = "GnomeSearchTableViewCell"
    }
    
    struct Icon {
        static let icPlaceHolderGnome = "icPlaceHolderGnome"
        static let icWelcomeGnome = "icWelcomeGnome"
    }
    
    struct Letter {
        static let SFProDisplayLight = "SFProDisplay-Light"
        static let SFProTextBold = "SFProText-Bold"
        static let LettersArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    }
    
    struct ErrorMessage {
        static let Error = "Error"
        static let DefaultErrorMessage = "Something went wrong. Please try again."
        static let NoInternetConnection = "Please check your internet connection."
    }
    
    struct ButtonTitle {
        static let Back = "Back"
        static let Ok = "Ok"
        static let Search = "Search"
    }
    
    struct API {
        static let EndPointUrl = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
        static let RequestResultDictionaryKey = "Brastlewark"
    }
    
    
    
}

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
    
    struct Measurement {
        static let Kilograms = "kg"
        static let Centimeters = "cm"
        static let Meters = "mt"
    }
    
    struct ProfileMessage {
        static let NoName = "It seems that this gnome does not have a name"
        static let NoAge = "This gnome does not want us to know its age"
        static let NoHairColor = "This gnome does not want us to know its hair color"
        static let NoProfession = "This gnome is not working right now, but is trying hard to get a job"
        static let NoFriend = "This gnome does not seem very sociable because it has no friends"
        static let ZeroValue = "0"
        static let Age = "years old"
    }
}

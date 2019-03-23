//
//  GnomeSearchViewController.swift
//  Kavak
//
//  Created by Jose Chourio on 3/19/19.
//  Copyright © 2019 Jose Chourio. All rights reserved.
//

import UIKit
import SDWebImage

class GnomeSearchTableViewController: UITableViewController {
    
    //MARK: ViewController's Variables
    
    /**
     This array has all the data brought from the inital request. It is sorted by name asc
     
     ## Important Note ##
     It is used to show the data when the user is searching(filtering) the information  by a specific term entered on the searchController
     */
    var gnomesArray = [Gnome]()
    
    /**
     This is an array of arrays. Each array contains an array of gnomes indexed by the first letter of the name.
     
     ## Important Note ##
     It is used to show the data when the user is not searching(filtering) and with the section titles shown in the right side of the TableView. Each array corresponds to a section defined on the lettersArray
     */
    var gnomesIndexedByNameArray = [[Gnome]]()
    
    /**
     This is an array that contains the results produced by an user search with a specific term entered on the searchController.
     */
    var userSearchResultsArray = [Gnome]()
    var gnomesNamesInitialLettersArray = [String]()
   
    var userSearchReturnedResults = false
    var selectedGnome: Gnome?
    
    //MARK: ViewController's LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserData()
        setUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setBackButtonTitle()
    }

    //MARK: UI Configuration's Methods
    func setUI() {
        setNavigationBar()
        createSearchController()
        configureTableView()
    }
    
    func setNavigationBar() {
        setNavigationBar(title: Constants.ViewControllerNavigationTitle.GnomeSearch)
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: Constants.TableViewCell.GnomeSearchTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.TableViewCell.GnomeSearchTableViewCell)
        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }
    
    func createSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Constants.ButtonTitle.Search
        navigationItem.searchController = searchController
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        if userSearchReturnedResults {
            return 1
        } else {
            return  gnomesIndexedByNameArray.count
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if userSearchReturnedResults {
            return userSearchResultsArray.count
        } else {
            let gnomesArrays = gnomesIndexedByNameArray[section]
            return gnomesArrays.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCell.GnomeSearchTableViewCell, for: indexPath) as! GnomeSearchTableViewCell
        var array = [Gnome]()
        
        if userSearchReturnedResults {
            array =  userSearchResultsArray
        } else {
            array = gnomesIndexedByNameArray[indexPath.section]
        }
        
        cell.setCellData(array: array, row: indexPath.row)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if userSearchReturnedResults {
            return nil
        } else {
             return gnomesNamesInitialLettersArray[section]
        }
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if userSearchReturnedResults {
            return nil
        } else {
           return gnomesNamesInitialLettersArray
        }
    }
    
    // MARK: - TableViews's Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if userSearchReturnedResults {
            selectedGnome =  userSearchResultsArray[indexPath.row]
        } else {
           let gnomesArray = gnomesIndexedByNameArray[indexPath.section]
           selectedGnome = gnomesArray[indexPath.row]
        }
        
        gotoGnomeDetailViewController()
    }
    
    override  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.lightGray
    }
    
    
    // MARK: - General Purpose's Methods
    func setUserData() {
        var gnomesTemporalArray = [Gnome]()
        
        for letter in Constants.Letter.LettersArray {
            gnomesTemporalArray = gnomesArray.filter {$0.name!.first == letter.first}
            if !gnomesTemporalArray.isEmpty  {
                gnomesIndexedByNameArray.append(gnomesTemporalArray)
                gnomesNamesInitialLettersArray.append(letter)
            }
        }
        
        gnomesNamesInitialLettersArray = gnomesNamesInitialLettersArray.sorted()
    }
    
    func gotoGnomeDetailViewController() {
        let newViewController = UIUtils.instantiateNewViewController(withStoryBoardName: Constants.StoryBoard.Main, withStoryBoardID: Constants.ViewController.GnomeDetailViewController, destinationViewController: GnomeDetailViewController.self)
        
        if newViewController != nil {
            newViewController?.gnome = selectedGnome
            navigationController?.pushViewController(newViewController!, animated: true)
        }
    }
    
    func filterData(with searchText: String) {
        var filteredDataArray = [Gnome]()
        
        filteredDataArray =  gnomesArray.filter { $0.name!.lowercased().contains(searchText.lowercased()) }
        if filteredDataArray.count != 0 {
            userSearchResultsArray = filteredDataArray.sorted(by: {$0.name! < $1.name!})
            userSearchReturnedResults = true
        } else {
            userSearchResultsArray = filteredDataArray
            userSearchReturnedResults = true
        }
    }
}

//MARK: UISearchResultsUpdate's Methods
extension GnomeSearchTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            guard !searchText.isEmpty else {
                userSearchReturnedResults = false
                tableView.reloadData()
                return
            }
            
            filterData(with: searchText)
            
            // Reload the table view with the search results data.
            tableView.reloadData()
            // Moves the ScrollView to the first item
            if userSearchResultsArray.count > 0 {
                let indexPath = IndexPath(row: 0, section: 0)
                tableView.scrollToRow(at: indexPath, at: .top, animated: false)
            }
        }
    }
}

//MARK: UISearchResultsUpdatingDelegate' Methods
extension GnomeSearchTableViewController: UISearchControllerDelegate {
    
    func willDismissSearchController(_ searchController: UISearchController) {
        userSearchReturnedResults = false
        tableView.reloadData()
    }
}

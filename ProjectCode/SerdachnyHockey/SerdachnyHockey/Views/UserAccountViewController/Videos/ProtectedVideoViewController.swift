/*

 Program Name: ProtectedVideoViewController.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               The purpose of this program is to set up navigation style.

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit


class ProtectedVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
    }
    
    func setupNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchBar.searchTextField.backgroundColor = .white
    }
    


}

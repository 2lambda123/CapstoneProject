/*

 Program Name: AboutViewController.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               1. The purpose of this program is to store about info data into array and display into TableView.
               2. Pass table cell data to another page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let aboutElements = ["Rate on App Store", "What's Fresh", "Report", "Version Update"]
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutElements.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aboutItemCell") as! AboutTableViewCell
        cell.aboutLabel.text = aboutElements[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 1)
        {
            let storyboard = UIStoryboard(name:"UserAccount",bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "FreshViewController") as! WhatsFreshViewController
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
        if(indexPath.row == 2)
        {
            let storyboard = UIStoryboard(name:"UserAccount",bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "ReportViewController") as! ReportTableViewController
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
}
   



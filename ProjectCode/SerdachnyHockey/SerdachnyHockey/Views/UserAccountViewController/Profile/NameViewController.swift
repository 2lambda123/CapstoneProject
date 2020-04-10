/*

 Program Name: EmailViewController.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               The purpose of this program is to set up Name button navigation style.

 Copyright © 2020 Prime Software. All rights reserved.

*/


import UIKit

/*
   Set up name navigation as animated
*/
class NameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(changeName))
        self.navigationItem.rightBarButtonItem = actionButton
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc func changeName(){
        print("Update Name")
    }
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    

}

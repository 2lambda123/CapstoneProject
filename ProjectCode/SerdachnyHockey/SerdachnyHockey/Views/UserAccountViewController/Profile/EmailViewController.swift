/*

 Program Name: EmailViewController.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               The purpose of this program is to set up email button navigation style.

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

/*
   Set up email navigation as animated
*/
class EmailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(displayEmail))
        self.navigationItem.rightBarButtonItem = actionButton
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc func displayEmail(){
        print("Email displayed")
    }
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }

}

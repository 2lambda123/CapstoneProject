/*

 Program Name: SettingTableViewController.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               The purpose of this program is to comfirm sign out routine,
               afterwards, it will be redirect to root view which is AccountViewController.

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import AWSMobileClient
import AWSAuthUI
import AWSAuthCore

class SettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func btnLogout(_ sender: Any) {
        
        /*
        AWSMobileClient.default().initialize { (userState, error) in
            if let userState = userState {
                print("UserState: \(userState.rawValue)")
            } else if let error = error {
                print("error: \(error.localizedDescription)")
            }
        }
        */
        
        AWSMobileClient.default().signOut()
            
        
        let storyboard = UIStoryboard(name:"UserAccount",bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! AccountViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        

            
        
        
    }
    
}

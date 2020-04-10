/*

 Program Name: HomescreenViewController.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               1. The purpose of this program is to store account data into array and display into TableView
               2. Pass table cell data to another ViewController

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class MyAccountViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var accountList: UITableView!
    
    
    let accountLabel = ["Protected","Public","New Video"]
    
    let accountImage = [UIImage(named:"3skills"),UIImage(named:"bodychecking"),UIImage(named:"defencemen")]
    
    override func viewDidLoad() {
        accountList.delegate = self
        accountList.dataSource = self
        super.viewDidLoad()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return accountLabel.count
        }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let accountCell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! MyAccountListTableViewCell
            accountCell.accountLabel.text = accountLabel[indexPath.row]
            
            accountCell.accountImage.image = accountImage[indexPath.row]
        
            return accountCell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 0){
            let storyboard = UIStoryboard(name:"UserAccount",bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "ProtectdViewController") as! ProtectedVideoViewController
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        if(indexPath.row == 1)
        {
            let storyboard = UIStoryboard(name:"UserAccount",bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "PublicViewController") as! PublicVideoViewController
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        if(indexPath.row == 2)
        {
            let storyboard = UIStoryboard(name:"UserAccount",bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "NewVideoViewController") as! NewVideoViewController
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }

}


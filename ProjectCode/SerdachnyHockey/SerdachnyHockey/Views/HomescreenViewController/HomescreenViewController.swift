/*
 Program Name: HomescreenViewController.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               1. The purpose of this program is to store program data into array and display into TableView
               2. Pass table cell data and redirect to webpage

 Copyright © 2020 Prime Software. All rights reserved.

*/

import Foundation
import UIKit
import SafariServices
import AVKit
import AWSMobileClient
import AWSS3

/*
   Store data into program and store array

   Extentsion UITableViewDataSource, UITableViewDelegate: pass data from table cell to
                                                          detail page with identifier
*/
class HomescreenViewController: UIViewController{
    @IBOutlet weak var programTableView: UITableView!
    @IBOutlet weak var storeTableView: UITableView!

    @IBOutlet weak var imageView: UIImageView!

    let s3Bucket = "serdachnybucket130806-amplify"
    let s3Key = "Homescreen.png"
    var image = UIImage(){
        didSet{
            updateUI()
        }
    }

    var programs: [Program] = []
    var stores: [Store] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        programs = createArray()
        stores = createArray()

        //AWS Download Image
        //TODO: Create an instance of TransferUtility
        let transferUtility = AWSS3TransferUtility.default()

        //TODO: Create a expression instance to update progress
        let expression = AWSS3TransferUtilityDownloadExpression()

        //TODO: Request to download the data from S3
        transferUtility.downloadData(fromBucket: s3Bucket, key: s3Key, expression: expression) { (task, url, data, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async (execute: {
                self.image = UIImage(data: data!)!
            })
        }
    }

    func updateUI(){
        imageView.image = image
    }


    func createArray() -> [Program]{

        var tempProgram: [Program] = []

        let program1 = Program(image: #imageLiteral(resourceName: "excellence"), title: "3-DAYS SKATING & SKILLS", programUrl:"https://www.elitepowerskating.com/programs/3-day/")

        let program2 = Program(image: #imageLiteral(resourceName: "power"), title: "POWER SKATING & SKILLS",programUrl:"https://www.elitepowerskating.com/programs/power-skating-and-skills/")

        let program3 = Program(image: #imageLiteral(resourceName: "3skills"), title: "PROGRAM OF EXCELLENCE",programUrl:"https://www.elitepowerskating.com/programs/program-of-excellence/")

        let program4 = Program(image:#imageLiteral(resourceName: "shootgoal"), title:"SHOOTING & GOAL SCORING",programUrl:"https://www.elitepowerskating.com/programs/shooting-and-goal-scoring/")

        tempProgram.append(program1)
        tempProgram.append(program2)
        tempProgram.append(program3)
        tempProgram.append(program4)

        return tempProgram

    }

    func createArray() -> [Store]{

        var tempStore: [Store] = []

        let store1 = Store(storeImage: #imageLiteral(resourceName: "training"), storeTitle: "TRAINING", storeUrl: "https://www.elitepowerskating.com/store/store_buy.asp#")
        let store2 = Store(storeImage: #imageLiteral(resourceName: "clothes"), storeTitle: "CLOTHING", storeUrl: "https://www.elitepowerskating.com/store/store_buy.asp#")
        let store3 = Store(storeImage: #imageLiteral(resourceName: "hockey-dvd"), storeTitle: "DVDS", storeUrl: "https://www.elitepowerskating.com/store/store_buy.asp#")
        let store4 = Store(storeImage:#imageLiteral(resourceName: "sale"), storeTitle:"PROMOTIONAL", storeUrl: "https://www.elitepowerskating.com/store/store_buy.asp#")

        tempStore.append(store1)
        tempStore.append(store2)
        tempStore.append(store3)
        tempStore.append(store4)

        return tempStore

    }

}

extension HomescreenViewController:UITableViewDataSource,UITableViewDelegate{

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    if(tableView == programTableView)
    {
        return programs.count
    }
    else
    {
        return stores.count
    }
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    if(tableView == programTableView)
    {
        let program = programs[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgramItem") as! ProgramCell

        cell.setProgram(program: program)

        return cell
    }
    else
    {
       let store = stores[indexPath.row]

       let storeCell = tableView.dequeueReusableCell(withIdentifier: "StoreItem") as! StoreCell

       storeCell.setStore(store: store)

       return storeCell
    }


}

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView == storeTableView) {
            let url = URL(string: self.stores[indexPath.row].storeUrl)

            let SafariVC = SFSafariViewController(url: url!)
            present(SafariVC, animated: true, completion: nil)

        }
        if(tableView == programTableView)
        {
            let url = URL(string: self.programs[indexPath.row].programUrl)

            let SafariVC = SFSafariViewController(url: url!)
            present(SafariVC, animated: true, completion: nil)
        }
    }

}


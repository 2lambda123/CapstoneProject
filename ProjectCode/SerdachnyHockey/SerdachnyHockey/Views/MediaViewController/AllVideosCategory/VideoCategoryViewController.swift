/*

 Program Name: VideosCategoryViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. The purpose of this program is to store video data into array and display into TableView
               2. Pass table cell data to the detail page
               3. Search Filter Function

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class VideoCategoryViewController: UIViewController {

    // outlets
    @IBOutlet weak var forwardTableView: UITableView!
    @IBOutlet weak var backwardTableView: UITableView!
    @IBOutlet weak var stickhandlingTableView: UITableView!
    @IBOutlet weak var movesTableView: UITableView!
    @IBOutlet weak var atHomeTrainingTableView: UITableView!
    
    var forwardItems: [ForwardItems] = []
    var backwardItems: [BackwardItems] = []
    var stickhandlingItems: [StickhandlingItems] = []
    var movesItems: [MovesItems] = []
    var atHomeTrainingItems: [AtHomeTrainingItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // stores video info into At Home Training array
        forwardItems = forwardList()
        backwardItems = backwardList()
        stickhandlingItems = stickhandlingList()
        movesItems = movesList()
        atHomeTrainingItems = atHomeTrainingList()
        
        // customize the Back item
        setCustomBackImage()
        
    }
    
    func setCustomBackImage() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    func forwardList() -> [ForwardItems] {
        
        var tempForwardItems: [ForwardItems] = []
        
        let item1 = ForwardItems(image: #imageLiteral(resourceName: "free-videos6"), title: "Acceleration In Motion", description: "Accelerating well in motion calls for quick feet with rapid powerful and long running steps. If you want to accelerate quickly, you must maintain a low center of gravity and also keep your skates in a powerful position directly below your hips.", url: "tAbYp4eaJCw")
        
        let item2 = ForwardItems(image: #imageLiteral(resourceName: "free-videos2"), title: "Crossover Start", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your body weight through. Each push extending through your hip knee and ankle.", url: "3qhu6JECtSc")
        
        let item3 = ForwardItems(image: #imageLiteral(resourceName: "free-videos1"), title: "Explosive Starts Stick Position", description: "Forward arm drive happens with the stick on the ice arms bent to 90 degrees in full extension. All the momentum carries forward where to get Fiona to go to two hands. Two ends are going to be on the stick arms.", url: "VgBFnhVz6zM")
        
        
        tempForwardItems.append(item1)
        tempForwardItems.append(item2)
        tempForwardItems.append(item3)
        
        return tempForwardItems
    }
    
    func backwardList() -> [BackwardItems] {
        
        var tempBackwardItems: [BackwardItems] = []
        
        let item1 = BackwardItems(image: #imageLiteral(resourceName: "free-videos6"), title: "Backwards Hockey Stride", description: "Accelerating well in motion calls for quick feet with rapid powerful and long running steps. If you want to accelerate quickly, you must maintain a low center of gravity and also keep your skates in a powerful position directly below your hips.", url: "WU8gzDA-eAU")
        
        let item2 = BackwardItems(image: #imageLiteral(resourceName: "free-videos2"), title: "Power Skating Backwards Starts", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your body weight through. Each push extending through your hip knee and ankle.", url: "RrgKXvBXvnA")
        
        tempBackwardItems.append(item1)
        tempBackwardItems.append(item2)
        
        return tempBackwardItems
    }
    
    func stickhandlingList() -> [StickhandlingItems] {
        
        var tempStickhandlingItems: [StickhandlingItems] = []
        
        let item1 = StickhandlingItems(image: #imageLiteral(resourceName: "free-videos1"), title: "Stickhandling Category 1", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your ", url: "tAbYp4eaJCw")
        
        let item2 = StickhandlingItems(image: #imageLiteral(resourceName: "free-videos"), title: "Stickhandling Category 2", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your ", url: "3qhu6JECtSc")
        
        tempStickhandlingItems.append(item1)
        tempStickhandlingItems.append(item2)
        
        return tempStickhandlingItems
    }
    
    func movesList() -> [MovesItems] {
        
        var tempMovesItems: [MovesItems] = []
        
        let item1 = MovesItems(image: #imageLiteral(resourceName: "free-videos"), title: "Moves Category 1", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your ", url: "tAbYp4eaJCw")
        
        let item2 = MovesItems(image: #imageLiteral(resourceName: "img-video-player-1"), title: "Moves Category 2", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your ", url: "3qhu6JECtSc")
        
        tempMovesItems.append(item1)
        tempMovesItems.append(item2)
        
        return tempMovesItems
    }
    
    func atHomeTrainingList() -> [AtHomeTrainingItems] {
        
        var tempAtHomeTrainingItems: [AtHomeTrainingItems] = []
        
        let item1 = AtHomeTrainingItems(image: #imageLiteral(resourceName: "free-videos"), title: "At Home Training 1", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your ", url: "tAbYp4eaJCw")
        
        let item2 = AtHomeTrainingItems(image: #imageLiteral(resourceName: "img-video-player-1"), title: "At Home Training 2", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your ", url: "3qhu6JECtSc")
        
        tempAtHomeTrainingItems.append(item1)
        tempAtHomeTrainingItems.append(item2)
        
        return tempAtHomeTrainingItems
    }
    
    // passing related video info to detail page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forwardCategory" {
            let destVC = segue.destination as! ForwardCategoryViewController
            destVC.video = sender as? ForwardItems
        }
        else if segue.identifier == "backwardCategory" {
            let destVC = segue.destination as! BackwardCategoryViewController
            destVC.video = sender as? BackwardItems
        }
        else if segue.identifier == "stickhandlingCategory" {
            let destVC = segue.destination as! StickhandlingViewController
            destVC.video = sender as? StickhandlingItems
        }
        else if segue.identifier == "movesCategory" {
            let destVC = segue.destination as! MovesCategoryViewController
            destVC.video = sender as? MovesItems
        }
        else if segue.identifier == "atHomeTrainingCategory" {
            let destVC = segue.destination as! AtHomeTrainingCategoryViewController
            destVC.video = sender as? AtHomeTrainingItems
        }
    }

}

// functions to display videos list in UI table
extension VideoCategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    // count the numbers of rows that array has
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == forwardTableView {
            return forwardItems.count
        }
        else if tableView == backwardTableView {
            return backwardItems.count
        }
        else if tableView == stickhandlingTableView {
            return stickhandlingItems.count
        }
        else if tableView == movesTableView {
            return movesItems.count
        }
        else if tableView == atHomeTrainingTableView {
            return atHomeTrainingItems.count
        }
        else {
            return forwardItems.count
        }
    }
    
    // display each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == forwardTableView {
            let forwardItem = forwardItems[indexPath.row]
            let forwardCell = tableView.dequeueReusableCell(withIdentifier: "forwardCell") as! ForwardTable
            
            forwardCell.setForwardVideo(video: forwardItem)
            
            return forwardCell
        }
        else if tableView == backwardTableView {
            let backwardItem = backwardItems[indexPath.row]
            let backwardCell = tableView.dequeueReusableCell(withIdentifier: "backwardCell") as! BackwardTable
            
            backwardCell.setBackwardVideo(video: backwardItem)
            return backwardCell
        }
        else if tableView == stickhandlingTableView {
            let stickhandlingItem = stickhandlingItems[indexPath.row]
            let stickhandlingCell = tableView.dequeueReusableCell(withIdentifier: "stickhandlingCell") as! StickhandlingTable
            
            stickhandlingCell.setStickhandlingVideo(video: stickhandlingItem)
            return stickhandlingCell
        }
        else if tableView == movesTableView {
            let movesItem = movesItems[indexPath.row]
            let movesCell = tableView.dequeueReusableCell(withIdentifier: "movesCell") as! MovesTable
            
            movesCell.setMovesVideo(video: movesItem)
            return movesCell
        }
        else {
            let atHomeTrainingItem = atHomeTrainingItems[indexPath.row]
            let atHomeTrainingCell = tableView.dequeueReusableCell(withIdentifier: "atHomeTrainingCell") as! AtHomeTrainingTable
            atHomeTrainingCell.setAtHomeTrainingVideo(video: atHomeTrainingItem)
            return atHomeTrainingCell
        }
    }
    
    // redirect to other view controller page with the identifier of segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == forwardTableView {
            let video = forwardItems[indexPath.row]
            performSegue(withIdentifier: "forwardCategory", sender: video)
        }
        else if tableView == backwardTableView {
            let video = backwardItems[indexPath.row]
            performSegue(withIdentifier: "backwardCategory", sender: video)
        }
        else if tableView == stickhandlingTableView {
            let video = stickhandlingItems[indexPath.row]
            performSegue(withIdentifier: "stickhandlingCategory", sender: video)
        }
        else if tableView == movesTableView {
            let video = movesItems[indexPath.row]
            performSegue(withIdentifier: "movesCategory", sender: video)
        }
        else {
            let video = atHomeTrainingItems[indexPath.row]
            performSegue(withIdentifier: "atHomeTrainingCategory", sender: video)
        }
    }
}



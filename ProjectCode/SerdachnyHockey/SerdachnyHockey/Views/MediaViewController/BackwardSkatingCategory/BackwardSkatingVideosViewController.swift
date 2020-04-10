/*

 Program Name: BackwardSkatingVideosViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. The purpose of this program is to store backward skating video data into array and display into TableView
               2. Pass table cell data to the detail page
               3. Search Filter Function

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit


/*
   Store data into backaward skating video array
   
   Extension UISearchBarDelegate, UISearchResultsUpdating: read and update filter input
   Extentsion UITableViewDataSource, UITableViewDelegate: pass data from table cell to
                                                          detail page with identifier
*/
class BackwardSkatingVideosViewController: UIViewController {

    // outlets
    @IBOutlet weak var backwardSkatingVideosTable: UITableView!
    
    var filteredBackwardSkatingVideos: [BackwardSkatingVideosItems] = []
    var backwardSkatingVideosItems: [BackwardSkatingVideosItems] = []
    
    
    lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        
        sc.obscuresBackgroundDuringPresentation = false
        sc.searchBar.placeholder = "Search video..."
        sc.searchBar.sizeToFit()
        sc.searchBar.searchBarStyle = .prominent
        sc.searchBar.delegate = self
        
        sc.searchBar.searchTextField.backgroundColor = .white
        
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backwardSkatingVideosItems = backwardSkatingVideosList()
        // Move search filter into navigation bar
        setupNavBar()
    }
    
    func setupNavBar() {
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // Read input text from filter
    func filteredContentForSearchText(searchText: String) {
        filteredBackwardSkatingVideos = backwardSkatingVideosItems.filter({(backwardSkatingVideo: BackwardSkatingVideosItems) -> Bool in
            
            if !isSearchBarEmpty() {
                return backwardSkatingVideo.title.lowercased().contains(searchText.lowercased())
            } else {
                return false
            }
        })
        
        // If input is cancelled, data shows
        backwardSkatingVideosTable.reloadData()
    }
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarIsFiltering = searchController.searchBar.text != ""
        return searchController.isActive && (!isSearchBarEmpty() || searchBarIsFiltering)
    }
    
    func backwardSkatingVideosList() -> [BackwardSkatingVideosItems] {
        
        var tempBackwardSkatingVideoItems: [BackwardSkatingVideosItems] = []
        
        let item1 = BackwardSkatingVideosItems(image: #imageLiteral(resourceName: "free-videos8"), title: "Backwards Hockey Stride", description: "Accelerating well in motion calls for quick feet with rapid powerful and long running steps. If you want to accelerate quickly, you must maintain a low center of gravity and also keep your skates in a powerful position directly below your hips.", url: "WU8gzDA-eAU")
        
        let item2 = BackwardSkatingVideosItems(image: #imageLiteral(resourceName: "free-videos6"), title: "Power Skating Backwards Starts", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your body weight through. Each push extending through your hip knee and ankle.", url: "RrgKXvBXvnA")
        
        let item3 = BackwardSkatingVideosItems(image: #imageLiteral(resourceName: "free-videos1"), title: "Backwards Circle Skate", description: "Forward arm drive happens with the stick on the ice arms bent to 90 degrees in full extension. All the momentum carries forward where to get Fiona to go to two hands. Two ends are going to be on the stick arms.", url: "YavnQGizIs0")
        
        tempBackwardSkatingVideoItems.append(item1)
        tempBackwardSkatingVideoItems.append(item2)
        tempBackwardSkatingVideoItems.append(item3)
        
        return tempBackwardSkatingVideoItems
    }
    
    // passing related video info to detail page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backwardSkatingDetail" {
            let destVC = segue.destination as! BackwardSkatingVideosDetailViewController
            destVC.video = sender as? BackwardSkatingVideosItems
        }
    }

}

extension BackwardSkatingVideosViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContentForSearchText(searchText: searchBar.text!)
    }
}

extension BackwardSkatingVideosViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filteredContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

// functions to display videos list in UI table
extension BackwardSkatingVideosViewController: UITableViewDataSource, UITableViewDelegate {
    
    // count the numbers of rows that array has
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredBackwardSkatingVideos.count
        }
        return backwardSkatingVideosItems.count
    }
    
    // display each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let backwardSkatingVideosItem = backwardSkatingVideosItems[indexPath.row]
        
        let backwardSkatingVideosCell = tableView.dequeueReusableCell(withIdentifier: "backwardSkatingVideosCell") as! BackwardSkatingVideosTable
        
       let currentBackwardSkatingVideo: BackwardSkatingVideosItems
         
        if isFiltering() {
            currentBackwardSkatingVideo = filteredBackwardSkatingVideos[indexPath.row]
        } else {
            currentBackwardSkatingVideo = backwardSkatingVideosItem
        }
        
        backwardSkatingVideosCell.setBackwardSkatingVideos(video: currentBackwardSkatingVideo)
        
        return backwardSkatingVideosCell
    }
    
    // redirect to other view controller page with the identifier of segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = backwardSkatingVideosItems[indexPath.row]
        performSegue(withIdentifier: "backwardSkatingDetail", sender: video)
    }
}

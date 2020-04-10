/*

 Program Name: StickhandlingVideosViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. The purpose of this program is to store video data into array and display into TableView
               2. Pass table cell data to the detail page
               3. Search Filter Function

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit


/*
   Store data into Stickhandling video array
   
   Extension UISearchBarDelegate, UISearchResultsUpdating: read and update filter input
   Extentsion UITableViewDataSource, UITableViewDelegate: pass data from table cell to
                                                          detail page with identifier
*/
class StickhandlingVideosViewController: UIViewController {

    // outlets
    @IBOutlet weak var stickhandlingVideosTable: UITableView!
    
    var filteredStickhandlingVideos: [StickhandlingVideosItems] = []
    var stickhandlingVideosItems: [StickhandlingVideosItems] = []
    
    
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
            
            // stores video info into At Home Training array
            stickhandlingVideosItems = stickhandlingVideosList()
            // Move search filter into navigation bar
            setupNavBar()

        }
        
    func setupNavBar() {
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // Read input text from filter
    func filteredContentForSearchText(searchText: String) {
        filteredStickhandlingVideos = stickhandlingVideosItems.filter({(stickhandlingVideo: StickhandlingVideosItems) -> Bool in
            
            if !isSearchBarEmpty() {
                return stickhandlingVideo.title.lowercased().contains(searchText.lowercased())
            } else {
                return false
            }
        })
        
        // If input is cancelled, data shows
        stickhandlingVideosTable.reloadData()
    }
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarIsFiltering = searchController.searchBar.text != ""
        return searchController.isActive && (!isSearchBarEmpty() || searchBarIsFiltering)
    }
    
        func stickhandlingVideosList() -> [StickhandlingVideosItems] {
            
            var tempStickhandlingVideoItems: [StickhandlingVideosItems] = []
            
            let item1 = StickhandlingVideosItems(image: #imageLiteral(resourceName: "free-videos8"), title: "Stickhandling Category 1", description: "Accelerating well in motion calls for quick feet with rapid powerful and long running steps. If you want to accelerate quickly, you must maintain a low center of gravity and also keep your skates in a powerful position directly below your hips.", url: "tAbYp4eaJCw")
            
            let item2 = StickhandlingVideosItems(image: #imageLiteral(resourceName: "free-videos6"), title: "Stickhandling Category 2", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your body weight through. Each push extending through your hip knee and ankle.", url: "3qhu6JECtSc")
            
            let item3 = StickhandlingVideosItems(image: #imageLiteral(resourceName: "free-videos1"), title: "Stickhandling Category 3", description: "Forward arm drive happens with the stick on the ice arms bent to 90 degrees in full extension. All the momentum carries forward where to get Fiona to go to two hands. Two ends are going to be on the stick arms.", url: "VgBFnhVz6zM")
            
            tempStickhandlingVideoItems.append(item1)
            tempStickhandlingVideoItems.append(item2)
            tempStickhandlingVideoItems.append(item3)
            
            return tempStickhandlingVideoItems
        }
        
        // passing related video info to detail page
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "stickhandlingDetail" {
                let destVC = segue.destination as! StickhandlingVideosDetailViewController
                destVC.video = sender as? StickhandlingVideosItems
            }
        }
    
}

extension StickhandlingVideosViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContentForSearchText(searchText: searchBar.text!)
    }
}

extension StickhandlingVideosViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filteredContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

// functions to display videos list in UI table
extension StickhandlingVideosViewController: UITableViewDataSource, UITableViewDelegate {
    
    // count the numbers of rows that array has
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredStickhandlingVideos.count
        }
        return stickhandlingVideosItems.count
    }
    
    // display each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let stickhandlingVideosItem = stickhandlingVideosItems[indexPath.row]
        
        let stickhandlingVideosCell = tableView.dequeueReusableCell(withIdentifier: "stickhandlingVideosCell") as! StickhandlingVideosTable
        
       let currentStickhandlingVideo: StickhandlingVideosItems
         
        if isFiltering() {
            currentStickhandlingVideo = filteredStickhandlingVideos[indexPath.row]
        } else {
            currentStickhandlingVideo = stickhandlingVideosItem
        }
        
        stickhandlingVideosCell.setStickhandlingVideos(video: currentStickhandlingVideo)
        
        return stickhandlingVideosCell
    }
    
    // redirect to other view controller page with the identifier of segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = stickhandlingVideosItems[indexPath.row]
        performSegue(withIdentifier: "stickhandlingDetail", sender: video)
    }
}

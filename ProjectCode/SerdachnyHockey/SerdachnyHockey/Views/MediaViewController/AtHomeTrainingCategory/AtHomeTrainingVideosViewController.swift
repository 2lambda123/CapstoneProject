/*

 Program Name: AtHomeTrainingVideosViewController.swift
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
   Store data into AtHomeTraining video array
   
   Extension UISearchBarDelegate, UISearchResultsUpdating: read and update filter input
   Extentsion UITableViewDataSource, UITableViewDelegate: pass data from table cell to
                                                          detail page with identifier
*/
class AtHomeTrainingVideosViewController: UIViewController {

    // outlets
    @IBOutlet weak var atHomeTrainingVideosTable: UITableView!
    var filteredAtHomeTrainingVideos: [AtHomeTrainingVideosItems] = []
    var atHomeTrainingVideosItems: [AtHomeTrainingVideosItems] = []
    
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
        atHomeTrainingVideosItems = atHomeTrainingVideosList()
        // Move search filter into navigation bar
        setupNavBar()
    }
    
    func setupNavBar() {
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // Read input text from filter
    func filteredContentForSearchText(searchText: String) {
        filteredAtHomeTrainingVideos = atHomeTrainingVideosItems.filter({(atHomeTrainingVideo: AtHomeTrainingVideosItems) -> Bool in
            
            if !isSearchBarEmpty() {
                return atHomeTrainingVideo.title.lowercased().contains(searchText.lowercased())
            } else {
                return false
            }
        })
        
        // If input is cancelled, data shows
        atHomeTrainingVideosTable.reloadData()
    }
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarIsFiltering = searchController.searchBar.text != ""
        return searchController.isActive && (!isSearchBarEmpty() || searchBarIsFiltering)
    }
    
    func atHomeTrainingVideosList() -> [AtHomeTrainingVideosItems] {
        
        var tempAtHomeTrainingVideoItems: [AtHomeTrainingVideosItems] = []
        
        let item1 = AtHomeTrainingVideosItems(image: #imageLiteral(resourceName: "free-videos8"), title: "At Home Training 1", description: "Accelerating well in motion calls for quick feet with rapid powerful and long running steps. If you want to accelerate quickly, you must maintain a low center of gravity and also keep your skates in a powerful position directly below your hips.", url: "tAbYp4eaJCw")
        
        let item2 = AtHomeTrainingVideosItems(image: #imageLiteral(resourceName: "free-videos6"), title: "At Home Training 2", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your body weight through. Each push extending through your hip knee and ankle.", url: "3qhu6JECtSc")
        
        let item3 = AtHomeTrainingVideosItems(image: #imageLiteral(resourceName: "free-videos1"), title: "At Home Training 3", description: "Forward arm drive happens with the stick on the ice arms bent to 90 degrees in full extension. All the momentum carries forward where to get Fiona to go to two hands. Two ends are going to be on the stick arms.", url: "VgBFnhVz6zM")
        
        tempAtHomeTrainingVideoItems.append(item1)
        tempAtHomeTrainingVideoItems.append(item2)
        tempAtHomeTrainingVideoItems.append(item3)
        
        return tempAtHomeTrainingVideoItems
    }
    
    // passing related video info to detail page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "atHomeTrainingDetail" {
            let destVC = segue.destination as! AtHomeTrainingVideosDetailViewController
            destVC.video = sender as? AtHomeTrainingVideosItems
        }
    }
    
}

extension AtHomeTrainingVideosViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContentForSearchText(searchText: searchBar.text!)
    }
}

extension AtHomeTrainingVideosViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filteredContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

// functions to display videos list in UI table
extension AtHomeTrainingVideosViewController: UITableViewDataSource, UITableViewDelegate {
    
    // count the numbers of rows that array has
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredAtHomeTrainingVideos.count
        }
        return atHomeTrainingVideosItems.count
    }
    
    // display each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let atHomeTrainingVideosItem = atHomeTrainingVideosItems[indexPath.row]
        
        let atHomeTrainingVideosCell = tableView.dequeueReusableCell(withIdentifier: "atHomeTrainingVideosCell") as! AtHomeTrainingVideosTable
        
       let currentAtHomeTrainingVideo: AtHomeTrainingVideosItems
         
        if isFiltering() {
            currentAtHomeTrainingVideo = filteredAtHomeTrainingVideos[indexPath.row]
        } else {
            currentAtHomeTrainingVideo = atHomeTrainingVideosItem
        }
        
        atHomeTrainingVideosCell.setAtHomeTrainingVideos(video: currentAtHomeTrainingVideo)
        
        return atHomeTrainingVideosCell
    }
    
    // redirect to other view controller page with the identifier of segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = atHomeTrainingVideosItems[indexPath.row]
        performSegue(withIdentifier: "atHomeTrainingDetail", sender: video)
    }
}

/*

  Program Name: ForwardSkatingVideosViewController.swift
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
   Store data into foraward skating video array
   
   Extension UISearchBarDelegate, UISearchResultsUpdating: read and update filter input
   Extentsion UITableViewDataSource, UITableViewDelegate: pass data from table cell to
                                                          detail page with identifier
*/
class ForwardSkatingVideosViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var forwardSkatingVideosTable: UITableView!
    
    var filteredForwardSkatingVideos: [ForwardSkatingVideosItems] = []
    var forwardSkatingVideosItems: [ForwardSkatingVideosItems] = []
    
    
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
        forwardSkatingVideosItems = forwardSkatingVideosList()
        // Move search filter into navigation bar
        setupNavBar()
    }
    
    func setupNavBar() {
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // Read input text from filter
    func filteredContentForSearchText(searchText: String) {
        filteredForwardSkatingVideos = forwardSkatingVideosItems.filter({(forwardSkatingVideo: ForwardSkatingVideosItems) -> Bool in
            
            if !isSearchBarEmpty() {
                return forwardSkatingVideo.title.lowercased().contains(searchText.lowercased())
            } else {
                return false
            }
        })
        
        // If input is cancelled, data shows
        forwardSkatingVideosTable.reloadData()
    }
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarIsFiltering = searchController.searchBar.text != ""
        return searchController.isActive && (!isSearchBarEmpty() || searchBarIsFiltering)
    }
    
    func forwardSkatingVideosList() -> [ForwardSkatingVideosItems] {
        
        var tempForwardSkatingVideoItems: [ForwardSkatingVideosItems] = []
        
        let item1 = ForwardSkatingVideosItems(image: #imageLiteral(resourceName: "free-videos8"), title: "Acceleration In Motion", description: "Accelerating well in motion calls for quick feet with rapid powerful and long running steps. If you want to accelerate quickly, you must maintain a low center of gravity and also keep your skates in a powerful position directly below your hips.", url: "tAbYp4eaJCw")
        
        let item2 = ForwardSkatingVideosItems(image: #imageLiteral(resourceName: "free-videos6"), title: "Crossover Start", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your body weight through. Each push extending through your hip knee and ankle.", url: "3qhu6JECtSc")
        
        let item3 = ForwardSkatingVideosItems(image: #imageLiteral(resourceName: "free-videos1"), title: "Explosive Starts Stick Position", description: "Forward arm drive happens with the stick on the ice arms bent to 90 degrees in full extension. All the momentum carries forward where to get Fiona to go to two hands. Two ends are going to be on the stick arms.", url: "VgBFnhVz6zM")
        
        tempForwardSkatingVideoItems.append(item1)
        tempForwardSkatingVideoItems.append(item2)
        tempForwardSkatingVideoItems.append(item3)
        
        return tempForwardSkatingVideoItems
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forwardSkatingDetail" {
            let destVC = segue.destination as! ForwardSkatingVideosDetailViewController
            destVC.video = sender as? ForwardSkatingVideosItems
        }
    }

}

extension ForwardSkatingVideosViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContentForSearchText(searchText: searchBar.text!)
    }
}

extension ForwardSkatingVideosViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filteredContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

extension ForwardSkatingVideosViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredForwardSkatingVideos.count
        }
        return forwardSkatingVideosItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let forwardSkatingVideosItem = forwardSkatingVideosItems[indexPath.row]
        let forwardSkatingVideosCell = tableView.dequeueReusableCell(withIdentifier: "forwardSkatingVideosCell") as! ForwardSkatingVideosTable
        let currentForwardSkatingVideo: ForwardSkatingVideosItems
         
        if isFiltering() {
            currentForwardSkatingVideo = filteredForwardSkatingVideos[indexPath.row]
        } else {
            currentForwardSkatingVideo = forwardSkatingVideosItem
        }
        
        forwardSkatingVideosCell.setForwardSkatingVideos(video: currentForwardSkatingVideo)
        
        return forwardSkatingVideosCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = forwardSkatingVideosItems[indexPath.row]
        performSegue(withIdentifier: "forwardSkatingDetail", sender: video)
    }
}






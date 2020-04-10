/*

 Program Name: TableListScreen.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. The purpose of this program is to store video data into array and display into TableView
               2. Pass table cell data to the detail page
               3. Search Filter Function

 Copyright © 2020 Prime Software. All rights reserved.

*/


import UIKit
import SafariServices


/*
   Store data into foraward skating video array
   
   Extension UISearchBarDelegate, UISearchResultsUpdating: read and update filter input
   Extentsion UITableViewDataSource, UITableViewDelegate: pass data from table cell to
                                                          detail page with identifier
*/
class TableListScreen: UIViewController {
    
    // outlets
    @IBOutlet weak var videoTable: UITableView!
    
    @IBOutlet weak var podcastTable: UITableView!
    
    // create an array that stores all searchable videos' label
    var filteredSearchItems: [SearchItems] = []
    var filteredPodcastItems: [PodcastItems] = []
    var searchItems: [SearchItems] = []
    var podcastItems: [PodcastItems] = []
    
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
        // call createArray()
        searchItems = videoList()
        podcastItems = podcastList()
        // call setupNavBar()
        setupNavBar()
        // customize the Back nav item
        setCustomBackImage()
    }
    
    // set up searchbar
    func setupNavBar() {
        
//        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.searchTextField.backgroundColor = .white
    }
    
    func setCustomBackImage() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    // Read input text from filter
    func filteredContentForSearchText(searchText: String) {
        filteredSearchItems = searchItems.filter({(searchItems: SearchItems) -> Bool in
            
            if !isSearchBarEmpty() {
                return searchItems.title.lowercased().contains(searchText.lowercased())
            } else {
                return false
            }
        })
        
        filteredPodcastItems = podcastItems.filter({(podcastItems:
            PodcastItems) -> Bool in
            
            if !isSearchBarEmpty() {
                return podcastItems.title.lowercased().contains(searchText.lowercased())
            } else {
                return false
            }
        })
        
        // If input is cancelled, data shows
        videoTable.reloadData()
        podcastTable.reloadData()
    }
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarIsFiltering = searchController.searchBar.text != ""
        return searchController.isActive && (!isSearchBarEmpty() || searchBarIsFiltering)
    }
    
    // add videos' label into array
    func videoList() -> [SearchItems] {
         
        var tempSearchItems: [SearchItems] = []
        
        let item1 = SearchItems(image: #imageLiteral(resourceName: "free-videos"), title: "Forwards Skating", description: "Pivot the heel of the pushing foot up and outward so that it is perpendicular to your glide foot (forming an upside down letter “L”).", url: "https://www.elitepowerskating.com/video/clips/play/?id=1")
        let item2 = SearchItems(image: #imageLiteral(resourceName: "free-videos1"), title: "Backward Skating", description: "This is description of multi-stage v-start", url: "https://www.elitepowerskating.com/video/clips/play/?id=1")
        let item3 = SearchItems(image: #imageLiteral(resourceName: "free-videos2"), title: "Stickhandling", description: "This is description of cricle chase", url: "https://www.elitepowerskating.com/video/clips/play/?id=1")
        let item4 = SearchItems(image: #imageLiteral(resourceName: "free-videos3"), title: "Moves", description: "This is description of double stepovers forwards", url: "https://www.elitepowerskating.com/video/clips/play/?id=1")
        let item5 = SearchItems(image: #imageLiteral(resourceName: "free-videos4"), title: "At Home Training", description: "This is description of acceleration in motion", url: "https://www.elitepowerskating.com/video/clips/play/?id=1")
       
        tempSearchItems.append(item1)
        tempSearchItems.append(item2)
        tempSearchItems.append(item3)
        tempSearchItems.append(item4)
        tempSearchItems.append(item5)
        
        return tempSearchItems
    }
    
    func podcastList() -> [PodcastItems] {
         
        var tempPodcastItems: [PodcastItems] = []
        
        let item1 = PodcastItems(image: #imageLiteral(resourceName: "free-videos"), title: "Listen on Apple Podcast", description: "In this episode, we sit-down with LA KINGS power forward - Austin Wagner.", url: "https://podcasts.apple.com/us/podcast/serdachny-hockey/id1450951448?ign-mpt=uo%3D4&mt=2")
        let item2 = PodcastItems(image: #imageLiteral(resourceName: "free-videos1"), title: "Listen on Google Podcast", description: "In this episode, we sit-down with LA KINGS power forward - Austin Wagner.", url: "https://podcasts.google.com/?feed=aHR0cHM6Ly9hbmNob3IuZm0vcy84NzRjZjY4L3BvZGNhc3QvcnNz")
       
        tempPodcastItems.append(item1)
        tempPodcastItems.append(item2)
        
        return tempPodcastItems
    }
    
}

extension TableListScreen: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContentForSearchText(searchText: searchBar.text!)
    }
}

extension TableListScreen: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filteredContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

// provide corrsponding index number of each video label
var selectedTitle: SearchItems?
extension TableListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableView == videoTable) {
            if isFiltering() {
                return filteredSearchItems.count
            }
            return searchItems.count
        }
        else{
            if isFiltering() {
                return filteredPodcastItems.count
            }
            return podcastItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(tableView == videoTable) {
            let searchItem = searchItems[indexPath.row]
            let searchCell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as! SearchCell
            let currentSearchItems: SearchItems
             
            if isFiltering() {
                currentSearchItems = filteredSearchItems[indexPath.row]
                
            } else {
                currentSearchItems = searchItem
            }
            
            searchCell.setVideo(video: currentSearchItems)
            
            return searchCell
        }
        else {
            let podcastItem = podcastItems[indexPath.row]
            let podcastCell = tableView.dequeueReusableCell(withIdentifier: "podcastCell") as! PodcastTable
            
            let currentPodcastItems: PodcastItems
             
            if isFiltering() {
                currentPodcastItems = filteredPodcastItems[indexPath.row]
                
            } else {
                currentPodcastItems = podcastItem
            }
            
            podcastCell.setPodcast(podcast: currentPodcastItems)
            
            return podcastCell
            
        }
    }
    
    // test for passing specific data from each cell.
    // function to perform/navigate/passing data from tableview to other viewcontroller
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if tableView == videoTable {
            
            let destAsTitle = self.searchItems[indexPath.row]
            selectedTitle = destAsTitle
            let selectedIndex = indexPath.row
            if selectedIndex == 0
            {
                performSegue(withIdentifier: "forwardSkatingList", sender: nil)
            }
            else if selectedIndex == 1 {
                performSegue(withIdentifier: "backwardSkatingList", sender: nil)
            }
            else if selectedIndex == 2 {
                performSegue(withIdentifier: "stickhandlingList", sender: nil)
            }
            else if selectedIndex == 3 {
                performSegue(withIdentifier: "movesList", sender: nil)
            }
            else if selectedIndex == 4 {
                performSegue(withIdentifier: "atHomeTrainingList", sender: nil)
            }
        }
        if tableView == podcastTable {
            
            let url = URL(string: self.podcastItems[indexPath.row].url)
            
            let safariVC = SFSafariViewController(url: url!)
            present(safariVC, animated: true, completion: nil)
        }
    }
  
}

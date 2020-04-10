/*

 Program Name: MovesVideosViewController.swift
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
   Store data into Moves video array
   
   Extension UISearchBarDelegate, UISearchResultsUpdating: read and update filter input
   Extentsion UITableViewDataSource, UITableViewDelegate: pass data from table cell to
                                                          detail page with identifier
*/
class MovesVideosViewController: UIViewController {

    // Outlets
    @IBOutlet weak var movesVideoTable: UITableView!
    
    var filteredMovesVideos: [MovesVideosItems] = []
    var movesVideosItems: [MovesVideosItems] = []
    
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
                
        // customize Back nav item
        setCustomBackImage()
        // Move search filter into navigation bar
        setupNavBar()
        // stores video info into At Home Training array
        movesVideosItems = movesVideosList()
                
        }
    
    func setCustomBackImage() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    func setupNavBar() {
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // Read input text from filter
    func filteredContentForSearchText(searchText: String) {
        filteredMovesVideos = movesVideosItems.filter({(movesVideo: MovesVideosItems) -> Bool in
            
            if !isSearchBarEmpty() {
                return movesVideo.title.lowercased().contains(searchText.lowercased())
            } else {
                return false
            }
        })
        
        // If input is cancelled, data shows
        movesVideoTable.reloadData()
    }
    
    func isSearchBarEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        let searchBarIsFiltering = searchController.searchBar.text != ""
        return searchController.isActive && (!isSearchBarEmpty() || searchBarIsFiltering)
    }
            
            func movesVideosList() -> [MovesVideosItems] {
                
                var tempMovesVideoItems: [MovesVideosItems] = []
                
                let item1 = MovesVideosItems(image: #imageLiteral(resourceName: "free-videos8"), title: "Moves Category 1", description: "Accelerating well in motion calls for quick feet with rapid powerful and long running steps. If you want to accelerate quickly, you must maintain a low center of gravity and also keep your skates in a powerful position directly below your hips.", url: "tAbYp4eaJCw")
                
                let item2 = MovesVideosItems(image: #imageLiteral(resourceName: "free-videos6"), title: "Moves Category 2", description: "The crossover start your stance is distributed on the balls of your feet. You want to maintain a low powerful position for explosive speed. Each thrust will use a hundred percent of your body weight through. Each push extending through your hip knee and ankle.", url: "3qhu6JECtSc")
                
                let item3 = MovesVideosItems(image: #imageLiteral(resourceName: "free-videos1"), title: "Moves  Category 3", description: "Forward arm drive happens with the stick on the ice arms bent to 90 degrees in full extension. All the momentum carries forward where to get Fiona to go to two hands. Two ends are going to be on the stick arms.", url: "VgBFnhVz6zM")
                
                tempMovesVideoItems.append(item1)
                tempMovesVideoItems.append(item2)
                tempMovesVideoItems.append(item3)
                
                return tempMovesVideoItems
            }
            
            // passing related video info to detail page
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "movesDetail" {
                    let destVC = segue.destination as! MovesVideosDetailViewController
                    destVC.video = sender as? MovesVideosItems
                }
            }
        
    }

extension MovesVideosViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredContentForSearchText(searchText: searchBar.text!)
    }
}

extension MovesVideosViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filteredContentForSearchText(searchText: searchController.searchBar.text!)
    }
}

extension MovesVideosViewController: UITableViewDataSource, UITableViewDelegate {
    
    // count the numbers of rows that array has
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredMovesVideos.count
        }
        return movesVideosItems.count
    }
    
    // display each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movesVideosItem = movesVideosItems[indexPath.row]
        
        let movesVideosCell = tableView.dequeueReusableCell(withIdentifier: "movesVideosCell") as! MovesVideosTable
        
        let currentMovesVideo: MovesVideosItems
         
        if isFiltering() {
            currentMovesVideo = filteredMovesVideos[indexPath.row]
        } else {
            currentMovesVideo = movesVideosItem
        }
        
        movesVideosCell.setMovesVideos(video: currentMovesVideo)
        
        return movesVideosCell
    }
    
    // redirect to other view controller page with the identifier of segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = movesVideosItems[indexPath.row]
        performSegue(withIdentifier: "movesDetail", sender: video)
    }
}


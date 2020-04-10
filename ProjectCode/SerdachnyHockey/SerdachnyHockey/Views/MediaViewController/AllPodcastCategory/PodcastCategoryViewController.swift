/*

 Program Name: PodcastCategoryViewController.swift
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

class PodcastCategoryViewController: UIViewController {

    // outlets
    @IBOutlet weak var podcastCategoryTable: UITableView!
    
    var podcastCategoryItems: [PodcastCategoryItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // stores video info into At Home Training array
        podcastCategoryItems = podcastCategoryList()
    }
    
    func podcastCategoryList() -> [PodcastCategoryItems] {
        
        var tempPodcastCategoryItems: [PodcastCategoryItems] = []
        
        let item1 = PodcastCategoryItems(image: #imageLiteral(resourceName: "apple_podcast"), title: "Listen on Apple Podcast", description: "In this episode, we sit-down with LA KINGS power forward - Austin Wagner.", url: "https://podcasts.apple.com/us/podcast/serdachny-hockey/id1450951448?ign-mpt=uo%3D4&mt=2")
        
        let item2 = PodcastCategoryItems(image: #imageLiteral(resourceName: "google_podcast"), title: "Listen on Google Podcast", description: "In this episode, we sit-down with LA KINGS power forward - Austin Wagner.", url: "https://podcasts.google.com/?feed=aHR0cHM6Ly9hbmNob3IuZm0vcy84NzRjZjY4L3BvZGNhc3QvcnNz")
        
        let item3 = PodcastCategoryItems(image: #imageLiteral(resourceName: "spotify_podcast"), title: "Listen on Spotify Podcast", description: "In this episode, we sit-down with LA KINGS power forward - Austin Wagner.", url: "https://open.spotify.com/show/1USacjg6S9QHR4MRr87jya")
        
        let item4 = PodcastCategoryItems(image: #imageLiteral(resourceName: "anchor_podcast"), title: "Listen on Anchor Podcast", description: "In this episode, we sit-down with LA KINGS power forward - Austin Wagner.", url: "https://anchor.fm/steve-serdachny")
        
        tempPodcastCategoryItems.append(item1)
        tempPodcastCategoryItems.append(item2)
        tempPodcastCategoryItems.append(item3)
        tempPodcastCategoryItems.append(item4)
        
        return tempPodcastCategoryItems
    }

}

// functions to display videos list in UI table
extension PodcastCategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    // count the numbers of rows that array has
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return podcastCategoryItems.count
    }
    
    // display each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let podcastCategoryItem = podcastCategoryItems[indexPath.row]
        
        let podcastCategoryCell = tableView.dequeueReusableCell(withIdentifier: "allPodcasts") as! PodcastCategoryTable
        
        podcastCategoryCell.setPodcastCategory(podcastCategory: podcastCategoryItem)
        
        return podcastCategoryCell
    }
    
    // redirect to other view controller page with the identifier of segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: self.podcastCategoryItems[indexPath.row].url)
        
        let SafariVC = SFSafariViewController(url: url!)
        
        present(SafariVC, animated: true, completion: nil)
    }
}

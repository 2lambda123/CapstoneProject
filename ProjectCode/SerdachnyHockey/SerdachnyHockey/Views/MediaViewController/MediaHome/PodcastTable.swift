/*

 Program Name: PodcastTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class PodcastTable: UITableViewCell {

    
    
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var podcastTitleLabel: UILabel!
    @IBOutlet weak var podcastDescriptionLabel: UILabel!
    
    func setPodcast(podcast: PodcastItems) {
        podcastImageView.image = podcast.image
        podcastTitleLabel.text = podcast.title
        podcastDescriptionLabel.text = podcast.description
    }

}

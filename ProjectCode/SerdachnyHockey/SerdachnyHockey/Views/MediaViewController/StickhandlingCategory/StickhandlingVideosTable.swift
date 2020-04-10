/*

 Program Name: StickhandlingVideosTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class StickhandlingVideosTable: UITableViewCell {

    @IBOutlet weak var stickhandlingVideosImageView: UIImageView!
    @IBOutlet weak var stickhandlingVideosTitleLabel: UILabel!
    
    // passing image and text data into At Home Training table
    func setStickhandlingVideos(video: StickhandlingVideosItems) {
        
        stickhandlingVideosImageView.image = video.image
        stickhandlingVideosTitleLabel.text = video.title
    }

}

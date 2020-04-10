/*

 Program Name: StickhandlingTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class StickhandlingTable: UITableViewCell {

    @IBOutlet weak var stickhandlingImageView: UIImageView!
    @IBOutlet weak var stickhandlingTitleLabel: UILabel!
    
    // passing image and text data into At Home Training table
    func setStickhandlingVideo(video: StickhandlingItems) {
        stickhandlingImageView.image = video.image
        stickhandlingTitleLabel.text = video.title
    }
}

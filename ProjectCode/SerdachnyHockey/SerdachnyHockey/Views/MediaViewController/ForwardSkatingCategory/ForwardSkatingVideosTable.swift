/*

 Program Name: ForwardSkatingVideosTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class ForwardSkatingVideosTable: UITableViewCell {

    
    @IBOutlet weak var forwardSkatingVideosImageView: UIImageView!
    @IBOutlet weak var forwardSkatingVideosTitleLabel: UILabel!
    
    // passing image and text data into At Home Training table
    func setForwardSkatingVideos(video: ForwardSkatingVideosItems) {
        forwardSkatingVideosImageView.image = video.image
        forwardSkatingVideosTitleLabel.text = video.title
    }
    
}

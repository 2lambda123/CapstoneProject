/*

 Program Name: BackwardSkatingVideosTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class BackwardSkatingVideosTable: UITableViewCell {

    @IBOutlet weak var backwardSkatingVideosImageView: UIImageView!
    @IBOutlet weak var backwardSkatingVideosTitleLabel: UILabel!
    
    // passing image and text data into At Home Training table
    func setBackwardSkatingVideos(video: BackwardSkatingVideosItems) {
        backwardSkatingVideosImageView.image = video.image
        backwardSkatingVideosTitleLabel.text = video.title
    }

}

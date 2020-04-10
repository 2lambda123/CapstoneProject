/*

 Program Name: AtHomeTrainingVideosTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class AtHomeTrainingVideosTable: UITableViewCell {

    @IBOutlet weak var atHomeTrainingVideosImageView: UIImageView!
    @IBOutlet weak var atHomeTrainingVideosTitleLabel: UILabel!
   
    // passing image and text data into At Home Training table
    func setAtHomeTrainingVideos(video: AtHomeTrainingVideosItems) {
        
        atHomeTrainingVideosImageView.image = video.image
        atHomeTrainingVideosTitleLabel.text = video.title
    }

}

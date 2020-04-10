/*

 Program Name: AtHomeTrainingTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class AtHomeTrainingTable: UITableViewCell {

    @IBOutlet weak var atHomeTrainingImageView: UIImageView!
    @IBOutlet weak var atHomeTainingTitleLabel: UILabel!
    
    // passing image and text data into At Home Training table
    func setAtHomeTrainingVideo(video: AtHomeTrainingItems) {
        atHomeTrainingImageView.image = video.image
        atHomeTainingTitleLabel.text = video.title
    }

}

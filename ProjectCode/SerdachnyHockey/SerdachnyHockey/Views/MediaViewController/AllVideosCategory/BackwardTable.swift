/*

 Program Name: BackwardTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class BackwardTable: UITableViewCell {

    @IBOutlet weak var backwardImageView: UIImageView!
    @IBOutlet weak var backwardTitleLabel: UILabel!
    
    // passing image and text data into At Home Training table
    func setBackwardVideo(video: BackwardItems) {
        backwardImageView.image = video.image
        backwardTitleLabel.text = video.title
    }

}

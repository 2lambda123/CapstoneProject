/*

 Program Name: ForwardTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class ForwardTable: UITableViewCell {

    @IBOutlet weak var forwardImageView: UIImageView!
    @IBOutlet weak var forwardTitleLabel: UILabel!
    
    // passing image and text data into At Home Training table
    func setForwardVideo(video: ForwardItems) {
        forwardImageView.image = video.image
        forwardTitleLabel.text = video.title
    }

}

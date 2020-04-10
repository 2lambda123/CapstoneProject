/*

 Program Name: MovesTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class MovesTable: UITableViewCell {

    @IBOutlet weak var movesImageView: UIImageView!
    @IBOutlet weak var movesTitleLabel: UILabel!
    
    // passing image and text data into At Home Training table
    func setMovesVideo(video: MovesItems) {
        movesImageView.image = video.image
        movesTitleLabel.text = video.title
    }

}

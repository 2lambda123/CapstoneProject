/*

 Program Name: MovesVideosTable.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class MovesVideosTable: UITableViewCell {

    @IBOutlet weak var movesVideosImageView: UIImageView!
    @IBOutlet weak var movesVideosTitleLabel: UILabel!
    
    // passing image and text data into At Home Training table
    func setMovesVideos(video: MovesVideosItems) {
        
        movesVideosImageView.image = video.image
        movesVideosTitleLabel.text = video.title
    }

}

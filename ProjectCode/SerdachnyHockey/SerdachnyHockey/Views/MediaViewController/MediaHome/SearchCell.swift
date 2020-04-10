/*

 Program Name: SearchCell.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/
import UIKit

// SearchCell implements UITableCell associated with the TableView
class SearchCell: UITableViewCell {
    
    // link between tableviewcell storyboard UI and SearchCell swift code
    @IBOutlet weak var videoImageView: UIImageView!
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    
    // setfunction to initialzie label content
    func setVideo(video: SearchItems) {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
        
    }
}

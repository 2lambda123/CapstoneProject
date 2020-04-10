/*

 Program Name: ProgramCell.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/
import UIKit

class ProgramCell: UITableViewCell {
    
    //Main page program cell image view
    @IBOutlet weak var programImageView: UIImageView!
    
    //Main page program title label
    @IBOutlet weak var programTitleLabel: UILabel!
    
    //set the program image and title function
    func setProgram(program:Program){
        programImageView.image = program.image
        programTitleLabel.text = program.title
 
    }
}

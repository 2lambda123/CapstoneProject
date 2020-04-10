/*

 Program Name: AllProgramCell.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class AllProgramCell: UITableViewCell {


    @IBOutlet weak var DetailImageView: UIImageView!
    
    @IBOutlet weak var DetailLabelView: UILabel!
    
       func setAllProgram(program:Program){
           DetailImageView.image = program.image
           DetailLabelView.text = program.title
    
       }
}

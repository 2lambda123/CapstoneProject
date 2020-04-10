/*

 Program Name: AboutTableViewCell.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               The purpose of this program is to make default tableview for About info.

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class AboutTableViewCell: UITableViewCell {


    @IBOutlet weak var aboutLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

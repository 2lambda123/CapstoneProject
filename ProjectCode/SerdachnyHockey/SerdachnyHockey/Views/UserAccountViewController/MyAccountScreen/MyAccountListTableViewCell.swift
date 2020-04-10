//
//  MyAccountListTableViewCell.swift
//  SerdachnyHockey
//
//  Created by Jinkai Fan on 2020-02-05.
//  Copyright © 2020 Prime Software. All rights reserved.
//

import UIKit

class MyAccountListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var accountImage: UIImageView!
    
    @IBOutlet weak var accountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

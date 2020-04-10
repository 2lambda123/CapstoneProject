/*

 Program Name: StoreCell.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               1. Abstract class
               2. The purpose of this program is to initialize components

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class StoreCell: UITableViewCell {

    //Main page edge store image view
    @IBOutlet weak var storeImageView: UIImageView!
    
    //Main page edge store title label
    @IBOutlet weak var storeTitleLabel: UILabel!
    
    //set the store image and title
        func setStore(store:Store){
        storeImageView.image = store.storeImage
        storeTitleLabel.text = store.storeTitle
 
    }
}

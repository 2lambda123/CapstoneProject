/*

 Program Name: Store.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import Foundation
import UIKit

class Store{
    var storeImage: UIImage
    var storeTitle: String
    var storeUrl: String
    
    init(storeImage:UIImage,storeTitle:String, storeUrl: String){
        self.storeImage = storeImage
        self.storeTitle = storeTitle
        self.storeUrl = storeUrl
    }

}

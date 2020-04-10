/*

 Program Name: Program.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               1. Abstract helper class
               2. The purpose of this program is to update passing selected image and title data from tableview cells and display on detail page

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit

class Program{
    var image: UIImage
    var title: String
    var programUrl: String
    
    init(image:UIImage,title:String,programUrl: String){
        self.image = image
        self.title = title
        self.programUrl = programUrl
    }

}

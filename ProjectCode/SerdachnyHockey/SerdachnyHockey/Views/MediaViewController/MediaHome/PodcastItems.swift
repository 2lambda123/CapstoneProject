/*

 Program Name: PodcastItems.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:s
               1. Abstract class
               2. The purpose of this program is to initialize components

 Copyright © 2020 Prime Software. All rights reserved.

*/

import Foundation
import UIKit

// common swift class file to initialize objects(video image and title)
class PodcastItems {
    
    var image: UIImage
    var title: String
    var description: String
    var url: String
    
    init(image: UIImage, title: String, description: String, url: String) {
        self.image = image
        self.title = title
        self.description = description
        self.url = url
        
    }
    
}

/*

 Program Name: AtHomeTrainingCategoryViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               The purpose of this program is to show video details and embedded video player

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import SafariServices
import WebKit

class AtHomeTrainingCategoryViewController: UIViewController {

    // Outlets
    @IBOutlet weak var atHomeTrainingCategoryWebView: WKWebView!
    @IBOutlet weak var atHomeTrainingCategoryTitleLabel: UILabel!
    @IBOutlet weak var atHomeTrainingCategoryDescriptionLabel: UILabel!
    
    
   var video: AtHomeTrainingItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show the info that will be paased by
        setUI()
            
        getVideo(videoKey: video!.url)
            
        }
        
        func setUI() {
            
            // assgin value to video Optionals
            atHomeTrainingCategoryTitleLabel.text = video?.title
            atHomeTrainingCategoryDescriptionLabel.text = video?.description
        
    }
    
    // load video
    func getVideo(videoKey:String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        atHomeTrainingCategoryWebView.load(URLRequest(url: url!))
    }

}

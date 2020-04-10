/*

 Program Name: BackwardCategoryViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               The purpose of this program is to show video details and embedded video player

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import SafariServices
import WebKit

class BackwardCategoryViewController: UIViewController {

    // Outlets
    @IBOutlet weak var backwardCategoryWebView: WKWebView!
    @IBOutlet weak var backwardCategoryTitleLabel: UILabel!
    @IBOutlet weak var backwardCategoryDescriptionLabel: UILabel!
    
    
    var video: BackwardItems?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show the info that will be paased by
        setUI()
        
        getVideo(videoKey: video!.url)
        
    }
    
    func setUI() {
        
        // assgin value to video Optionals
        backwardCategoryTitleLabel.text = video?.title
        backwardCategoryDescriptionLabel.text = video?.description
    }
    
    // load video
    func getVideo(videoKey:String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        backwardCategoryWebView.load(URLRequest(url: url!))
    }
    
    

}

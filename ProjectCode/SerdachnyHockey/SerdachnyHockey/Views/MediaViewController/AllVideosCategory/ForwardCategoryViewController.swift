/*

 Program Name: ForwardCategoryViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               The purpose of this program is to show video details and embedded video player

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import SafariServices
import WebKit

class ForwardCategoryViewController: UIViewController {
    
  
    // Outlets
    @IBOutlet weak var forwardCategoryWebView: WKWebView!
    @IBOutlet weak var forwardCategoryTitleLabel: UILabel!
    @IBOutlet weak var forwardCategoryDescriptionLabel: UILabel!
    
    
    var video: ForwardItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show the info that will be paased by
        setUI()
        
        getVideo(videoKey: video!.url)
    }
    
    func setUI() {
        
        // assgin value to video Optionals
        forwardCategoryTitleLabel.text = video?.title
        forwardCategoryDescriptionLabel.text = video?.description
    }
    
    // load video
    func getVideo(videoKey:String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        forwardCategoryWebView.load(URLRequest(url: url!))
    }
    
}

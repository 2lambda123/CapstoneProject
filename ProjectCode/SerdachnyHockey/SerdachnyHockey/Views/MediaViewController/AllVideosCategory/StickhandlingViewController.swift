/*

 Program Name: StickhandlingViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               The purpose of this program is to show video details and embedded video player

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import SafariServices
import WebKit

class StickhandlingViewController: UIViewController {

    // Outlets
    @IBOutlet weak var stickhandlingCategoryWebView: WKWebView!
    @IBOutlet weak var stickhandlingCategoryTitleLabel: UILabel!
    @IBOutlet weak var stickhandlingCategoryDescriptionLabel: UILabel!
    
    
    var video: StickhandlingItems?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show the info that will be paased by
        setUI()
        
        getVideo(videoKey: video!.url)
    }
    
    func setUI() {
        
        // assgin value to video Optionals
        stickhandlingCategoryTitleLabel.text = video?.title
        stickhandlingCategoryDescriptionLabel.text = video?.description
    }
    
    // load video
    func getVideo(videoKey:String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        stickhandlingCategoryWebView.load(URLRequest(url: url!))
    }

}

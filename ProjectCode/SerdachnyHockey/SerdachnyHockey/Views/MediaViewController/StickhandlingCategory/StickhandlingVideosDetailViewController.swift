/*

 Program Name: StickhandlingVideosViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               The purpose of this program is to show video details and embedded video player

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import SafariServices
import WebKit

class StickhandlingVideosDetailViewController: UIViewController {

    // Outlets
    @IBOutlet weak var stickhandlingVideosDetailWebView: WKWebView!
    @IBOutlet weak var stickhandlingVideosDetailTitleLabel: UILabel!
    @IBOutlet weak var stickhandlingVideosDetailDescriptionLabel: UILabel!
    
    
    var video: StickhandlingVideosItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show the info that will be paased by
        setUI()
        
        getVideoKey(videoKey: video!.url)

    }
    
    func setUI() {
        
        // assgin value to video Optionals
        stickhandlingVideosDetailTitleLabel.text = video?.title
        stickhandlingVideosDetailDescriptionLabel.text = video?.description
    }
    
    // load video
    func getVideoKey(videoKey: String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        stickhandlingVideosDetailWebView.load(URLRequest(url: url!))
    }
    
}

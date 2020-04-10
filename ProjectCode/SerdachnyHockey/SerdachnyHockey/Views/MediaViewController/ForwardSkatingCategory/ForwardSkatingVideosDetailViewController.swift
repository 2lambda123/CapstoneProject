/*

 Program Name: ForwardSkatingVideosViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               The purpose of this program is to show video details and embedded video player

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import SafariServices
import WebKit

class ForwardSkatingVideosDetailViewController: UIViewController {

    // Outlets
    @IBOutlet weak var forwardSkatingVideosDetailWebView: WKWebView!
    
    @IBOutlet weak var forwardSkatingVideosDetailTitleLabel: UILabel!
    
    @IBOutlet weak var forwardSkatingVideosDetailDescriptionLabel: UILabel!
    
    
    var video: ForwardSkatingVideosItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // show the info that will be paased by
        setUI()
        
        getVideo(videoKey: video!.url)
        
    }
    
    func setUI() {
        
        // assgin value to video Optionals
        forwardSkatingVideosDetailTitleLabel.text = video?.title
        forwardSkatingVideosDetailDescriptionLabel.text = video?.description
    }
    
    // load video
    func getVideo(videoKey:String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        forwardSkatingVideosDetailWebView.load(URLRequest(url: url!))
    }

}

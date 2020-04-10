/*

 Program Name: BackwardSkatingVideosViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               The purpose of this program is to show video details and embedded video player

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import SafariServices
import WebKit

class BackwardSkatingVideosDetailViewController: UIViewController {

    // Outlets
    @IBOutlet weak var backwardSkatingVideosDetailWebView: WKWebView!
    @IBOutlet weak var backwardSkatingVideosDetailTitleLabel: UILabel!
    @IBOutlet weak var backwardSkatingVideosDetailDescriptionLabel: UILabel!
    

    var video: BackwardSkatingVideosItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // show the info that will be paased by
        setUI()
        
        getVideo(videoKey: video!.url)
    }
    
    func setUI() {
        
        // assgin value to video Optionals
        backwardSkatingVideosDetailTitleLabel.text = video?.title
        backwardSkatingVideosDetailDescriptionLabel.text = video?.description
    }
    
    // load video
    func getVideo(videoKey:String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        backwardSkatingVideosDetailWebView.load(URLRequest(url: url!))
    }
    

}

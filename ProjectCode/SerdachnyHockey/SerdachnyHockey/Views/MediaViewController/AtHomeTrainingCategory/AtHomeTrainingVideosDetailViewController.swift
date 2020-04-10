/*

 Program Name: AtHomeTrainingVideosViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               The purpose of this program is to show video details and embedded video player

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import SafariServices
import WebKit

class AtHomeTrainingVideosDetailViewController: UIViewController {

    // Outlets
    @IBOutlet weak var atHomeTrainingVideosDetailWebView: WKWebView!
    @IBOutlet weak var atHomeTrainingVideosDetailTitleLabel: UILabel!
    @IBOutlet weak var atHomeTrainingVideosDetailDescriptionLabel: UILabel!
    
    var video: AtHomeTrainingVideosItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show the info that will be paased by
        setUI()
        
        getVideo(videoKey: video!.url)
        
    }
    
    func setUI() {
        
        // assgin value to video Optionals
        atHomeTrainingVideosDetailTitleLabel.text = video?.title
        atHomeTrainingVideosDetailDescriptionLabel.text = video?.description
    }
    
    // load video
    func getVideo(videoKey:String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        atHomeTrainingVideosDetailWebView.load(URLRequest(url: url!))
    }
    
}

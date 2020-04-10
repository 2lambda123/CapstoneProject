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

class MovesCategoryViewController: UIViewController {

    // Outlets
    @IBOutlet weak var movesCategoryWebView: WKWebView!
    @IBOutlet weak var movesCategoryTitleLabel: UILabel!
    @IBOutlet weak var movesCategoryDescriptionLabel: UILabel!
    
    
    var video: MovesItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show the info that will be paased by
        setUI()
            
        getVideo(videoKey: video!.url)
        
        }
        
        func setUI() {
            
            // assgin value to video Optionals
            movesCategoryTitleLabel.text = video?.title
            movesCategoryDescriptionLabel.text = video?.description
        
    }
    
    // load video
    func getVideo(videoKey:String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        movesCategoryWebView.load(URLRequest(url: url!))
    }
    
    
}

/*

 Program Name: MovesVideosViewController.swift
 Application Name: SerdachnyHockey
 Author: Jiahao Li

 Description:
               The purpose of this program is to show video details and embedded video player

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import SafariServices
import WebKit

class MovesVideosDetailViewController: UIViewController {

    // Outlets
    @IBOutlet weak var movesVideoDetailWebView: WKWebView!
    @IBOutlet weak var movesVideoDetailTitleLabel: UILabel!
    @IBOutlet weak var movesVideoDetailDescriptionLabel: UILabel!
    
    
    var video: MovesVideosItems?
       
       override func viewDidLoad() {
           super.viewDidLoad()
        
            // show the info that will be paased by
           setUI()

           getVideoKey(videoKey:video!.url)
       }
       
       func setUI() {
           
           // assgin value to video Optionals
           movesVideoDetailTitleLabel.text = video?.title
           movesVideoDetailDescriptionLabel.text = video?.description
       }
    
    // load video
    func getVideoKey(videoKey:String) {
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        movesVideoDetailWebView.load(URLRequest(url: url!))
    }
    
}

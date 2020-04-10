//
//  AppDelegate.swift
//  SerdachnyHockey
//
//  Created by Mckenzie Busenius on 2020-03-02.
//  Copyright © 2020 Prime Software. All rights reserved.
//

import UIKit
import Amplify
import AmplifyPlugins
import AWSMobileClient
import AWSAuthUI
import AWSAuthCore


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let identityID = "us-west-2:eff4a95b-bf8f-4fc5-bd73-d60c212d87fd"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // AWS Amplifiy Framework
        let apiPlugin = AWSAPIPlugin(modelRegistration: AmplifyModels())
        do {
            try Amplify.add(plugin: apiPlugin)
            try Amplify.configure()
            print("Amplify initialized")
        } catch {
            print("Failed to configure Amplify \(error)")
        }
        
        UITabBar.appearance().tintColor = .red
        
        //AWS S3 Bucket
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.USWest2,identityPoolId:identityID)
        let configuration = AWSServiceConfiguration(region:.USWest2, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        return true

    }
}

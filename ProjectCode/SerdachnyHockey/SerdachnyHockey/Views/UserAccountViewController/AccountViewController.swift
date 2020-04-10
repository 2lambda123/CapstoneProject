/*

 Program Name: AccountViewController.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan/Mckenzie Busenius

 Description:
               The purpose of this program is to integrate with AWS S3 authentication and UI.

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import AWSMobileClient
import AWSAuthUI
import AWSAuthCore

class AccountViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
  
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        
        // User state status initialization
        AWSMobileClient.default().initialize { (userState, error) in
            if let userState = userState {
                print("UserState: \(userState.rawValue)")
            } else if let error = error {
                print("error: \(error.localizedDescription)")
            }
        }
        
        // User sign in UI
        AWSMobileClient.default()
            .showSignIn(navigationController: self.navigationController!,
                             signInUIOptions: SignInUIOptions(
                                   canCancel: true,
                                   logoImage: UIImage(named: "logo"),
                                   backgroundColor: UIColor(rgb: 0xFFFFFF, alphaVal: 0.2))) { (signInState, error) in
                                    //handle results and errors
                                        if let signInState = signInState {
                                            print("Sign in flow completed: \(signInState)")
                                            
                                            let storyboard = UIStoryboard(name:"UserAccount",bundle: nil)
                                            
                                            let controller = storyboard.instantiateViewController(withIdentifier: "MyAccount") as! MyAccountViewController
                                            
                                            self.navigationController?.pushViewController(controller, animated: true)
                                            
                                        } else if let error = error {
                                            print("error logging in: \(error.localizedDescription)")
                                        }
        }
        
        // User sign up
        AWSMobileClient.default().signUp(username: "your_username",
                                password: "Abc@123!",
                                    userAttributes: ["email":"john@doe.com", "phone_number": "1973123456"]) { (signUpResult, error) in
            if let signUpResult = signUpResult {
                switch(signUpResult.signUpConfirmationState) {
                case .confirmed:
                    print("User is signed up and confirmed.")
                case .unconfirmed:
                    print("User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails!.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails!.destination!)")
                case .unknown:
                    print("Unexpected case")
                }
            } else if let error = error {
                if let error = error as? AWSMobileClientError {
                    switch(error) {
                    case .usernameExists(let message):
                        print(message)
                    default:
                        break
                    }
                }
                print("\(error.localizedDescription)")
            }
        }
        
        // User sign in credentials
        AWSMobileClient.default().signIn(username: "your_username", password: "Abc@123!") { (signInResult, error) in
            if let error = error  {
                print("\(error.localizedDescription)")
            } else if let signInResult = signInResult {
                switch (signInResult.signInState) {
                case .signedIn:
                    print("User is signed in.")
                case .smsMFA:
                    print("SMS message sent to \(signInResult.codeDetails!.destination!)")
                default:
                    print("Sign In needs info which is not yet supported.")
                }
            }
        }
        
        // User sign in comfirmation
        AWSMobileClient.default().confirmSignIn(challengeResponse: "code_here") { (signInResult, error) in
            if let error = error  {
                print("\(error.localizedDescription)")
            } else if let signInResult = signInResult {
                switch (signInResult.signInState) {
                case .signedIn:
                    print("User is signed in.")
                default:
                    print("\(signInResult.signInState.rawValue)")
                }
            }
        }
        
        // User sign out
        AWSMobileClient.default().signOut()
        
    }
    
}

// customize UI color with hex value
extension UIColor{
    convenience init(rgb: UInt, alphaVal: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: alphaVal
        )
    }
}

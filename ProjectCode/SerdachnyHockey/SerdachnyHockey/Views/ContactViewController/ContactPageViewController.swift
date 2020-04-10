/*

 Program Name: ContactInfoTableViewCell.swift
 Application Name: SerdachnyHockey
 Author: Jinkai Fan

 Description:
               1. The purpose of this program is to configure ways of contact(phone, facebook, twitter, instagram).
               2. For social media, just redirect to related webpage.
               3. Email message protocol function is to allow user to write, send message.

 Copyright © 2020 Prime Software. All rights reserved.

*/

import UIKit
import MessageUI
import SafariServices
import CallKit

class ContactPageViewController: UIViewController, MFMailComposeViewControllerDelegate,UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var contactInfoTable: UITableView!
    
    
    // outlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    
    
    
    let contactLabel = ["By Phone","By Facebook","By Twitter","By Instagram"]
    
    let contactImage = [UIImage(named:"phone-icon-2"),UIImage(named:"facebook"),UIImage(named:"twitter"),UIImage(named:"instagram-sketched")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // sending mail format function

    @IBAction func sendButton(_ sender: Any) {
        
        let toRecipients = ["andy188138@163.com"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        mc.setToRecipients(toRecipients)
        mc.setSubject(nameField.text!)
        
        mc.setMessageBody("Name: \(nameField.text!) \n\nPhone: \(phoneField.text!) \n\nEmail: \(emailField.text!) \n\nSubject of Inquiry: \(subjectField.text!) \n\nMessage: \(messageField.text!)", isHTML: false)
        
        self.present(mc, animated: true, completion: nil)
    }
    
    
    // keyboard dismiss action
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.resignFirstResponder()
    }
    
    
    // get actions status from user while sending message
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
            
        case MFMailComposeResult.failed.rawValue:
            print("Failed")
            
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
            
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
            
        default:
            break
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return contactLabel.count
        }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let contactTableCell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactInfoTableViewCell
            contactTableCell.contactInfoLabel.text = contactLabel[indexPath.row]
            contactTableCell.contactInfoImage.image = contactImage[indexPath.row]
            
        
            return contactTableCell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 0)
        {
        }
        
        if(indexPath.row == 1)
        {
            let linkToFacebookURL = "https://www.facebook.com/serdachnyhockey"
            let url = URL(string: linkToFacebookURL)
            let SafariVC = SFSafariViewController(url: url!)
            
            present(SafariVC, animated: true, completion: nil)
        }
        
        if(indexPath.row == 2)
        {
            let linkToTwitterURL = "https://twitter.com/serdachnyhockey"
            let url = URL(string: linkToTwitterURL)
            let SafariVC = SFSafariViewController(url: url!)
            
            present(SafariVC, animated: true, completion: nil)
        }
        
        
        if(indexPath.row == 3)
        {
            let linkToInstagramURL = "https://www.instagram.com/serdachnyhockey/"
            let url = URL(string: linkToInstagramURL)
            let SafariVC = SFSafariViewController(url: url!)
            
            present(SafariVC, animated: true, completion: nil)
        }
        
    }
    
    
    
    
}

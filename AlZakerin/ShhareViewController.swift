//
//  ShhareViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 12/13/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit
import MessageUI

class ShhareViewController: UIViewController , MFMailComposeViewControllerDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor (red: 187/255, green: 149/255, blue: 102/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.white
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func shareEmailButtonPressed(_ sender: UIButton) {
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setSubject("الذاكرين")
        mailVC.setMessageBody("Al Zakerine", isHTML: false)
        mailVC.setToRecipients(["alzakerineapp@hotmail.com"])
        present(mailVC, animated: true, completion: nil)
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case MFMailComposeResult.cancelled:
            
            break
        case MFMailComposeResult.saved:
            break
        case MFMailComposeResult.sent:
            break
        case MFMailComposeResult.failed:
            break
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
    
}

//
//  SplashScreenViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 1/2/17.
//  Copyright © 2017 Zeinab. All rights reserved.
//

import UIKit
import SVProgressHUD
class SplashScreenViewController: UIViewController {
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if (defaults.object(forKey: "QuraanIsSaved") != nil) {
            downloadQuraan()
        }else{
            defaults.set(false, forKey: "QuraanIsSaved")
            downloadQuraan()
        }
        
    }
    func downloadQuraan() {
        if ((defaults.object(forKey: "QuraanIsSaved") as! Bool) == false) {
            
            if Utilities.isConnectedToNetwork() {
                SVProgressHUD.show(withStatus: "Downloading Content")
                UIApplication.shared.beginIgnoringInteractionEvents()
                DataManager.sharedInstance.getFullQuraan { (success, quraan, error) in
                    SVProgressHUD.dismiss()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    if success! {
                        if quraan != nil{
                            self.performSegue(withIdentifier: "startSegue", sender: self)
                        }else{
                            print("quraan is nil")
                        }
                    }
                    else {
                        print("Error Occured in getting quraan")
                    }
                }
            }else{
                showSimpleAlertView(title: "Ooops", message: "Please check your internet Connection", withPresneter: self, withCompletionHandler: nil)
            }
        }else{//Object is Saved already
            OperationQueue.main.addOperation({
                self.performSegue(withIdentifier: "startSegue", sender: self)
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

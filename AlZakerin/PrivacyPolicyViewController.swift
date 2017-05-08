//
//  PrivacyPolicyViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/28/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {

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
    }
}

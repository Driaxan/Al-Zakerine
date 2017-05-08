//
//  ShareViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/28/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor (red: 184/255, green: 113/255, blue: 45/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()

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

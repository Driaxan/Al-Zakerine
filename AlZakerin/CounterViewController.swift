//
//  CounterViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/28/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {

    @IBOutlet weak var counterButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var y = 0

    override func viewWillAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        
        if defaults.object(forKey: "counter") != nil {
       counterLabel.text =  UserDefaults.standard.object(forKey: "counter") as? String
        }
    }
   
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
    @IBAction func counterButtonPressed(_ sender: UIButton) {
        
        y = Int(counterLabel.text!)!
        y += 1
        counterLabel.text! = String(y)
        print(counterLabel.text!)

    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        counterLabel.text = "0"
    }
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(counterLabel.text, forKey: "counter")
        defaults.synchronize()
    }
}

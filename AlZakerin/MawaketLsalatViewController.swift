//
//  MawaketLsalatViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/28/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class MawaketLsalatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mawaketTableView: UITableView!
    @IBOutlet weak var mawaketView: UIView!
    @IBOutlet weak var defaultLabel: UILabel!
    @IBOutlet weak var mawaketSwitch: UISwitch!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    let mawaketArray = ["منتصف الّليل","الفجر","الشروق","الظهر","العصر","المغرب","العشاء"]
    //let timeArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor (red: 187/255, green: 149/255, blue: 102/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.white

        self.mawaketTableView.delegate = self
        self.mawaketTableView.dataSource = self
        
        mawaketTableView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        mawaketView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        defaultLabel.textColor = UIColor.white
        defaultLabel.text = "التّوقيت الافتراضي"
        mawaketSwitch.isOn = UserDefaults.standard.bool(forKey: "switchState")
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    

        // MARK: -TableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mawaketCell = mawaketTableView.dequeueReusableCell(withIdentifier: "idMawaketCell") as! MawaketLsalatTableViewCell
        mawaketCell.backgroundColor = UIColor.clear
        mawaketCell.mawaketLabel.text = mawaketArray[indexPath.row]
        mawaketCell.mawaketLabel.textColor = UIColor.white
        mawaketCell.timingLabel.textColor = UIColor.white
        mawaketCell.timingLabel.text = "10"
        print("First")
        if mawaketSwitch.isOn {
            mawaketCell.timingStepper.isEnabled = false
            mawaketCell.timingStepper.tintColor = UIColor.gray
        }
        else {
            mawaketCell.timingStepper.isEnabled = true
            mawaketCell.timingStepper.tintColor = UIColor.white
            mawaketCell.timingStepper.addTarget(self, action: #selector(timingStepperChanged), for: .valueChanged)

        }
        
        return mawaketCell
    }
    // MARK: -TableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func mawaketSwitchTapped(_ sender: UISwitch) {
        mawaketTableView.reloadData()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(mawaketSwitch.isOn, forKey: "switchState")
        
    }
    
    func timingStepperChanged(_ sender : UIStepper) {
        
    }
    
    

}

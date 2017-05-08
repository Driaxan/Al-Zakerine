//
//  SideMenueViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/27/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class SideMenueViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var sideMenueTableView: UITableView!
    
    
    let labelArray = ["الصّفحة الأساسيّة","مواقيت الصلاة","المسبحة","البوصلة","سياسة الخصوصية","شارك","حول التطبيق"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenueTableView.delegate = self
        self.sideMenueTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sideMenueCell = sideMenueTableView.dequeueReusableCell(withIdentifier: "idSideMenueCell") as! SideMenueTableViewCell
        sideMenueCell.sideMenueLabel.text = labelArray[indexPath.row]
        
        return sideMenueCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }
        if indexPath.row == 1 {
            
        }
        if indexPath.row == 2 {
            
        }
        switch indexPath.row {
        case 0 :
            performSegue(withIdentifier: "showMain", sender: self)
        case 1 :
            performSegue(withIdentifier: "showMawaket", sender: self)
        case 2 :
            performSegue(withIdentifier: "showCounter", sender: self)
        case 3 :
            performSegue(withIdentifier: "showGPS", sender: self)
        case 4 :
            performSegue(withIdentifier: "showPolicy", sender: self)
        case 5 :
            performSegue(withIdentifier: "showShare", sender: self)
        case 6 :
            performSegue(withIdentifier: "showAbout", sender: self)
        default :
            break
        }
        
    }


}

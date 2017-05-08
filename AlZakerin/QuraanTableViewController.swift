//
//  FavoritesTableViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/25/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class QuraanTableViewController: UITableViewController {
    var quraanObj : Quraan!
    var surahsArray : [Surah]?
    var surahObjToPass : Surah?
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var errorMessage : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor (red: 184/255, green: 113/255, blue: 45/255, alpha: 1)
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        quraanObj = NSKeyedUnarchiver.unarchiveObject(withFile: DataManager.filePath) as? Quraan
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if quraanObj != nil {
            
            surahsArray = quraanObj.surahsArray
            print(surahsArray!.count)
            return surahsArray!.count + 1
        }else{
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quraanCell = tableView.dequeueReusableCell(withIdentifier: "idQuraanCell") as! QuraanTableViewCell
        let arrayOfSurahInQuraan = quraanObj.surahsArray
        
        if indexPath.row == 0 {
            quraanCell.quraanImage.isHidden = false
            quraanCell.quraanLabel.isHidden = true
            quraanCell.quraanMiniView.isHidden = true
            quraanCell.quraanView.isHidden = true
            quraanCell.quraanImage.image = UIImage(named: "quraan-open.jpg")
            quraanCell.isUserInteractionEnabled = false

        }
        else{
            quraanCell.quraanImage.isHidden = true
            quraanCell.quraanLabel.isHidden = false
            quraanCell.quraanMiniView.isHidden = false
            quraanCell.quraanView.isHidden = false
            quraanCell.quraanLabel.text = arrayOfSurahInQuraan[indexPath.row - 1].nameOfSurah
            quraanCell.isUserInteractionEnabled = true
        }
        return quraanCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 170
        }else {
            return 90.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        surahObjToPass = surahsArray![indexPath.row - 1]
        
        performSegue(withIdentifier: "showSurahVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let surahInstance = segue.destination as! SurahViewController
        surahInstance.surahObjectFromQuraan = surahObjToPass
        
    }
}

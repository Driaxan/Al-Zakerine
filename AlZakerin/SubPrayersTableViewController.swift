//
//  SubPrayersTableViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/30/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class SubPrayersTableViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    //variables grabbed from PrayersViewController
    var tableViewDataSource = [String]()
    var typeOfCategory : String = ""
    var titleTextSP = ""
    var dictOfTheCurrentDay : Dictionary<String,String> = [:]
    var bgImage = ""
    var displayColor = UIColor()
    
    //Variables to send for DouaaViewController
    var textToSend = "Hello"
    let instanceStatics = Statics()
    var finalArray = [String]()
    var titleTextDouaa = ""
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = titleTextSP
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = titleTextSP
        navigationController?.navigationBar.tintColor = UIColor.white

        finalArray = Array(dictOfTheCurrentDay.values)
        
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
        
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource.count + 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let subPrayerCell = tableView.dequeueReusableCell(withIdentifier: "idSubPrayersCell") as! SubPrayersCustomTableViewCell
        subPrayerCell.subPrayersMiniView.backgroundColor = displayColor
        
        //check for the first cell to be the main image
        if indexPath.row == 0 {
            subPrayerCell.subPrayersLabel.isHidden = true
            subPrayerCell.subPrayersMiniView.isHidden = true
            subPrayerCell.subPrayersView.isHidden = true
            subPrayerCell.subPrayersImage.isHidden = false
            subPrayerCell.subPrayersImage.image = UIImage(named: bgImage)
            
        }else {
            subPrayerCell.subPrayersLabel.isHidden = false
            subPrayerCell.subPrayersMiniView.isHidden = false
            subPrayerCell.subPrayersView.isHidden = false
            subPrayerCell.subPrayersImage.isHidden = true
            subPrayerCell.subPrayersLabel.text = tableViewDataSource[indexPath.row - 1]
            
        }
                
        return subPrayerCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
        return 170.0
        }else {
            return 90.0
        }
    }
    
    // Make the first cell unclickable
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            return nil
        }else {
           return indexPath
        }
    }
    
    // MARK : -TableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var returnedDict = [Int:String]()
        if typeOfCategory == "adeyatAyam" {
            returnedDict = instanceStatics.setupAlayamDict()
            textToSend = returnedDict[indexPath.row - 1]! 
            titleTextDouaa = tableViewDataSource[indexPath.row - 1]

        }
        else if typeOfCategory == "monajayat" {
            returnedDict = instanceStatics.setupMonajat()
            textToSend = returnedDict[indexPath.row - 1]! 
            titleTextDouaa = tableViewDataSource[indexPath.row - 1]

        }
        else if typeOfCategory == "ziyarat" {
            returnedDict = instanceStatics.setupZiyarat()
            textToSend = returnedDict[indexPath.row - 1]! 
            titleTextDouaa = tableViewDataSource[indexPath.row - 1]

        }
        else if typeOfCategory == "salawat" {
            returnedDict = instanceStatics.setupSalawatDict()
            textToSend = returnedDict[indexPath.row - 1]! 
            titleTextDouaa = tableViewDataSource[indexPath.row - 1]

        }
        else if typeOfCategory == "taaqibat" {
            returnedDict = instanceStatics.setupTaaqibat()
            textToSend = returnedDict[indexPath.row - 1]! 
            titleTextDouaa = tableViewDataSource[indexPath.row - 1]

        }
        else if typeOfCategory == "others" {
            returnedDict = instanceStatics.setupDouaa()
            textToSend = returnedDict[indexPath.row - 1]! 
            titleTextDouaa = tableViewDataSource[indexPath.row - 1]

        }
        else {
            textToSend = finalArray[indexPath.row - 1]
            titleTextDouaa = tableViewDataSource[indexPath.row - 1]
        }
        performSegue(withIdentifier: "showDouaaViewController", sender: self)
        
    }
    
    // MARK : -PrepareForSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let instanceDouaa = segue.destination as! DouaaViewController
        instanceDouaa.textViewText = textToSend
        instanceDouaa.titleTextOfDouaa = titleTextDouaa
    }
    
    
}

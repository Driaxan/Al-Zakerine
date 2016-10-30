//
//  AlyawmViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/17/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class AlyawmViewController: UITableViewController {

    @IBOutlet weak var alyawmTableView: UITableView!
    var currentdayLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alyawmTableView.delegate = self
        self.alyawmTableView.dataSource = self
        
        setupDate()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let alyawmCell : AlyawmTableViewCell = alyawmTableView.dequeueReusableCellWithIdentifier("idAlyawmCell") as! AlyawmTableViewCell
        alyawmCell.backgroundColor = UIColor (red: 128, green: 0, blue: 0, alpha: 1)
        alyawmCell.alyawmView.backgroundColor = colors[indexPath.row]

        return alyawmCell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func setupAlyawmView () {
        
    }
    
    func setupDate() {
        currentdayLabel = UILabel()

        let currentDate = NSDate()
        let thisDay = currentDate.dayOfTheWeek()
        
        if thisDay == "الاثنين" {
            titleLabel.text = "يوم الإثنين"
        }
        else if thisDay == "الثلاثاء" {
            titleLabel.text = "يوم الثلاثاء"
        }
        else if thisDay == "الاربعاء" {
            titleLabel.text = "يوم الأربعاء"
        }
        else if thisDay == "الخميس" {
            titleLabel.text = " يوم الخميس"
        }
        else if thisDay == "الجمعة" {
            titleLabel.text = "يوم الجمعة"
        }
        else if thisDay == "السبت" {
            titleLabel.text = "يوم السبت"
        }
        else if thisDay == "الاحد" {
            titleLabel.text = "يوم الأحد"
        }
       
        
    }
   

}

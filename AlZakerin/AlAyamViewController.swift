//
//  AlAyamViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 9/28/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit
var alayam = ""

class AlAyamViewController: UITableViewController {
    
    @IBOutlet weak var alayamTableView: UITableView!
    let alAyamArray = ["دعاء يوم الإثنين ","دعاء يوم الثلاثاء","دعاء يوم الأربعاء","دعاء يوم الخميس","دعاء يوم الجمعة","دعاء يوم السبت","دعاء يوم الأحد"]
    
    
    var fromStatic = Statics()
    override func viewWillAppear(animated: Bool) {
        titleLabel.text = "أدعية الأيام"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alayamTableView.delegate = self
        self.alayamTableView.dataSource = self
        titleLabel.text = "أدعية الأيام"

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let alayamCell : AlAyamTableViewCell = alayamTableView.dequeueReusableCellWithIdentifier("idAlAyamCell") as! AlAyamTableViewCell
        alayamCell.alayamView.backgroundColor = colors[indexPath.row]
        alayamCell.alayamLabel.text = alAyamArray[indexPath.row]
        return alayamCell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            alayam = fromStatic.mondayDouaa
            titleLabel.text = "دعاء يوم لإثنين"
            self.performSegueWithIdentifier("showAlAyamTwoViewController", sender: self)
        }
        else if indexPath.row == 1 {
            alayam = fromStatic.tuesdayDouaa
            titleLabel.text = "دعاء يوم الثلاثاء"
            self.performSegueWithIdentifier("showAlAyamTwoViewController", sender: self)
        }
        else if indexPath.row == 2 {
            alayam = fromStatic.wednesdayDouaa
            titleLabel.text = "دعاء يوم الأربعاء"
            self.performSegueWithIdentifier("showAlAyamTwoViewController", sender: self)
        }

        else if indexPath.row == 3 {
            alayam = fromStatic.thursdayDouaa
            titleLabel.text = "دعاء يوم الخميس"
            self.performSegueWithIdentifier("showAlAyamTwoViewController", sender: self)
        }

        else if indexPath.row == 4 {
            alayam = fromStatic.fridayDouaa
            titleLabel.text = "دعاء يوم الجمعة"
            self.performSegueWithIdentifier("showAlAyamTwoViewController", sender: self)
        }

        else if indexPath.row == 5 {
            alayam = fromStatic.saturdayDouaa
            titleLabel.text = "دعاء يوم السبت"
            self.performSegueWithIdentifier("showAlAyamTwoViewController", sender: self)
        }

        else {
            alayam = fromStatic.sundayDouaa
            titleLabel.text = "دعاء يوم الأحد"
            self.performSegueWithIdentifier("showAlAyamTwoViewController", sender: self)
        }

    }

}

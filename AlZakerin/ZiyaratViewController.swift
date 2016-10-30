//
//  ZiyaratViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/10/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

var ziyara = ""

class ZiyaratViewController: UITableViewController {

    @IBOutlet weak var ziyaratTableView: UITableView!
    let ziyaratArray = ["الإثنين: زيارة الحسن و الحسين (ع س)","الثلاثاء: زيارة زين العابدين، محمد الباقر،  جعفر الصادق(ع س)","الأربعاء: زيارة موسى الكاظم، علي الرضا، محمد الجواد، علي الهادي(ع س)","الخميس: زيارة الحسن العسكري(ع س)","الجمعة: زيارة المهدي المنتظر(عج)","السبت: زيارة رسول اللّه(صل)","الأحد: زيارة علي و فاطمة(ع س)","زيارة عاشوراء","زيارة وارث","زيارة آل ياسين","الزيارة الجامعة"]
    let fromStatics = Statics()
    
    override func viewWillAppear(animated: Bool) {
        titleLabel.text = "زيارات المعصومين"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "زيارات المعصومين"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let ziyaratCell : ZiyaratTableViewCell = ziyaratTableView.dequeueReusableCellWithIdentifier("idZiyaratCell") as! ZiyaratTableViewCell
        
        ziyaratCell.ziyaratView.backgroundColor = colors[indexPath.row]
        ziyaratCell.ziyaratLabel.text = ziyaratArray[indexPath.row]
        return ziyaratCell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            ziyara = fromStatics.zeyaratMon
            titleLabel.text = "يوم الإثنين"
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        else if indexPath.row == 1 {
            ziyara = fromStatics.zeyaratTues
            titleLabel.text = "يوم الثلاثاء"
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        else if indexPath.row == 2 {
            ziyara = fromStatics.zeyaratWed
            titleLabel.text = "يوم الأربعاء"
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        else if indexPath.row == 3 {
            ziyara = fromStatics.zeyaratThur
            titleLabel.text = "يوم الخميس"
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        else if indexPath.row == 4 {
            ziyara = fromStatics.zeyaratFri
            titleLabel.text = "يوم الجمعة"
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        else if indexPath.row == 5 {
            ziyara = fromStatics.zeyaratSat
            titleLabel.text = "يوم السبت"
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        else if indexPath.row == 6 {
            ziyara = fromStatics.zeyaratSun
            titleLabel.text = "يوم الأحد"
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        else if indexPath.row == 7 {
            ziyara = fromStatics.zeyaratAshouraa
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        else if indexPath.row == 8 {
            ziyara = fromStatics.zeyaratWareth
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        else if indexPath.row == 9 {
            ziyara = fromStatics.zeyaratAlYassine
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        else {
            ziyara = fromStatics.zeyaraAlJame3a
            performSegueWithIdentifier("showZiyaratTwoViewController", sender: self)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

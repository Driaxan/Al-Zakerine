//
//  SalawatViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/10/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit
var salat = ""

class SalawatViewController: UITableViewController {

    @IBOutlet weak var salawatTableView: UITableView!
    let salawatArray = ["صلاة جعفر الطيار","صلاة الرزق","صلاة الليل","صلاة الآيات","صلاة الرسول الأكرم","صلاة أمير المؤمنين","صلاة السيدة فاطمة","صلاة الإمام الحسن","صلاة الإمام الحسين","صلاة الامام زين العابدين","صلاة الإمام محمد الباقر","صلاة الإمام جعفر الصادق","صلاة الإمام موسى الكاظم","صلاة الإمام علي الرضا","صلاة الإمام محمد الجواد","صلاة الامام علي الهادي","صلاة الإمام الحسن العسكري","صلاة الإمام المهدي"]
    let fromStatics = Statics()
    
    override func viewWillAppear(animated: Bool) {
        titleLabel.text = "صلوات"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.salawatTableView.delegate = self
        self.salawatTableView.dataSource = self
        titleLabel.text = "صلوات"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let salawatCell : SalawatTableViewCell = salawatTableView.dequeueReusableCellWithIdentifier("idSalawatCell") as! SalawatTableViewCell
        salawatCell.salawatView.backgroundColor = colors[indexPath.row]
        salawatCell.salawatLabel.text = salawatArray[indexPath.row]
        return salawatCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            salat = fromStatics.jaafarLTayar
            titleLabel.text = "صلاة جعفر الطيار"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 1 {
            salat = fromStatics.salatAlRizk
            titleLabel.text = "صلاة الرزق"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 2 {
            salat = fromStatics.salatAlLayl
            titleLabel.text = "صلاة الليل"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 3 {
            salat = fromStatics.salatAlAyat
            titleLabel.text = "صلاة الآيات"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 4 {
            salat = fromStatics.salatLNabi
            titleLabel.text = "صلاة الرسول الأكرم"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 5 {
            salat = fromStatics.salatLAmir
            titleLabel.text = " صلاة امير المؤمنين"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 6 {
            salat = fromStatics.salatFatima
            titleLabel.text = "صلاة السيدة فاطمة"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 7 {
            salat = fromStatics.salatLHassan
            titleLabel.text = "صلاة الإمام الحسن"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 8 {
            salat = fromStatics.salatLHusen
            titleLabel.text = "صلاة الإمام الحسين"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 9 {
            salat = fromStatics.salatZeinAlAbiden
            titleLabel.text = "صلاة الامام زين العابدين"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 10 {
            salat = fromStatics.salatMohamadLBkqer
            titleLabel.text = "صلاة الإمام محمد الباقر"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 11 {
            salat = fromStatics.salatJaafarLSadeq
            titleLabel.text = "صلاة الإمام جعفر الصادق"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 12 {
            salat = fromStatics.salatMousaLKazem
            titleLabel.text = "صلاة الإمام موسى الكاظم"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 0 {
            salat = fromStatics.salatAliLRida
            titleLabel.text = "صلاة الإمام علي الرضا"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 0 {
            salat = fromStatics.salatMohamadLJawad
            titleLabel.text = "صلاة الإمام محمد الجواد"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 0 {
            salat = fromStatics.salatAliLHadi
            titleLabel.text = "صلاة الامام علي الهادي"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else if indexPath.row == 0 {
            salat = fromStatics.salatHassanLAskari
            titleLabel.text = "صلاة الإمام الحسن العسكري"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        else {
            salat = fromStatics.salatAlMahdi
            titleLabel.text = "صلاة الإمام المهدي"
            performSegueWithIdentifier("showSalawatTwoViewController", sender: self)
        }
        
        
    }
    

}

//
//  DouaaViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/12/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit
var douaa = ""

class DouaaViewController: UITableViewController {

    @IBOutlet weak var douaaTableView: UITableView!
    let douaaArray = ["دعاء العهد","دعاء الصباح","دعاء كميل","دعاء العشرات","دعاء السمات","دعاء المشلول","دعاء يستشير","دعاء المجير","دعاء التّوسّل","دعاء الجوشن الكبير","دعاء الجوشن الصّغير","دعاء الندبة"]
    let fromStatics = Statics()
    
    override func viewWillAppear(animated: Bool) {
        titleLabel.text = "أدعية أخرى"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "أدعية أخرى"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let douaaCell : DouaaTableViewCell = douaaTableView.dequeueReusableCellWithIdentifier("idDouaaCell") as! DouaaTableViewCell
        douaaCell.douaaView.backgroundColor = colors[indexPath.row]
        douaaCell.douaaLabel.text = douaaArray[indexPath.row]
        
        return douaaCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            douaa = fromStatics.douaaAlAhed
            titleLabel.text = "دعاء العهد"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else if indexPath.row == 1 {
            douaa = fromStatics.douaaLSabah
            titleLabel.text = "دعاء الصباح"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else if indexPath.row == 2 {
            douaa = fromStatics.douaaKomail
            titleLabel.text = "دعاء كميل"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else if indexPath.row == 3 {
            douaa = fromStatics.douaaLAsharat
            titleLabel.text = "دعاء العشرات"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else if indexPath.row == 4 {
            douaa = fromStatics.douaaLSemat
            titleLabel.text = "دعاء السمات"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else if indexPath.row == 5 {
            douaa = fromStatics.douaaLMashlol
            titleLabel.text = "دعاء المشلول"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else if indexPath.row == 6 {
            douaa = fromStatics.douaaYestasher
            titleLabel.text = "دعاء يستشير"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else if indexPath.row == 7 {
            douaa = fromStatics.douaaLMojeer
            titleLabel.text = "دعاء المجير"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else if indexPath.row == 8 {
            douaa = fromStatics.douaaLTawasol
            titleLabel.text = "دعاء التّوسّل"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else if indexPath.row == 9 {
            douaa = fromStatics.douaaLJawshanLKabir
            titleLabel.text = "دعاء الجوشن الكبير"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else if indexPath.row == 10{
            douaa = fromStatics.douaaLJawshanLsagher
            titleLabel.text = "دعاء الجوشن الصغير"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }
        else {
            douaa = fromStatics.douaaLNodba
            titleLabel.text = "دعاء الندبة"
            performSegueWithIdentifier("showDouaaTwoViewController", sender: self)
        }

        
    }
    
    
}

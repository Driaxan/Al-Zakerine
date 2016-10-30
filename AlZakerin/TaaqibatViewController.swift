//
//  TaaqibatViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/10/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit
var taaqib = ""

class TaaqibatViewController: UITableViewController {

    @IBOutlet weak var taaqibatTableView: UITableView!
    let taaqibatArray = ["تعقيب صَلاة الصّبح","تعقيب صلاة الظّهر","تعقيب صلاة العَصر","تعقيب صلاة المَغرب","تعقيب صلاة العشاء"]
    let fromStatics = Statics()
    
    override func viewWillAppear(animated: Bool) {
        titleLabel.text = "تعقيبات"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "تعقيبات"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let taaqibatCell : TaaqibatTableViewCell = taaqibatTableView.dequeueReusableCellWithIdentifier("idTaaqibatCell") as! TaaqibatTableViewCell
        taaqibatCell.taaqibatView.backgroundColor = colors[indexPath.row]
        taaqibatCell.taaqibatLabel.text = taaqibatArray[indexPath.row]
        
        return taaqibatCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            taaqib = fromStatics.taaqibSabah
            titleLabel.text = "تعقيب صَلاة الصّبح"
            performSegueWithIdentifier("showTaaqibatTwoViewController", sender: self)
        }
        
        else if indexPath.row == 1 {
            taaqib = fromStatics.taaqibDohor
            titleLabel.text = "تعقيب صلاة الظّهر"
            performSegueWithIdentifier("showTaaqibatTwoViewController", sender: self)
        }
        
        else if indexPath.row == 2 {
            taaqib = fromStatics.taaqib3aser
            titleLabel.text = "تعقيب صلاة العَصر"
            performSegueWithIdentifier("showTaaqibatTwoViewController", sender: self)
        }
        
        else if indexPath.row == 3 {
            taaqib = fromStatics.taaqibMo8reb
            titleLabel.text = "تعقيب صلاة المَغرب"
            performSegueWithIdentifier("showTaaqibatTwoViewController", sender: self)
        }
        
        else {
            taaqib = fromStatics.taaqib3eshaa
            titleLabel.text = "تعقيب صلاة العشاء"
            performSegueWithIdentifier("showTaaqibatTwoViewController", sender: self)
        }
        
    }

    

}

//
//  MonajatViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 9/29/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

var monajat = ""

class MonajatViewController: UITableViewController {

    @IBOutlet weak var tableViewMonajat: UITableView!
    var fromStatic = Statics()
    
        
    var arrayOfMonajat = ["مناجاة التّائِبينَ","مُناجاة الشّاكين ","مُناجاة الخآئِفينَ","مُناجاة الرّاجِين "," مُناجاة الرّاغِبين","مُناجاة الشّاكِرين","مُناجاة المُطيعين للهِ","مُناجاة المُريدين","مُناجاة الُمحبيّن ","مُناجاة المُتوَسِّلين","مُناجاة المُفتقرينْ","مُناجاة العارفين"," مُناجاة الذّاكرينَ","مُناجاة المُعتَصِمين ","مُناجاة الزّاهدين "]
    
    
    override func viewWillAppear(animated: Bool) {
        titleLabel.text = "المناجيات الخمسة عشر"

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "المناجيات الخمسة عشر"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellMonajat : MonajatTableViewCell = tableViewMonajat.dequeueReusableCellWithIdentifier("idMonajatCell") as! MonajatTableViewCell

        cellMonajat.monajatView.backgroundColor = colors[indexPath.row]

        cellMonajat.monajatLabel.text = arrayOfMonajat[indexPath.row]
        
        return cellMonajat
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatTa2eben
            titleLabel.text = "مناجاة التّائِبينَ"
        }
        else if indexPath.row == 1 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatShakin
            titleLabel.text = "مُناجاة الشّاكين"

        }
        else if indexPath.row == 2 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatKha2efen
            titleLabel.text = "مُناجاة الخآئِفينَ"

        }
        else if indexPath.row == 3 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatRajin
            titleLabel.text = "مُناجاة الرّاجِين"

        }
        else if indexPath.row == 4 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatRa8eben
            titleLabel.text = "مناجاة الرّاغِبين"

        }
        else if indexPath.row == 5 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatShakeren
            titleLabel.text = "مناجاة الشّاكِرين"

        }
        else if indexPath.row == 6 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatMote3en
            titleLabel.text = "مناجاة المُطيعين للهِ"

        }
        else if indexPath.row == 7 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatMoreden
            titleLabel.text = "مناجاة المُريدين"

        }
        else if indexPath.row == 8 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatMo7eben
            titleLabel.text = "مناجاة الُمحبيّن"

        }
        else if indexPath.row == 9 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatMotawaselen
            titleLabel.text = "مناجاة المُتوَسِّلين"

        }
        else if indexPath.row == 10 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatMoftakeren
            titleLabel.text = "مناجاة المُفتقرينْ"

        }
        else if indexPath.row == 11 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajat3arefen
            titleLabel.text = "مناجاة العارفين"

        }
        else if indexPath.row == 12 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatZakeren
            titleLabel.text = "مناجاة الذّاكرينَ"

        }
        else if indexPath.row == 13 {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatMo3tasemen
            titleLabel.text = "مناجاة المُعتَصِمين"

        }
        else {
            performSegueWithIdentifier("showMonajatTwoViewController", sender: self)
            monajat = fromStatic.monajatZaheden
            titleLabel.text = "مناجاة الزّاهدين"

        }
        
        
    }
    


}

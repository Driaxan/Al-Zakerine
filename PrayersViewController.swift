//
//  PrayersViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 9/27/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit
var titleLabel = UILabel()
 var colors = [UIColor (red: 130/255, green: 0, blue: 0, alpha: 1), UIColor (red: 120/255, green: 0, blue: 0, alpha: 1),UIColor (red: 110/255, green: 0, blue: 0, alpha: 1),UIColor (red: 100/255, green: 0, blue: 0, alpha: 1),UIColor (red: 90/255, green: 0, blue: 0, alpha: 1),UIColor (red: 80/255, green: 0, blue: 0, alpha: 1),UIColor (red: 70/255, green: 0, blue: 0, alpha: 1),UIColor (red: 65/255, green: 0, blue: 0, alpha: 1),UIColor (red: 60/255, green: 0, blue: 0, alpha: 1),UIColor (red: 55/255, green: 0, blue: 0, alpha: 1),UIColor (red: 50/255, green: 0, blue: 0, alpha: 1),UIColor (red: 45/255, green: 0, blue: 0, alpha: 1),UIColor (red: 40/255, green: 0, blue: 0, alpha: 1),UIColor (red: 35/255, green: 0, blue: 0, alpha: 1),UIColor (red: 30/255, green: 0, blue: 0, alpha: 1),UIColor (red: 25/255, green: 0, blue: 0, alpha: 1),UIColor (red: 20/255, green: 0, blue: 0, alpha: 1),UIColor (red: 15/255, green: 0, blue: 0, alpha: 1)]


class PrayersViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var prayerArray = ["أدعية اليوم","المناجيات الخمسة عشر","زيارات المعصومين","صلوات","تعقيبات","أدعية الايام","أدعية أخرى"]
    @IBOutlet weak var prayerTableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        titleLabel.text = "الأدعية"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prayerTableView.delegate = self
        self.prayerTableView.dataSource = self
        setupPrayerView()
        setupTitleLabel()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prayerArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let prayerCell : PrayerTableViewCell = prayerTableView.dequeueReusableCellWithIdentifier("idPrayerCell") as! PrayerTableViewCell
        prayerCell.prayerCellView.layer.cornerRadius = 10
        //prayerCell.prayerCellRoundView.layer.cornerRadius = 10
        prayerCell.prayerCellLable.text = prayerArray[indexPath.row]
        
        return prayerCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            performSegueWithIdentifier("showAlyawmViewController", sender: self)
            
        }
        else if indexPath.row == 1 {
            performSegueWithIdentifier("showMonajatViewController", sender: self)
        }
        else if indexPath.row == 2 {
            performSegueWithIdentifier("showZiyaratViewController", sender: self)
            
        }
        else if indexPath.row == 3 {
            performSegueWithIdentifier("showSalawatViewController", sender: self)
        }
        else if indexPath.row == 4 {
            performSegueWithIdentifier("showTaaqibatViewController", sender: self)
            
        }
        else if indexPath.row == 5 {
            performSegueWithIdentifier("showAlAyamViewController", sender: self)
        }
        else {
            performSegueWithIdentifier("showDouaaViewController", sender: self)
            
        }
    }
    
    
    func setupPrayerView(){
        // transparent navigation bar
        
//        let bar:UINavigationBar! =  self.navigationController?.navigationBar
//        bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        bar.shadowImage = UIImage()
//        bar.alpha = 0.0
        
//        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
//        changing the color of tab bar
//        tabBarController!.tabBar.tintColor = UIColor.yellowColor()
        
        navigationController?.navigationBar.barTintColor = UIColor (red: 128/255, green: 0, blue: 0, alpha: 0.1)
        tabBarController!.tabBar.barTintColor = UIColor (red: 128/255, green: 0, blue: 0, alpha: 0.3)
        //self.view.backgroundColor = UIColor (red: 128/255, green: 0, blue: 0, alpha: 1)
        
        
    }
    
    func setupTitleLabel() {
        
        
        
        if let navigationBar = self.navigationController?.navigationBar {
            titleLabel.frame = CGRectMake(navigationBar.frame.width/2 - navigationBar.frame.width/4, 0, navigationBar.frame.width/2, navigationBar.frame.height)
            
            titleLabel.text = "الأدعية"
            titleLabel.textAlignment = .Center
            
            navigationBar.addSubview(titleLabel)
        }
    }

    
}

//
//  SubMonthlyViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/21/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class SubMonthlyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var subMonthlyImageView: UIImageView!
    @IBOutlet weak var subMonthlyTableView: UITableView!
    
    var returnedDict : [Int:String]!
    // Data grabbed from Monthly
    var imageFromMonthly = UIImage()
    var colorFromMonthly = UIColor()
    var textTitle = ""
    var arrayOfDouaa = [""]
    
    // Data to be sent to MonthlyDouaaVC
    var monthlyDouaa = ""
    var titleTextDouaa = ""
    
    let instanceStatics = Statics()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = textTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.subMonthlyTableView.delegate = self
        self.subMonthlyTableView.dataSource = self
        subMonthlyImageView.image = imageFromMonthly
        self.navigationItem.title = textTitle
        navigationController?.navigationBar.tintColor = UIColor.white

        
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
    
    // Back Button
    func backButtonItemPressed (_ barButtonItem : UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfDouaa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subMonthlyCell = subMonthlyTableView.dequeueReusableCell(withIdentifier: "idSubMonthlyCell") as! SubMonthlyCellTableViewCell
        subMonthlyCell.subMonthlyLabel.text = arrayOfDouaa[indexPath.row]
        subMonthlyCell.subMonthlyMiniView.backgroundColor = colorFromMonthly
        
        return subMonthlyCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
        
    }
    
    // TableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if textTitle == "رجب" {
            returnedDict = instanceStatics.setupRajab()
            monthlyDouaa = returnedDict[indexPath.row]! as String
            titleTextDouaa = arrayOfDouaa[indexPath.row]
            performSegue(withIdentifier: "showMonthlyDouaa", sender: self)
            
        }else if textTitle == "شعبان" {
            returnedDict = instanceStatics.setupShaaban()
            monthlyDouaa = returnedDict[indexPath.row]! as String
            titleTextDouaa = arrayOfDouaa[indexPath.row]
            performSegue(withIdentifier: "showMonthlyDouaa", sender: self)
            
        }else if textTitle == "رمضان" {
            if indexPath.row == 0 {
                monthlyDouaa = instanceStatics.douaaLEftetah
                titleTextDouaa = arrayOfDouaa[indexPath.row]
                performSegue(withIdentifier: "showMonthlyDouaa", sender: self)
            }
            else if indexPath.row == 1 {
                monthlyDouaa = instanceStatics.tasbe7atL3asher
                titleTextDouaa = arrayOfDouaa[indexPath.row]
                performSegue(withIdentifier: "showMonthlyDouaa", sender: self)
            }
            else if indexPath.row == 2 {
                monthlyDouaa = instanceStatics.ad3eyatL2ayam
                titleTextDouaa = arrayOfDouaa[indexPath.row]
                performSegue(withIdentifier: "showMonthlyDouaa", sender: self)
            }
            else if indexPath.row == 3{
                returnedDict = instanceStatics.setupDouaaLsa7ar()
                titleTextDouaa = arrayOfDouaa[indexPath.row]
                performSegue(withIdentifier: "showRamadan", sender: self)
            }
            else {
                returnedDict = instanceStatics.setupAlKadarDict()
                titleTextDouaa = arrayOfDouaa[indexPath.row]
                performSegue(withIdentifier: "showRamadan", sender: self)
            }
            
        }else if textTitle == "ذو الحجة" {
            returnedDict = instanceStatics.setupThuLHujja()
            monthlyDouaa = returnedDict[indexPath.row]! as String
            titleTextDouaa = arrayOfDouaa[indexPath.row]
            performSegue(withIdentifier: "showMonthlyDouaa", sender: self)
            
        }else if textTitle == "ذو القعدة"{
            returnedDict = instanceStatics.setupThilKeida()
            monthlyDouaa = returnedDict[indexPath.row]! as String
            titleTextDouaa = arrayOfDouaa[indexPath.row]
            performSegue(withIdentifier: "showMonthlyDouaa", sender: self)
        }
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRamadan" {
            let instanceShaherRamadan = segue.destination as! ShaherRamadanViewController
            instanceShaherRamadan.returnedDict = returnedDict as [Int : String]
            instanceShaherRamadan.textTitle = titleTextDouaa
        }
        else {
            let instanceMonthlyDouaa = segue.destination as! MonthlyDouaaViewController
            instanceMonthlyDouaa.monthlyDouaaString = monthlyDouaa
            instanceMonthlyDouaa.monthlyDouaaTitle = titleTextDouaa
        }
    }
    
    
}

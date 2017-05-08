//
//  ShaherRamadanViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/24/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class ShaherRamadanViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var ramadanImageView: UIImageView!
    @IBOutlet weak var ramadanTableView: UITableView!
    
    // Data grabbed from SubMonthly
    var textTitle = ""
    let arrayOfSaharDouaa = ["دعاء أبي حمزة الثّمالي","دعاء البهاء","دعاء يا مفزعي","دعاء يا عدتي"]
    let arrayOfKaderDouaa = ["أعمال عامّة","أعمال اللّيلة التاسعة عشر","أعمال الليلة الواحدة و العشرون","أعمال الليلة الثالثة و العشرون"]
    var returnedDict = [Int:String]()
    
    // Data to be sent to MonthlyDouaaVC
    var monthlyDouaa = ""
    var titleTextDouaa = ""
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = textTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ramadanTableView.delegate = self
        self.ramadanTableView.dataSource = self
        self.navigationItem.title = textTitle
        navigationController?.navigationBar.tintColor = UIColor.white

        // For the side menue button
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if textTitle == "أدعية السّحَر" {
            return arrayOfSaharDouaa.count
        }
        else {
            return arrayOfKaderDouaa.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ramadanCell = ramadanTableView.dequeueReusableCell(withIdentifier: "idRamadanCell") as! ShaherRamadanTableViewCell
        if textTitle == "أدعية السّحَر" {
            ramadanCell.ramadanLabel.text = arrayOfKaderDouaa[indexPath.row]
        }
        else {
            ramadanCell.ramadanLabel.text = arrayOfKaderDouaa[indexPath.row]
        }
        return ramadanCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        monthlyDouaa = returnedDict[indexPath.row]!
        if textTitle == "أدعية السّحَر" {
            titleTextDouaa = arrayOfKaderDouaa[indexPath.row]

        }else{
            titleTextDouaa = arrayOfKaderDouaa[indexPath.row]

        }
        performSegue(withIdentifier: "showDouaaVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let instanceDouaa = segue.destination as! MonthlyDouaaViewController
        instanceDouaa.monthlyDouaaString = monthlyDouaa
        instanceDouaa.monthlyDouaaTitle = titleTextDouaa
    }
}

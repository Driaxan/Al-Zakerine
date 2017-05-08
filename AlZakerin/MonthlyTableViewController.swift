//
//  MonthlyTableViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/13/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class MonthlyTableViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    // Data for the view controller
    let monthlyDictionary : Dictionary <String,[String]> = ["رجب": ["أدعية الليلة الاولى","دعاء أم داوود","ليلة و يوم المبعث"],"شعبان":["أعمال خاصة","ليلة النصف من شعبان"],"رمضان":["دعاء الإفتتاح","التّسبيحات العشر","أدعية الأيام","أدعية السّحَر","ليالي القدر"],"ذو القعدة":["يوم دحو الأرض"],"ذو الحجة":["الأيام العشر الأولى","دعاء ليلة عرفة","دعاء المباهلة","حديث الكساء"]]
    let monthlyImagesArray = ["Imam Ali.jpg","imamMahdi.jpg","ramadan.jpg","kaaba.jpg","ali_rida.jpg"]
    let colorsArray = [UIColor (red: 65/255, green: 106/255, blue: 78/255, alpha: 1),UIColor (red: 86/255, green: 105/255, blue: 132/255, alpha: 1),UIColor (red: 68/255, green: 64/255, blue: 60/255, alpha: 1),UIColor (red: 37/255, green: 81/255, blue: 93/255, alpha: 1),UIColor (red: 42/255, green: 106/255, blue: 125/255, alpha: 1)]
    var imageView = UIImageView ()
    
    // Data to be sent to subMonthlyView..
    var imageToSM = UIImage()
    var titleToSend = ""
    var arrayToSend = [""]
    var viewColor = UIColor()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title =  "أدعية الشهور"
        navigationController?.navigationBar.tintColor = UIColor.white

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleLabelandView()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTitleLabelandView() {
        navigationController?.navigationBar.barTintColor = UIColor (red: 184/255, green: 113/255, blue: 45/255, alpha: 1)
        tabBarController!.tabBar.barTintColor = UIColor (red: 184/255, green: 113/255, blue: 45/255, alpha: 1)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monthlyDictionary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let monthlyCell = tableView.dequeueReusableCell(withIdentifier: "idMonthlyCell") as! MonthlyTableViewCell
        
        monthlyCell.monthlyLabel.text = Array(monthlyDictionary.keys)[indexPath.row]
        monthlyCell.monthlyImage.image = UIImage(named: monthlyImagesArray[indexPath.row])
        monthlyCell.monthlyView.backgroundColor = colorsArray[indexPath.row]
        monthlyCell.monthlyLabel.backgroundColor = colorsArray[indexPath.row]
        return monthlyCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 170.0
    }
    
    // tableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        imageToSM = UIImage(named: monthlyImagesArray[indexPath.row])!
        titleToSend = Array(monthlyDictionary.keys)[indexPath.row]
        arrayToSend = monthlyDictionary[titleToSend]!
        viewColor = colorsArray[indexPath.row]
        performSegue(withIdentifier: "showSubMonthly", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let instanceSubMonthly = segue.destination as! SubMonthlyViewController
        instanceSubMonthly.imageFromMonthly = imageToSM
        instanceSubMonthly.colorFromMonthly = viewColor
        instanceSubMonthly.textTitle = titleToSend
        instanceSubMonthly.arrayOfDouaa = arrayToSend
        
    }
    
    
}

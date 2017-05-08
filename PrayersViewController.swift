//
//  PrayersViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 9/27/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit
class PrayersViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    let instanceStatics = Statics()
    var titleTextP = ""
    
    // Static arrays
    let prayerArray = ["أدعية اليوم","المناجيات الخمسة عشر","زيارات المعصومين","صلوات","تعقيبات","أدعية الايام","أدعية أخرى"]
    let prayerImagesArray = ["quraan.jpg","GirlPrayingCropped.jpg","maqamBlue.jpg","mashhad.jpg","pic2.jpg","quraan.jpg","quraan_by_gada.jpg"]
    let bgColor = [UIColor (red: 103/255, green: 45/255, blue: 1/255, alpha: 1),UIColor (red: 168/255, green: 126/255, blue: 67/255, alpha: 1),UIColor (red: 98/255, green: 128/255, blue: 151/255, alpha: 1),UIColor (red: 79/255, green: 64/255, blue: 57/255, alpha: 1),UIColor (red: 161/255, green: 61/255, blue: 0, alpha: 1),UIColor (red: 103/255, green: 45/255, blue: 1/255, alpha: 1),UIColor (red: 219/255, green: 0, blue: 0, alpha: 1)]
    
    // data to be sent to SubPrayers VC
    var arrayToSend = [String]()
    var typeToSend = String()
    var x : Dictionary<String,String> = [:]
    var imageToSend = ""
    var themeColor = UIColor()
    
    @IBOutlet weak var prayerTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "الأدعية"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prayerTableView.delegate = self
        self.prayerTableView.dataSource = self
        setupPrayerView()
        
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
        return prayerArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prayerCell : PrayerTableViewCell = prayerTableView.dequeueReusableCell(withIdentifier: "idPrayerCell") as! PrayerTableViewCell
        prayerCell.prayerCellLable.text = prayerArray[indexPath.row]
        
        prayerCell.prayerImageView.image = UIImage (named: prayerImagesArray[indexPath.row])
        prayerCell.prayerCellLable.backgroundColor = bgColor[indexPath.row]
        prayerCell.bgview.backgroundColor = bgColor[indexPath.row]
        
        return prayerCell
    }
    
    func dayOfTheWeek() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "ar_LB")
        return dateFormatter.string(from: currentDate)
        
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            x = instanceStatics.setupAlyawmDict(dayOfTheWeek())
            arrayToSend = Array(x.keys)
            titleTextP = dayOfTheWeek()
            typeToSend = "adeyatAlyawm"
            
            
        case 1 :
            arrayToSend = ["مناجاة التّائِبينَ","مُناجاة الشّاكين ","مُناجاة الخآئِفينَ","مُناجاة الرّاجِين "," مُناجاة الرّاغِبين","مُناجاة الشّاكِرين","مُناجاة المُطيعين للهِ","مُناجاة المُريدين","مُناجاة الُمحبيّن ","مُناجاة المُتوَسِّلين","مُناجاة المُفتقرينْ","مُناجاة العارفين"," مُناجاة الذّاكرينَ","مُناجاة المُعتَصِمين ","مُناجاة الزّاهدين "]
            titleTextP = prayerArray[1]
            typeToSend = "monajayat"
        case 2 :
            arrayToSend = ["الإثنين: زيارة الإمامين الحسن و الحسين (ع س)","الثلاثاء: زيارة الإمام زين العابدين، محمد الباقر،  جعفر الصادق(ع س)","الأربعاء: زيارة الإمام موسى الكاظم، علي الرضا، محمد الجواد، علي الهادي(ع س)","الخميس: زيارة الإمام الحسن العسكري(ع س)","الجمعة: زيارة الإمام المهدي المنتظر(عج)","السبت: زيارة رسول اللّه(صل)","الأحد: زيارة الإمام علي والسيدة فاطمة(ع س)","زيارة عاشوراء","زيارة وارث","زيارة آل ياسين","الزيارة الجامعة","زيارة أمين اللّه"]
            titleTextP = prayerArray[2]
            typeToSend = "ziyarat"
            
        case 3 :
            arrayToSend = ["صلاة جعفر الطيار","صلاة الرزق","صلاة الليل","صلاة الآيات","صلاة الرسول الأكرم","صلاة أمير المؤمنين","صلاة السيدة فاطمة","صلاة الإمام الحسن","صلاة الإمام الحسين","صلاة الامام زين العابدين","صلاة الإمام محمد الباقر","صلاة الإمام جعفر الصادق","صلاة الإمام موسى الكاظم","صلاة الإمام علي الرضا","صلاة الإمام محمد الجواد","صلاة الامام علي الهادي","صلاة الإمام الحسن العسكري","صلاة الإمام المهدي"]
            titleTextP = prayerArray[3]
            typeToSend = "salawat"
            
        case 4 :
            arrayToSend = ["تعقيب صَلاة الصّبح","تعقيب صلاة الظّهر","تعقيب صلاة العَصر","تعقيب صلاة المَغرب","تعقيب صلاة العشاء"]
            titleTextP = prayerArray[4]
            typeToSend = "taaqibat"
        case 5 :
            arrayToSend = ["دعاء يوم الإثنين ","دعاء يوم الثلاثاء","دعاء يوم الأربعاء","دعاء يوم الخميس","دعاء يوم الجمعة","دعاء يوم السبت","دعاء يوم الأحد"]
            titleTextP = prayerArray[5]
            typeToSend = "adeyatAyam"
            
        case 6:
            arrayToSend = ["دعاء العهد","دعاء الصباح","دعاء كميل","دعاء العشرات","دعاء السمات","دعاء المشلول","دعاء يستشير","دعاء المجير","دعاء التّوسّل","دعاء الجوشن الكبير","دعاء الجوشن الصّغير","دعاء الندبة" ,"دعاء علقمة"]
            titleTextP = prayerArray[6]
            typeToSend = "others"
            
        default: break
            
        }
        
        themeColor = bgColor[indexPath.row]
        imageToSend = prayerImagesArray[indexPath.row]
        performSegue(withIdentifier: "ShowSubPrayersSegue", sender: self)
    }
    
    
    func setupPrayerView(){
        navigationController?.navigationBar.barTintColor = UIColor (red: 184/255, green: 113/255, blue: 45/255, alpha: 1)
        tabBarController!.tabBar.barTintColor = UIColor (red: 184/255, green: 113/255, blue: 45/255, alpha: 1)
        //(red: 184/255, green: 113/255, blue: 45/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.white

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let instanceSubPrayers = segue .destination as! SubPrayersTableViewController
        instanceSubPrayers.tableViewDataSource = arrayToSend
        instanceSubPrayers.typeOfCategory = typeToSend
        instanceSubPrayers.titleTextSP = titleTextP
        instanceSubPrayers.dictOfTheCurrentDay = x
        instanceSubPrayers.bgImage = imageToSend
        instanceSubPrayers.displayColor = themeColor
    }
    
       
}

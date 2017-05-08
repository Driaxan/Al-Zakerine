//
//  SurahViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 12/30/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class SurahViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var surahTableView: UITableView!
    var surahObjectFromQuraan : Surah!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.surahTableView.delegate = self
        self.surahTableView.dataSource = self
        self.navigationItem.title = surahObjectFromQuraan.nameOfSurah
        surahTableView.estimatedRowHeight = surahTableView.frame.height
        surahTableView.rowHeight = UITableViewAutomaticDimension
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if surahObjectFromQuraan.nameOfSurah == "سورة الفاتحة" {
            return surahObjectFromQuraan.ayahsOfSurah.count
        }else {
        return surahObjectFromQuraan.ayahsOfSurah.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ayahCell = surahTableView.dequeueReusableCell(withIdentifier: "idAyahCell") as! SurahTableViewCell
        
        // in fateha we just substituted the first cell with "بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ"
        if surahObjectFromQuraan.nameOfSurah == "سورة الفاتحة" {
            if indexPath.row == 0 {
                ayahCell.ayahLabel.text = "بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ"
                ayahCell.juz2Label.text! = ""
                ayahCell.ayaImage.isHidden = true
            }else {
                ayahCell.ayahLabel.text = surahObjectFromQuraan.ayahsOfSurah[indexPath.row].textOfAyah
                ayahCell.juz2Label.text! = String(surahObjectFromQuraan.ayahsOfSurah[indexPath.row - 1].numberInSurah!)
                ayahCell.ayaImage.isHidden = false

            }
        }
        // in tawba we add a new cell at the begining
        else if surahObjectFromQuraan.nameOfSurah == "سورة التوبة" {
            if indexPath.row == 0 {
                ayahCell.ayahLabel.text = "بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ"
                ayahCell.juz2Label.text! = ""
                ayahCell.ayaImage.isHidden = true

            }else {
                ayahCell.ayahLabel.text = surahObjectFromQuraan.ayahsOfSurah[indexPath.row - 1].textOfAyah
                ayahCell.juz2Label.text! = String(surahObjectFromQuraan.ayahsOfSurah[indexPath.row - 1].numberInSurah!)
                ayahCell.ayaImage.isHidden = false

            }
        }
        else {
            if indexPath.row == 0 {
                ayahCell.ayahLabel.text = "بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ"
                ayahCell.juz2Label.text! = ""
                ayahCell.ayaImage.isHidden = true

            }
            else if indexPath.row == 1 {
                var aya = surahObjectFromQuraan.ayahsOfSurah[indexPath.row - 1].textOfAyah
               //Separate "...بِسْمِ" in the first aya
                let rangeStart = aya!.range(of: "بِسْمِ")
                let rangeEnd = aya!.range(of: "الرَّحِيمِ")
                if let startLocation = rangeStart?.lowerBound,let endLocation = rangeEnd?.upperBound {
                    aya!.replaceSubrange(startLocation ..< endLocation, with: "")
                }
                ayahCell.ayahLabel.text = aya
                ayahCell.juz2Label.text! = String(surahObjectFromQuraan.ayahsOfSurah[indexPath.row - 1].numberInSurah!)
                ayahCell.ayaImage.isHidden = false

            }else{
                ayahCell.ayahLabel.text = surahObjectFromQuraan.ayahsOfSurah[indexPath.row - 1].textOfAyah
                ayahCell.juz2Label.text! = String(surahObjectFromQuraan.ayahsOfSurah[indexPath.row - 1].numberInSurah!)
                ayahCell.ayaImage.isHidden = false

            }
        }
        ayahCell.ayahLabel.sizeToFit()
        ayahCell.ayahLabel.numberOfLines = 0
        return ayahCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

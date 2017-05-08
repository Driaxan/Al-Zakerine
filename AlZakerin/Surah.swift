//
//  Surah.swift
//  AlZakerin
//
//  Created by Zeinab on 12/26/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import Foundation


class Surah : NSObject{
    
    var numberOfSurah : Int?
    var nameOfSurah : String?
    var englishName : String?
    var englishNameTranslation : String?
    var revelationType : String?
    var ayahsOfSurah = [Ayah]()
    
    init?(numberofsurah : Int?, nameofsurah : String?, englishname : String?, englishnametranslation : String?, revelationtype : String?, ayahsofsurah : [Ayah]){
        
        super.init()
        
        numberOfSurah = numberofsurah
        nameOfSurah = nameofsurah
        englishName = englishname
        englishNameTranslation = englishnametranslation
        revelationType = revelationtype
        ayahsOfSurah = ayahsofsurah
        
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        let theNumberOfSurah = aDecoder.decodeObject(forKey: "numberOfSurah") as! Int
        let theNameOfSurah = aDecoder.decodeObject(forKey: "nameOfSurah") as! String
        let theEnglishName = aDecoder.decodeObject(forKey: "englishName") as! String
        let theEnglishTrans = aDecoder.decodeObject(forKey: "englishNameTranslation") as! String
        let theRevelationType = aDecoder.decodeObject(forKey: "revelationType") as! String
        let theAyahsOfSurahs = aDecoder.decodeObject(forKey: "ayahsOfSurah") as! [Ayah]
        
        self.init(
            numberofsurah : theNumberOfSurah,
            nameofsurah : theNameOfSurah,
            englishname : theEnglishName,
            englishnametranslation : theEnglishTrans,
            revelationtype : theRevelationType,
            ayahsofsurah : theAyahsOfSurahs
        )!
    }
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        aCoder.encode(numberOfSurah, forKey: "numberOfSurah")
        aCoder.encode(nameOfSurah, forKey: "nameOfSurah")
        aCoder.encode(englishName, forKey: "englishName")
        aCoder.encode(englishNameTranslation, forKey: "englishNameTranslation")
        aCoder.encode(revelationType, forKey: "revelationType")
        aCoder.encode(ayahsOfSurah, forKey: "ayahsOfSurah")
    }
    
}

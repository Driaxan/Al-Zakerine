//
//  Ayah.swift
//  AlZakerin
//
//  Created by Zeinab on 12/26/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import Foundation


class Ayah : NSObject {

    var numberOfAyah : Int?
    var textOfAyah : String?
    var numberInSurah : Int?
    var juzOfAyah : Int?
    
    init?(numberofayah : Int?, textofayah : String?, numberinsurah : Int?, juzofayah : Int?){
        
        super.init()
        
        numberOfAyah = numberofayah
        textOfAyah = textofayah
        numberInSurah = numberinsurah
        juzOfAyah = juzofayah
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        let theNumberOfAyah = aDecoder.decodeObject(forKey: "numberOfAyah") as! Int
        let theTextOfAyah = aDecoder.decodeObject(forKey: "textOfAyah") as! String
        let theNumberInSurah = aDecoder.decodeObject(forKey: "numberInSurah") as! Int
        let theJuzOfAyah = aDecoder.decodeObject(forKey: "juzOfAyah") as! Int
        
        self.init(
            numberofayah : theNumberOfAyah,
            textofayah: theTextOfAyah,
            numberinsurah: theNumberInSurah,
            juzofayah: theJuzOfAyah
            )!
    }
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        aCoder.encode(numberOfAyah, forKey: "numberOfAyah")
        aCoder.encode(textOfAyah, forKey: "textOfAyah")
        aCoder.encode(numberInSurah, forKey: "numberInSurah")
        aCoder.encode(juzOfAyah, forKey: "juzOfAyah")
    }
}

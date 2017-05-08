//
//  Quraan.swift
//  AlZakerin
//
//  Created by Zeinab on 12/26/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import Foundation

class Quraan : NSObject, NSCoding{
    
    struct propertyKeys {
        static let surahsArrayKey = "surahsArrayKey"
    }
    
    var surahsArray = [Surah]() // var surahsArray : [Surah]
    
    init(surahsarray : [Surah]!){ // without unrapping
        
        self.surahsArray = surahsarray
        super.init()
    }
    
    // since we inherit from NSObject, we're not a final class -> therefore this initializer must be declared as 'required'
    // it also must be declared as a 'convenience' initializer, because we still have a designated initializer as well
    required convenience init(coder aDecoder: NSCoder) {
        
        let theSurahsArray = aDecoder.decodeObject(forKey: propertyKeys.surahsArrayKey) as! [Surah]
        self.init(
            surahsarray : theSurahsArray
        )
    }
    //Conform to NSCoding
    func encode(with aCoder: NSCoder) {
       aCoder.encode(surahsArray, forKey: propertyKeys.surahsArrayKey)
    }
    

}

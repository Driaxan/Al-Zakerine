//
//  DataManager.swift
//  AlZakerin
//
//  Created by Zeinab on 12/26/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit
import Alamofire

class DataManager: NSObject {

    let baseURL = "http://api.alquran.cloud/quran/quran-simple"
    //MARK: SharedInstance
    class var sharedInstance: DataManager {
        struct Singleton {
            static let instance = DataManager()
        }
        
        return Singleton.instance
    }
    
    static var filePath : String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
        return url.appendingPathComponent("quraanObject").path
    }
    
    func getQuraanObject() -> Quraan? {
        
        return nil
    }


    
    func getFullQuraan(_ completion: @escaping (_ success:Bool?, _ quraan:Quraan? , _ error: Error?) ->Void){
        Alamofire.request(
        URL(string: "\(baseURL)")! ,
        method: .get)
        .validate()
        .responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                print("Error while fetching Quraan: \(response.result.error)")
                completion(false,nil,response.error)
                return
            }
        /*let originalStringUrl = "http://api.alquran.cloud/quran/{{ar.asad}}"
        let encodedString = originalStringUrl .addingPercentEscapes(using: String.Encoding.utf8)
        ServerInterface().getRequest(withBaseURL: encodedString, forFunctionName: nil, functionParameters: nil, andHeaderParameters: nil, withCompletionHandler: {(response) in
         */
            guard let value = response.result.value as? NSDictionary else {
                completion(false, nil, response.error)
                return
            }
            let data = value["data"] as! NSDictionary
            let surahsArray = data.object(forKey: "surahs") as! NSArray
            var surahArr = [Surah]()
            
            for surah in surahsArray {
                
                var ayahsArr = [Ayah]()
                let ayahsArray = (surah as AnyObject).object(forKey: "ayahs") as! NSArray // or let responseAyah
                
                for ayah in ayahsArray {
                    
                    let ayahObj = Ayah(numberofayah: (ayah as AnyObject).object(forKey: "number") as? Int, textofayah: (ayah as AnyObject).object(forKey: "text") as? String, numberinsurah: (ayah as AnyObject).object(forKey: "numberInSurah") as? Int, juzofayah: (ayah as AnyObject).object(forKey: "juz") as? Int)
                    
                    ayahsArr.append(ayahObj!)
                    
                }
                let surahObj = Surah(numberofsurah: (surah as AnyObject).object(forKey: "number") as? Int, nameofsurah: (surah as AnyObject).object(forKey: "name") as? String, englishname: (surah as AnyObject).object(forKey: "englishName") as? String, englishnametranslation: (surah as AnyObject).object(forKey: "englishNameTranslation") as? String, revelationtype: (surah as AnyObject).object(forKey: "revelationType") as? String, ayahsofsurah: ayahsArr)
                
                surahArr.append(surahObj!)
            }
            let quraanObject = Quraan(surahsarray: surahArr)
            NSKeyedArchiver.archiveRootObject(quraanObject, toFile: DataManager.filePath)
            UserDefaults.standard.set(true, forKey: "QuraanIsSaved")
            
            completion(true,quraanObject, nil)
        }
    }
}

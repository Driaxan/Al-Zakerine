//
//  DouaaModel.swift
//  AlZakerin
//
//  Created by Zeinab on 12/8/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//
import AVFoundation
import Foundation
class DouaaModel: NSObject {
    
    // MARK: -Properties
    var title : String?
    var text : String?
    var isFavorite : Bool?
    var uniqueNumber : Int?
    //var audio : AVAudioPlayer?
    
    // MARK: -Initialization
    init?(douaaTitle: String?, douaaText: String?, douaaIsFavorite: Bool?, douaaUniqueNumber: Int?){
//douaaAudio: AVAudioPlayer?) {
        // Initialize stored properties.
        self.title = douaaTitle
        self.text = douaaText
        self.isFavorite = douaaIsFavorite
        self.uniqueNumber = douaaUniqueNumber
        //self.audio = douaaAudio
        
        super.init()
    }
    
    
}
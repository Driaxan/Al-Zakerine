//
//  NSDate+Conversions.swift
//  AlZakerin
//
//  Created by Zeinab on 10/19/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import Foundation

extension NSDate {
    func dayOfTheWeek() -> String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = NSLocale(localeIdentifier: "ar")
        return dateFormatter.stringFromDate(self)
    }
}
//
//  PrayerTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 10/6/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class PrayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var prayerCellView: UIView!
    
    @IBOutlet weak var prayerCellRoundView: UIView!

    @IBOutlet weak var prayerCellLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

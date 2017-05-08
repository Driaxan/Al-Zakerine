//
//  SubPrayersCustomTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 10/30/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class SubPrayersCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var subPrayersView: UIView!
    @IBOutlet weak var subPrayersLabel: UILabel!
    @IBOutlet weak var subPrayersMiniView: UIView!
    @IBOutlet weak var subPrayersImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

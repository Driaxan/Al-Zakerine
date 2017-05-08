//
//  MonthlyTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 11/13/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class MonthlyTableViewCell: UITableViewCell {

    @IBOutlet weak var monthlyLabel: UILabel!
    @IBOutlet weak var monthlyImage: UIImageView!
    @IBOutlet weak var monthlyView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

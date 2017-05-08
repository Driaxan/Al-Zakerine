//
//  SubMonthlyCellTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 11/21/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class SubMonthlyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var subMonthlyView: UIView!
    @IBOutlet weak var subMonthlyMiniView: UIView!
    @IBOutlet weak var subMonthlyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  ZiyaratTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 10/10/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class ZiyaratTableViewCell: UITableViewCell {

    @IBOutlet weak var ziyaratView: UIView!
    
    @IBOutlet weak var ziyaratLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  AlAyamTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 10/9/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class AlAyamTableViewCell: UITableViewCell {

    @IBOutlet weak var alayamView: UIView!
    
    @IBOutlet weak var alayamLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

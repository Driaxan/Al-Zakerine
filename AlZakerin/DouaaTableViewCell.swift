//
//  DouaaTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 10/12/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class DouaaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var douaaView: UIView!

    @IBOutlet weak var douaaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

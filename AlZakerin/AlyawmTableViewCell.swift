//
//  AlyawmTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 10/17/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class AlyawmTableViewCell: UITableViewCell {

    @IBOutlet weak var alyawmView: UIView!
    @IBOutlet weak var alyawmLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

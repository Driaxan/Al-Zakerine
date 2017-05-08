//
//  FavoritesTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 11/25/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class QuraanTableViewCell: UITableViewCell {

    
    @IBOutlet weak var quraanLabel: UILabel!
    @IBOutlet weak var quraanMiniView: UIView!
    @IBOutlet weak var quraanView: UIView!
    @IBOutlet weak var quraanImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

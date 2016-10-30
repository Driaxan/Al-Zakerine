//
//  MonajatTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 10/4/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class MonajatTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var monajatLabel: UILabel!

    @IBOutlet weak var monajatView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func customizedView () {
       
        
    }

}

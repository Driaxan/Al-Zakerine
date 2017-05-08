//
//  MawaketLsalatTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 11/29/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class MawaketLsalatTableViewCell: UITableViewCell {

    @IBOutlet weak var mawaketLabel: UILabel!
    @IBOutlet weak var timingLabel: UILabel!
    @IBOutlet weak var timingStepper: UIStepper!
    var oldValue = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timingStepper.value = 0
        oldValue = timingStepper.value
        print("Second")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func timingStepperChanged(_ sender: UIStepper) {
        if var dblTimingLabel = Double(timingLabel.text!) {
            if sender.value > oldValue {
                oldValue = sender.value
                dblTimingLabel = dblTimingLabel + 1
            }
            else {
                dblTimingLabel = dblTimingLabel - 1
                oldValue = sender.value

            }
            timingLabel.text = String(dblTimingLabel)

        }

    }
}

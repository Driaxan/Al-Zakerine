//
//  SurahTableViewCell.swift
//  AlZakerin
//
//  Created by Zeinab on 12/30/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class SurahTableViewCell: UITableViewCell {

    @IBOutlet weak var ayahLabel: UILabel!
    @IBOutlet weak var juz2Label: UILabel!
    @IBOutlet weak var ayaImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ayahLabel.lineBreakMode = .byWordWrapping
        ayahLabel.numberOfLines = 0
        attributedTextView("Damascus", fontSize : 20.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func attributedTextView( _ font : String, fontSize : CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 30.0
        paragraphStyle.maximumLineHeight = 40.0
        paragraphStyle.minimumLineHeight = 30.0
        paragraphStyle.firstLineHeadIndent = 10.0
        paragraphStyle.paragraphSpacingBefore = 10.0
        
        let atrbts = [NSFontAttributeName: UIFont(name: font, size: fontSize)!, NSParagraphStyleAttributeName : paragraphStyle]
        ayahLabel.attributedText = NSAttributedString(string : ayahLabel.text!, attributes: atrbts)
        ayahLabel.textAlignment = .right
    }

}

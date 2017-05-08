//
//  monthlyDouaaViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/21/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class MonthlyDouaaViewController: UIViewController {
    
    @IBOutlet weak var monthlyTextView: UITextView!
    
    
    // Info Grabbed from SubMonthlyVC & ShaherRamadanVC
    var monthlyDouaaString = ""
    var monthlyDouaaTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = monthlyDouaaTitle
        navigationController?.navigationBar.tintColor = UIColor.white
        attributedTextView("Damascus", fontSize : 30.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.monthlyTextView.setContentOffset(CGPoint.init(x: 0, y: -10), animated: false)
    }
    
    func attributedTextView( _ font : String, fontSize : CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 50.0
        paragraphStyle.maximumLineHeight = 50.0
        paragraphStyle.minimumLineHeight = 50.0
        paragraphStyle.firstLineHeadIndent = 15.0
        paragraphStyle.paragraphSpacingBefore = 10.0
        
        let atrbts = [NSFontAttributeName: UIFont(name: font, size: fontSize)!, NSParagraphStyleAttributeName : paragraphStyle]
        monthlyTextView.attributedText = NSAttributedString(string : monthlyDouaaString, attributes: atrbts)
        monthlyTextView.textAlignment = .right
    }
    
    
}

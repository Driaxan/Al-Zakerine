//
//  DouaaViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/30/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class DouaaViewController: UIViewController {

    @IBOutlet weak var douaaTextView: UITextView!
    
    //Variables ro grab from SubPrayersTableViewController
    var textViewText = String()
    var titleTextOfDouaa = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = titleTextOfDouaa
        navigationController?.navigationBar.tintColor = UIColor.white
        attributedTextView("Damascus", fontSize : 30.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.douaaTextView.setContentOffset(CGPoint.init(x: 0, y: -10), animated: false)
    }
    
    func backButtonItemPressed (_ barButtonItem : UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    // separate between lines and words
    func attributedTextView( _ font : String, fontSize : CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 50.0
        paragraphStyle.maximumLineHeight = 50.0
        paragraphStyle.minimumLineHeight = 50.0
        paragraphStyle.firstLineHeadIndent = 15.0
        paragraphStyle.paragraphSpacingBefore = 10.0
        
        let atrbts = [NSFontAttributeName: UIFont(name: font, size: fontSize)!, NSParagraphStyleAttributeName : paragraphStyle]
        douaaTextView.attributedText = NSAttributedString(string : textViewText, attributes: atrbts)
        douaaTextView.textAlignment = .right
    }
    
}

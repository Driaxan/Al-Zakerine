//
//  MonajatTwoViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/4/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class MonajatTwoViewController: UIViewController {
    
    var monajatTextView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMonajatView()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMonajatView () {
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        monajatTextView = UITextView()
        monajatTextView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + navigationBarHeight, self.view.frame.width, self.view.frame.height - navigationBarHeight)
        monajatTextView.backgroundColor = UIColor.whiteColor()
        monajatTextView.text = monajat
        monajatTextView.textColor = UIColor.blackColor()
        
        let attributes = [ NSFontAttributeName: UIFont(name: "Gurmukhi MN", size: 20.0)!]
        let myMonajat = NSMutableAttributedString(string: monajat, attributes: attributes)
        
        monajatTextView.attributedText = myMonajat
        monajatTextView.textAlignment = NSTextAlignment.Right
        
        self.view.addSubview(monajatTextView)
        

    }
    

}

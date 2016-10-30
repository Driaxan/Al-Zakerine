//
//  SalawatTwoViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/10/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class SalawatTwoViewController: UIViewController {

    var salawatTextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSalawatView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSalawatView () {
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        
        salawatTextView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + navigationBarHeight, self.view.frame.width, self.view.frame.height - navigationBarHeight)
        salawatTextView.backgroundColor = UIColor.whiteColor()
        salawatTextView.textColor = UIColor.blackColor()
        
        let attributes = [ NSFontAttributeName: UIFont(name: "Gurmukhi MN", size: 20.0)!]
        let mySalat = NSMutableAttributedString(string: salat, attributes: attributes)
        
        salawatTextView.attributedText = mySalat
        salawatTextView.textAlignment = NSTextAlignment.Right
        
        self.view.addSubview(salawatTextView)
        
        
    }

    

   
}

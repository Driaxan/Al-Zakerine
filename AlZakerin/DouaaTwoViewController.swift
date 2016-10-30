//
//  DouaaTwoViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/12/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class DouaaTwoViewController: UIViewController {
    var douaaTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDouaaView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupDouaaView () {
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        
        douaaTextView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + navigationBarHeight, self.view.frame.width, self.view.frame.height - navigationBarHeight)
        douaaTextView.backgroundColor = UIColor.whiteColor()
        douaaTextView.textColor = UIColor.blackColor()
        
        let attributes = [ NSFontAttributeName: UIFont(name: "Gurmukhi MN", size: 20.0)!]
        let myDouaa = NSMutableAttributedString(string: douaa, attributes: attributes)
        
        douaaTextView.attributedText = myDouaa
        douaaTextView.textAlignment = NSTextAlignment.Right
        
        self.view.addSubview(douaaTextView)
        
        
    }

   
}

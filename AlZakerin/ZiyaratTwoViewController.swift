//
//  ZiyaratTwoViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/10/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class ZiyaratTwoViewController: UIViewController {
    
    var ziyaratTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupZiyaratView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupZiyaratView () {
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        
        ziyaratTextView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + navigationBarHeight, self.view.frame.width, self.view.frame.height - navigationBarHeight)
        ziyaratTextView.backgroundColor = UIColor.whiteColor()
        ziyaratTextView.text = ziyara
        ziyaratTextView.textColor = UIColor.blackColor()
        
        let attributes = [ NSFontAttributeName: UIFont(name: "Gurmukhi MN", size: 20.0)!]
        let myZiyara = NSMutableAttributedString(string: ziyara, attributes: attributes)
        
        ziyaratTextView.attributedText = myZiyara
        ziyaratTextView.textAlignment = NSTextAlignment.Right
        
        self.view.addSubview(ziyaratTextView)
        
        
    }

    

}

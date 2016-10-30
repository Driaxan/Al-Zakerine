//
//  TaaqibatTwoViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 10/10/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class TaaqibatTwoViewController: UIViewController {
    
    var taaqibatTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTaaqibatView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupTaaqibatView () {
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        
        taaqibatTextView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + navigationBarHeight, self.view.frame.width, self.view.frame.height - navigationBarHeight)
        taaqibatTextView.backgroundColor = UIColor.whiteColor()
        taaqibatTextView.textColor = UIColor.blackColor()
        
        let attributes = [ NSFontAttributeName: UIFont(name: "Gurmukhi MN", size: 20.0)!]
        let myTaaqib = NSMutableAttributedString(string: taaqib, attributes: attributes)
        
        taaqibatTextView.attributedText = myTaaqib
        taaqibatTextView.textAlignment = NSTextAlignment.Right
        
        self.view.addSubview(taaqibatTextView)
        
        
    }

    
    

   

}

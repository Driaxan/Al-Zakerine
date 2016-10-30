//
//  AlAyamTwoViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 9/28/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit


class AlAyamTwoViewController: UIViewController {
    
    
    var alAyamTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAlAyam()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupAlAyam(){
        
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        alAyamTextView = UITextView()
        alAyamTextView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + navigationBarHeight, self.view.frame.width, self.view.frame.height - navigationBarHeight)
        alAyamTextView.backgroundColor = UIColor.whiteColor()
        alAyamTextView.textColor = UIColor.blackColor()
        
        let attributes = [ NSFontAttributeName: UIFont(name: "Damascus", size: 25.0)!]
        let myAlayam = NSMutableAttributedString(string: alayam, attributes: attributes)
        
        alAyamTextView.attributedText = myAlayam
        alAyamTextView.textAlignment = NSTextAlignment.Center
        
        self.view.addSubview(alAyamTextView)
        

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

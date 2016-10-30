//
//  MonthlyViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 9/27/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit

class MonthlyViewController: UIViewController {
    
    var monthlyImage : UIImageView!
    var moharamButton : UIButton!
    var ramadanButton : UIButton!
    var tholhejaButton : UIButton!
    var tholke3daButton : UIButton!
    var shaabanButton : UIButton!
    var rajabButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMonthlyView () {
        
        monthlyImage = UIImageView(frame: self.view.bounds)
        monthlyImage.image = UIImage(named: "white stylize2.jpg")
        
        
        
        self.view.addSubview(monthlyImage)

        
    }
    

    
}

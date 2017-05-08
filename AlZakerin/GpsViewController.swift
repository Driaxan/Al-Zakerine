//
//  GpsViewController.swift
//  AlZakerin
//
//  Created by Zeinab on 11/28/16.
//  Copyright © 2016 Zeinab. All rights reserved.
//

import UIKit
import CoreLocation
class GpsViewController: UIViewController {

    //IBOutlets Connections
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    //Properties
//    var locationMang : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor (red: 187/255, green: 149/255, blue: 102/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.white
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        commingSoonAlert()
    }
    
    func commingSoonAlert(){
        let alert = UIAlertController(
            title: "Comming Soon!",
            message: "",
            preferredStyle: .alert
        )
        //First button in Alert
        alert.addAction(UIAlertAction(
            title: "ok",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
    }
}

        //Create instance from locationManager
//        locationMang = CLLocationManager()
//        locationMang.requestWhenInUseAuthorization()
        
        //Print
//        print("\(CLLocationManager.headingAvailable())")
//        print("\(CLLocationManager .locationServicesEnabled())")
//        
        //Check if heading is available
//        if CLLocationManager.headingAvailable() == false {
//            
//            locationMang = nil
//            let alert = UIAlertController.init(title: "Sorry!", message: "This device does not support ability to measure fields", preferredStyle: .Alert)
//            let alertAction = UIAlertAction.init(title: "OK", style: .Destructive, handler: nil)
//            alert.addAction(alertAction)
//            self.presentViewController(alert, animated: true, completion: nil)
//            
//        }else{
//            locationMang.delegate = self
//            locationMang.headingFilter = kCLHeadingFilterNone
//            locationMang.distanceFilter = kCLHeadingFilterNone
//            locationMang.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationMang.startUpdatingLocation()
//            locationMang.startUpdatingHeading()
//        }
//        if self.revealViewController() != nil {
//            menuButton.target = self.revealViewController()
//            menuButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }
//    }
//    
//    func locationManager(manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
//        // This will print out the direction the device is heading
//        print(heading.magneticHeading)
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    


//
//  Globals.swift
//  AlZakerin
//
//  Created by Hadi Yaacoub on 4/30/17.
//  Copyright © 2017 Zeinab. All rights reserved.
//

import Foundation
import UIKit

func showSimpleAlertView( title: String, message: String, withPresneter presenter: UIViewController, withCompletionHandler handler:(() -> Void)? ) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    OperationQueue.main.addOperation {
        presenter.present(alertController, animated:true) {
            handler?()
        }
    }
}

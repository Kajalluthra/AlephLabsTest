//
//  UIAlertExtension.swift
//  AlephLabsTest
//
//  Created by Kajal on 21/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK:- Alerts
    func showAlertPopUp(message: String) {
        let alertController = UIAlertController(title: Constants.AppName, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}



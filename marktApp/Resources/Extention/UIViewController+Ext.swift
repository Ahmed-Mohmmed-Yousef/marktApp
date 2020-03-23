//
//  UIViewController+Ext.swift
//  marktApp
//
//  Created by Ahmed on 3/23/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

extension UIViewController {
    func shoeAlert(msg: String, _ completion: (() -> ())?){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (alertAction) in
            completion?()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

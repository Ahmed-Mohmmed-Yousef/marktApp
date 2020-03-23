//
//  ShipsToVC.swift
//  marktApp
//
//  Created by Ahmed on 3/22/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class ShipsToVC: UIViewController {

    
    lazy var mainView: ShipsToView = {
        let view = ShipsToView(delegate: self)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = mainView
        self.navigationItem.title = "Ship To"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ShipsToVC : ShipsToViewDelegate{
    func continuAction() {
        if let phone = mainView.phoneRTF.textField.text , !phone.isValidPhone ||
            mainView.nameRTF.textField.text?.count       == 0 ||
            mainView.locationRTF.textField.text?.count  == 0 ||
            mainView.cityRTF.textField.text?.count      == 0 ||
            mainView.regionRTF.textField.text?.count    == 0 ||
            mainView.streetRTF.textField.text?.count    == 0 {
            
            self.shoeAlert(msg: "Please, Fill all field with * , and be sure that your info is reight.", nil)
        } else {
            
        }
        
    }
}

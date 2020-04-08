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
    func openGetLocationVC() {
        let getLocationVC = GetLocationVC()
        getLocationVC.modalPresentationStyle = .fullScreen
        getLocationVC.doneAction = { [weak self] lat, lon in
            guard let self = self else { return }
            if let lat = lat, let lon = lon{
                self.mainView.locationRTF.textField.text = "lat: \(lat) - lon: \(lon)"
                self.mainView.endEditing()
            }
        }
        self.present(getLocationVC, animated: true, completion: nil)
    }
    
    func continuAction() {
        
        if let phone = mainView.phoneRTF.textField.text, phone.isValidPhone,
            let name = mainView.nameRTF.textField.text, name.count != 0,
            let city = mainView.cityRTF.textField.text, city.count != 0,
            let region = mainView.regionRTF.textField.text, region.count != 0,
            let street = mainView.streetRTF.textField.text, street.count != 0,
            let location = mainView.cityRTF.textField.text, location.count != 0 {
            
            UserInfo.name       = name
            UserInfo.phone      = phone
            UserInfo.city       = city
            UserInfo.region     = region
            UserInfo.street     = street
            UserInfo.building   = mainView.buildingRTF.textField.text ?? ""
            UserInfo.floor      = mainView.buildingRTF.textField.text ?? ""
            UserInfo.location   = location
            
            self.showAlert(msg: "Done") {
                let OSVC = OrderSummaryVC()
                self.navigationController?.pushViewController(OSVC, animated: true)
            }
            
        } else {
            self.showAlert(msg: "Please, Fill all field with * , and be sure that your info is reight.", nil)
        }
        
        
    }
}

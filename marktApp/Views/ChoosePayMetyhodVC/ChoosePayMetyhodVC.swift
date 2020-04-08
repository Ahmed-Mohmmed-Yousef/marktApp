//
//  ChoosePayMetyhodVC.swift
//  marktApp
//
//  Created by Ahmed on 4/2/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class ChoosePayMetyhodVC: UIViewController {
    
    private var mainView = ChoosePayMetyhodView()
    
    private var isCach: Bool = false {
        didSet {
            self.updatePayMethodUI()
        }
    }
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        updatePayMethodUI()
    }
    
    private func updatePayMethodUI(){
        mainView.cachBtn.tintColor = isCach ? #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        mainView.cachBtn.setImage(isCach ? #imageLiteral(resourceName: "radio_button_on"): #imageLiteral(resourceName: "radio_button_off"), for: .normal)
        mainView.cardBtn.tintColor = !isCach ? #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        mainView.cardBtn.setImage(!isCach ? #imageLiteral(resourceName: "radio_button_on"): #imageLiteral(resourceName: "radio_button_off"), for: .normal)
    }
}


extension ChoosePayMetyhodVC: ChoosePayMetyhodDelegate{
    func radioBtnPressed(_ isCach: Bool) {
        self.isCach = isCach
    }
    
    func confirmeBtnPressed() {
        self.showAlert(msg: "Done") {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
}

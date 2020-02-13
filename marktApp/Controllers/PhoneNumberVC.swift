//
//  PhoneNumberVC.swift
//  marktApp
//
//  Created by Ahmed on 2/13/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class PhoneNumberVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var phonContainrView: UIView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var phonTF: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backBtnsetup()
        phoneContainersetup()
        continueBtnsetup()
    }
    
    func backBtnsetup(){
        backBtn.backgroundColor = .clear
        backBtn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backBtn.tintColor = .gray
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    @objc func backAction(){
        self.dismiss(animated: true)
    }
    
    func phoneContainersetup(){
        // img setup
        iconImg.image = UIImage(systemName: "phone")
        iconImg.backgroundColor = .clear
        iconImg.tintColor = .gray
        
        // phone text field
        phonTF.tintColor = .gray
        phonTF.delegate = self
        
        // phone container
        phonContainrView.setCorner()
        phonContainrView.setShadow()
    }
    
    func continueBtnsetup(){
        continueBtn.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        continueBtn.setCorner()
        continueBtn.setShadow()
    }
    
    @objc func continueAction(){
        if let phone = phonTF.text , phone.isValidPhone{
            print("isValidPhone")
        } else {
            print("isnotValidPhone")
        }
    }
    
    func checkPhoneNumber(){
        if let phone = phonTF.text{
            if phone.isEmpty{
                iconImg.image = UIImage(systemName: "phone")
            } else if phone.isValidPhone {
                iconImg.image = UIImage(systemName: "checkmark.seal")
                phonContainrView.setValidInput()
            } else {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                iconImg.image = UIImage(systemName: "xmark.seal")
                phonContainrView.setErrorInput()
            }
        }
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkPhoneNumber()
    }
}

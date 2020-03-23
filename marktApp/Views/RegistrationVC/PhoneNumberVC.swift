//
//  PhoneNumberVC.swift
//  marktApp
//
//  Created by Ahmed on 2/13/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class PhoneNumberVC: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var phonContainrView: UIView!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var phonTF: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var bottomConstrain: NSLayoutConstraint!
    
    var doneAction: (() -> ())?
    
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
        print("Back")
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
            let vc = storyboard?.instantiateViewController(identifier: "OTPVC") as! OTPVC
            vc.phoneNumber = phone
            vc.doneAction = {
                if let doneAction = self.doneAction{
                    doneAction()
                }
                print("continueAction")
            }
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        } else {
            //MARK: Alert phone number is`nt valid
            print("isnotValidPhone")
        }
    }
    
    func checkPhoneNumber(){
        if let phone = phonTF.text{
            if phone.isEmpty{
                iconImg.image = UIImage(systemName: "phone")
                phonContainrView.setShadow()
            } else if phone.isValidPhone {
                iconImg.image = UIImage(systemName: "checkmark.seal")
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                phonContainrView.setValidInput()
            } else {
                iconImg.image = UIImage(systemName: "xmark.seal")
                phonContainrView.setErrorInput()
            }
        }
    }
    
    
}


extension PhoneNumberVC: UITextFieldDelegate{
    
    //MARK:- text field Delegates
    func endEditing(){
        bottomConstrain.constant = 50
        view.endEditing(true)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bottomConstrain.constant = 300
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing()
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkPhoneNumber()
    }
}

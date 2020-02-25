//
//  RegistrationVC.swift
//  marktApp
//
//  Created by Ahmed on 2/16/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit


class RegistrationVC: UIViewController {
    

    @IBOutlet weak var nameRTF: ReusedTextFeild!
    @IBOutlet weak var usernameRTF: ReusedTextFeild!
    @IBOutlet weak var emailRTF: ReusedTextFeild!
    @IBOutlet weak var passwordRTF: ReusedTextFeild!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var bottomConstrain: NSLayoutConstraint!
    
    var phoneNumber: String?
    let auth = AuthController()
    var doneAction: (() -> ())?
    
    var wellcomeView: UIView = {
        let wellcomView = UIView()
        wellcomView.translatesAutoresizingMaskIntoConstraints = false
        wellcomView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return wellcomView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameRTFsetup()
        usernameRTFsetup()
        emailRTFsetup()
        passwordRTFsetup()
        continueBtnSetup()
        backBtnsetup()
    }

    func nameRTFsetup(){
        nameRTF.ImageView.image = UIImage(systemName: "person")
        nameRTF.button.isHidden = true
        nameRTF.textFeild.delegate = self
        nameRTF.textFeild.textContentType = .name
        nameRTF.textFeild.placeholder = "Your name"
        nameRTF.tintColor = .gray
        nameRTF.textFeild.fontSetup(style: .Medium, size: 24.0)
        nameRTF.containerView.setCorner()
        nameRTF.containerView.setBorder()
        nameRTF.containerView.setShadow()
        
    }
    
    func usernameRTFsetup(){
        usernameRTF.ImageView.image = UIImage(systemName: "person")
        usernameRTF.button.isHidden = true
        usernameRTF.textFeild.delegate = self
        usernameRTF.textFeild.textContentType = .username
        usernameRTF.textFeild.placeholder = "Username"
        usernameRTF.tintColor = .gray
        usernameRTF.textFeild.fontSetup(style: .Medium, size: 24.0)
        usernameRTF.containerView.setCorner()
        usernameRTF.containerView.setBorder()
        usernameRTF.containerView.setShadow()
    }
    
    func emailRTFsetup(){
        emailRTF.ImageView.image = UIImage(systemName: "link")
        emailRTF.button.isHidden = true
        emailRTF.textFeild.delegate = self
        emailRTF.textFeild.textContentType = .emailAddress
        emailRTF.textFeild.placeholder = "E-mail"
        emailRTF.tintColor = .gray
        emailRTF.textFeild.fontSetup(style: .Medium, size: 24.0)
        emailRTF.containerView.setCorner()
        emailRTF.containerView.setBorder()
        emailRTF.containerView.setShadow()
        
    }
    
    func passwordRTFsetup(){
        passwordRTF.ImageView.image = UIImage(systemName: "lock")
        passwordRTF.button.isHidden = false
        passwordRTF.button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        passwordRTF.button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        passwordRTF.textFeild.delegate = self
        passwordRTF.textFeild.textContentType = .newPassword
        passwordRTF.textFeild.isSecureTextEntry = true
        passwordRTF.textFeild.placeholder = "Password"
        passwordRTF.tintColor = .gray
        passwordRTF.textFeild.fontSetup(style: .Medium, size: 24.0)
        passwordRTF.containerView.setCorner()
        passwordRTF.containerView.setBorder()
        passwordRTF.containerView.setShadow()
    }
    
    @objc func showPassword() {
        passwordRTF.textFeild.isSecureTextEntry.toggle()
        let img = UIImage(systemName: passwordRTF.textFeild.isSecureTextEntry ? "eye" : "eye.slash")
        passwordRTF.button.setImage(img, for: .normal)
    }
    
    func continueBtnSetup(){
        continueBtn.setCorner()
        continueBtn.setBorder()
        continueBtn.setShadow()
        continueBtn.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
    }
    
    @objc func continueAction(){
        
        if let name = nameRTF.textFeild.text, nameRTF.hasValue,
            let username = usernameRTF.textFeild.text, usernameRTF.hasValue,
            let email = emailRTF.textFeild.text, emailRTF.hasValue,
            let password = passwordRTF.textFeild.text, passwordRTF.hasValue {
            let userdic = [kNAME: name,
                           kUSERNAME:username,
                           kPHONE: phoneNumber!,
                           kEMAIL: email,
                           kPASSWORD: password]
            
            auth.userRegisration(userDic: userdic) { (success) in
                /// back to home with wellcom screen
                UIView.transition(with: self.view, duration: 1.0, options: [.transitionCrossDissolve], animations: {
                    self.wellcomeViewSetup()
                }, completion: { _ in
                    UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: {
                        self.wellcomeView.removeFromSuperview()
                    }, completion: {_ in
                        self.view.window!.rootViewController?.dismiss(animated: true, completion: {
                            if let doneAction = self.doneAction{
                                doneAction()
                            }
                        })
                    })
                })
            }
        }
    }
    
    func wellcomeViewSetup(){
        view.addSubview(wellcomeView)
        wellcomeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        wellcomeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        wellcomeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        wellcomeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        let smilImg: UIImageView = {
            let imgView = UIImageView(image: UIImage(named: "smile"))
            imgView.translatesAutoresizingMaskIntoConstraints = false
            imgView.backgroundColor = .clear
            imgView.tintColor = .white
            imgView.contentMode = .scaleAspectFit
            return imgView
        }()
        
        
        wellcomeView.addSubview(smilImg)
        smilImg.centerXAnchor.constraint(equalTo: wellcomeView.centerXAnchor, constant: 0).isActive = true
        smilImg.centerYAnchor.constraint(equalTo: wellcomeView.centerYAnchor, constant: 0).isActive = true
        smilImg.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        smilImg.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3
        ).isActive = true
        
        let nameLbl: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            let text = "Wellcome \(auth.getUserData(key: kUSERNAME) ?? "no data")"
            print(text)
            lbl.text = text
            lbl.textColor = .white
            lbl.textAlignment = .center
            lbl.font = UIFont(name: "Avenir Next Medium", size: 30.0)
            return lbl
        }()
        
        wellcomeView.addSubview(nameLbl)
        nameLbl.centerXAnchor.constraint(equalTo: smilImg.centerXAnchor, constant: 0).isActive = true
        nameLbl.topAnchor.constraint(equalTo: smilImg.bottomAnchor, constant: 8).isActive = true
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

}
extension RegistrationVC: UITextFieldDelegate{
    
    //MARK:- text field Delegates
    func endEditing(){
        bottomConstrain.constant = 64
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
}

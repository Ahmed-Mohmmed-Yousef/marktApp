//
//  LoginVC.swift
//  marktApp
//
//  Created by Ahmed on 2/10/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

protocol LoginDelegate {
    func loginDone()
}
class LoginVC: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userNameImage: UIImageView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordIamge: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var skipeLogin: UIButton!
    @IBOutlet weak var showPasswordBtn: UIButton!
    @IBOutlet weak var usernameContanir: UIView!
    @IBOutlet weak var passwordContanir: UIView!
    @IBOutlet weak var bottomConstrain: NSLayoutConstraint!
    
    var doneLogged: (() -> ())?
    var delegat: LoginDelegate?
    let auth = AuthController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUserNameTF()
        setPasswordTF()
        setLoginBtn()
        setSkipBtn()
        setShowPassword()

    }
    
    func setUserNameTF(){
        userNameTF.tintColor = .darkGray
        userNameTF.delegate = self
        userNameImage.image = UIImage(systemName: "person")
        userNameImage.contentMode = .scaleAspectFit
        userNameImage.tintColor = .gray
        
        usernameContanir.setCorner(radius: 10)
        usernameContanir.setShadow()
        
    }
    
    func setPasswordTF(){

        passwordTF.tintColor = .darkGray
        passwordTF.delegate = self
        passwordTF.isSecureTextEntry = true
        
        passwordIamge.image = UIImage(systemName: "lock")
        passwordIamge.contentMode = .scaleAspectFit
        passwordIamge.tintColor = .gray
        
        passwordContanir.setCorner(radius: 10)
        passwordContanir.setShadow()
    }
    
    func setShowPassword(){
        let showImg = UIImage(systemName: "eye")
        let disAppearImg = UIImage(systemName: "eye.slash")
        let img = passwordTF.isSecureTextEntry ? disAppearImg : showImg
        showPasswordBtn.setImage(img, for: .normal)
        showPasswordBtn.tintColor = .gray
        showPasswordBtn.addTarget(self, action: #selector(showPassword), for: .touchUpInside)

    }
    
    
    @objc func showPassword(){
        let showImg = UIImage(systemName: "eye")
        let disAppearImg = UIImage(systemName: "eye.slash")
        passwordTF.isSecureTextEntry.toggle()
        print(passwordTF.isSecureTextEntry)
        let img = passwordTF.isSecureTextEntry ? disAppearImg : showImg
        showPasswordBtn.setImage(img, for: .normal)
    }
    
    func setLoginBtn(){
        loginBtn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginBtn.setCorner(radius: 10)
        loginBtn.setShadow()
        
    }
    
    func setSkipBtn(){
        skipeLogin.addTarget(self, action: #selector(skipAction), for: .touchUpInside)
        skipeLogin.setCorner(radius: 10)
        skipeLogin.setShadow()
        
    }
    
    @objc func loginAction(){
        guard let username = userNameTF.text, !username.isEmpty else {
            return
        }
        guard let password = passwordTF.text, !password.isEmpty else {
            return
        }
        auth.login(username: username, password: password) { [weak self] (success) in
            guard let self = self else { return }
            if success{
                if let delegat = self.delegat{
                    self.dismiss(animated: true) {
                        delegat.loginDone()
                    }
                }
            } else{
                // Alert
                print("user name or password is false")
            }
        }
    }
    
    @objc func skipAction(){
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func forgetPasswordPressed(_ sender: Any) {
         print("forgetPasswordPressed")
    }
    
    @IBAction func createAccountPreesed(_ sender: Any) {
        let sb = UIStoryboard(name: "RegistrationVC", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! PhoneNumberVC
        vc.doneAction = {
            if let delegat = self.delegat{
                delegat.loginDone()
            }
            print("createAccountPreesed")
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate{
    
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
}

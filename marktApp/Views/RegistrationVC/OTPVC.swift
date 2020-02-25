//
//  OTPVC.swift
//  marktApp
//
//  Created by Ahmed on 2/14/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class OTPVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var waitLbl: UILabel!
    @IBOutlet weak var resendBtn: UIButton!
    
    var otpCode = "4321"
    var phoneNumber: String?
    var doneAction: (() -> ())?
    
    var timer: Timer? = Timer()
    var timeLeft = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backBtnsetup()
        tfSetup()
        continueBtnSetup()
        phoneNumberLbl.text = phoneNumber
        resendBtn.addTarget(self, action: #selector(resendAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startTime()
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
    
    func tfSetup(){
        tf1.delegate = self
        tf2.delegate = self
        tf3.delegate = self
        tf4.delegate = self
        
        tf1.tintColor = .gray
        tf2.tintColor = .gray
        tf3.tintColor = .gray
        tf4.tintColor = .gray
        
    }
    
    func continueBtnSetup(){
        continueBtn.setCorner(radius: 20)
        continueBtn.setShadow()
        continueBtn.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
    }
    
    @objc func continueAction(){
        if let t1 = tf1.text, !t1.isEmpty ,
           let t2 = tf2.text, !t2.isEmpty ,
           let t3 = tf3.text, !t3.isEmpty ,
           let t4 = tf4.text, !t4.isEmpty  {
           let txt = t1 + t2 + t3 + t4
            if txt == otpCode {
                let vc = storyboard?.instantiateViewController(identifier: "RegistrationVC") as! RegistrationVC
                vc.phoneNumber = phoneNumber!
                vc.doneAction = {
                    if let doneAction = self.doneAction{
                        doneAction()
                    }
                    print("continueAction 2")
                }
                present(vc, animated: true, completion: nil)
            } else {
                print("otp code not matched")
            }
        } else {
            print("Fill all digits")
        }
    }
    
    @objc func resendAction(){
        sendOTP()
        startTime()
    }
    
    func sendOTP(){
        
    }
    
    // time function
    func startTime(){
        waitLbl.isHidden = false
        resendBtn.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTime)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        timeLeft -= 1
        waitLbl.text = "wait sending code agin after \(timeString(time: timeLeft))"

        if timeLeft <= 0 {
            timeEnd()
        }
    }
    
    func timeEnd(){
        timeLeft = 120
        timer?.invalidate()
        timer = nil
        waitLbl.isHidden = true
        resendBtn.isHidden = false
    }
    
    func timeString(time:Int) -> String {
        let minutes = time / 60 % 60
        let seconds = time % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    
    // textfield deleget
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text, text.utf16.count >= 1{
            switch textField{
            case tf1:
                tf2.becomeFirstResponder()
            case tf2:
                tf3.becomeFirstResponder()
            case tf3:
                tf4.becomeFirstResponder()
            case tf4:
                tf4.resignFirstResponder()
            default:
                break
            }
        }else{

        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

//
//  OrderSummary.swift
//  marktApp
//
//  Created by Ahmed on 3/30/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class OrderSummaryVC: UIViewController {

    //MARK:- Properties
    let transition = StretchAnimator()
    lazy var mainView: OrderSummaryView = {
        let view =  OrderSummaryView(delegate: self)
        return view
    }()
    
     //MARK:- LifeCycle
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Order Summary"
    }
    

}

extension OrderSummaryVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SC.shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CC") as! OrderSummaryCell
        let item = SC.shoppingItems[indexPath.row]
        cell.item = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension OrderSummaryVC: OrderSummaryDelegate {
    
    func choosePayMethodPressed() {
        if mainView.dayRTF.textField.text != "" &&
            mainView.timeRTF.textField.text != "" {
            
            let vc = ChoosePayMetyhodVC()
            navigationController?.pushViewController(vc, animated: true)
                        
        } else {
            self.showAlert(msg: "Fill day and time text fields", nil)
        }
    }
 
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
}


    //MARK:- text field Delegates
extension OrderSummaryVC: UITextFieldDelegate{

    func endEditing(){
        mainView.bottomConstrain.constant = -50
        mainView.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == mainView.dayRTF.textField {
            let selectDay = SelectDateVC.create(.date)
            selectDay.transitioningDelegate = self
            selectDay.actionDone = { dayInString in
                textField.text = "\(dayInString!)"
            }
            endEditing()
            self.present(selectDay, animated: true)
            
        } else if textField == mainView.timeRTF.textField {
            let selectTime = SelectDateVC.create(.time)
            selectTime.transitioningDelegate = self
            selectTime.actionDone = { timeInString in
                textField.text = "\(timeInString!)"
            }
            endEditing()
            self.present(selectTime, animated: true)
            
        } else {
            mainView.bottomConstrain.constant = -300
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mainView.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing()
    }
}

//MARK:- Transition Delegate Conformance
extension OrderSummaryVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame = mainView.reciveStackView.layer.frame
        transition.presenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}

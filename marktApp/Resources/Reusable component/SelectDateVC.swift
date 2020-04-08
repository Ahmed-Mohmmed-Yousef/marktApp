//
//  SelectDateVC.swift
//  marktApp
//
//  Created by Ahmed on 3/31/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class SelectDateVC: UIViewController {
    
    var selectType: UIDatePicker.Mode = .date {
        didSet{
            let title = selectType == .date ? "Date" : "Day"
            titleLbl.text = "Selec the \(title)"
            datePicker.datePickerMode = selectType
        }
    }
    
    var actionDone: ((String?)->())?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var titleLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .DemiBold, size: 24.0)
        lbl.backgroundColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.text = "Selec the \(selectType)"
        return lbl
    }()
    
    private lazy var datePicker: UIDatePicker = {
        var dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.timeZone = NSTimeZone.local
        dp.backgroundColor = UIColor.white
        dp.datePickerMode = .date
        dp.minimumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        dp.maximumDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        return dp
    }()
    
    private var doneBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Done", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
        btn.titleLabel?.font = UIFont.setAvenirNext(with: .DemiBold, size: 20.0)
        btn.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6927881241, green: 0.6886719465, blue: 0.6959536672, alpha: 0)
        configView()
        addCustomView()
    }
    
    class func create(_ type: UIDatePicker.Mode) -> SelectDateVC {
        let vc = SelectDateVC()
        vc.modalPresentationStyle = .overCurrentContext
        vc.selectType = type
        return vc
    }
    
    private func configView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func donePressed(){
        if let actionDone = actionDone {
            let date = dateFormatter(date: datePicker.date)
            actionDone(date)
        }
        dismissVC()
    }
    
    private func dateFormatter(date: Date) -> String{
        let dateformatter = DateFormatter()
        if selectType == .date {
            dateformatter.dateFormat = "MM/dd/yyyy"
            return dateformatter.string(from: date)
        }
        dateformatter.dateFormat = "HH:mm a"
        return dateformatter.string(from: date)
    }
    
    
    private func setupContainerView(){
        view.addSubview(containerView)
        containerView.setBorder()
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.0),
//            containerView.heightAnchor.constraint(equalToConstant: 400.0)
        ])
    }
    
    private func setupTitleLbl(){
        containerView.addSubview(titleLbl)
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLbl.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupDatePicker(){
        containerView.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: titleLbl.bottomAnchor),
            datePicker.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    private func setupDoneBtn(){
        containerView.addSubview(doneBtn)
        doneBtn.setCorner()
        doneBtn.setShadow()
        NSLayoutConstraint.activate([
            doneBtn.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 16.0),
            doneBtn.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            doneBtn.heightAnchor.constraint(equalToConstant: 50.0),
            doneBtn.widthAnchor.constraint(equalToConstant: 100.0),
            doneBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16.0)
        ])
    }

    private func addCustomView(){
        setupContainerView()
        setupTitleLbl()
        setupDatePicker()
        setupDoneBtn()
    }
}

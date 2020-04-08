//
//  ChoosePayMetyhodView.swift
//  marktApp
//
//  Created by Ahmed on 4/2/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit



@objc protocol ChoosePayMetyhodDelegate {
    @objc func radioBtnPressed(_ isCach: Bool)
    @objc func confirmeBtnPressed()
}

class ChoosePayMetyhodView: UIView {
    
    var mainContainerView = UIView()
    
    var cachLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.setAvenirNext(with: .Medium, size: 24)
        lbl.text = "Paiement when recieving"
        lbl.textColor = .darkGray
        return lbl
    }()
    
    var cardLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.setAvenirNext(with: .Medium, size: 24)
        lbl.text = "Use a credit card"
        lbl.textColor = .darkGray
        return lbl
    }()
        
    var cachBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "radio_button_off"), for: .normal)
        btn.contentMode = .scaleAspectFit
        btn.tintColor = .darkGray
        return btn
    }()
    
    var cardBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "radio_button_on"), for: .normal)
        btn.contentMode = .scaleAspectFit
        btn.tintColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
        return btn
    }()
    
    var totalPriceLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.setAvenirNext(with: .DemiBold, size: 26)
        lbl.text = "Total price is 00.00 RS"
        lbl.textColor = .darkGray
        return lbl
    }()
    
    var confirmBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
        btn.titleLabel?.textColor = .white
        btn.setTitle("Confirmation", for: .normal)
        btn.titleLabel?.font = UIFont.setAvenirNext(with: .Medium, size: 26.0)
        return btn
    }()

    var delegate: ChoosePayMetyhodDelegate?
    
    
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.addView()
        self.addCustomView()
        self.setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupActions() {
        cachBtn.addTarget(self, action: #selector(inCach), for: .touchUpInside)
        cardBtn.addTarget(self, action: #selector(inCard), for: .touchUpInside)
        confirmBtn.addTarget(delegate, action: #selector(delegate?.confirmeBtnPressed), for: .touchUpInside)
    }
    
    @objc private func inCach(){
        delegate?.radioBtnPressed(true)
    }
    
    @objc private func inCard(){
        delegate?.radioBtnPressed(false)
    }
    private func addMainContainer(){
        mainContainerView.setCorner()
        mainContainerView.setShadow()
        mainContainerView.setBorder(width: 0.3, color: .darkGray)
        mainContainerView.backgroundColor = .white
        NSLayoutConstraint.activate([
            mainContainerView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 32.0),
            mainContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            mainContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            mainContainerView.heightAnchor.constraint(equalToConstant: 140.0)
        ])
    }
    
    private func addBtnAdnLbl(){
        NSLayoutConstraint.activate([
            cachBtn.widthAnchor.constraint(equalToConstant: 30.0),
            cachBtn.heightAnchor.constraint(equalToConstant: 30.0),
            cachBtn.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor, constant: 16.0),
            cachBtn.centerYAnchor.constraint(equalTo: mainContainerView.centerYAnchor, constant: -30.0),
            
        ])
        
        NSLayoutConstraint.activate([
            cachLbl.centerYAnchor.constraint(equalTo: cachBtn.centerYAnchor),
            cachLbl.leadingAnchor.constraint(equalTo: cachBtn.trailingAnchor, constant: 8.0)
        ])
        
        NSLayoutConstraint.activate([
            cardBtn.widthAnchor.constraint(equalToConstant: 30.0),
            cardBtn.heightAnchor.constraint(equalToConstant: 30.0),
            cardBtn.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor, constant: 16.0),
            cardBtn.centerYAnchor.constraint(equalTo: mainContainerView.centerYAnchor, constant: 30.0),
            
        ])
        
        NSLayoutConstraint.activate([
            cardLbl.centerYAnchor.constraint(equalTo: cardBtn.centerYAnchor),
            cardLbl.leadingAnchor.constraint(equalTo: cardBtn.trailingAnchor, constant: 8.0)
        ])
        
        NSLayoutConstraint.activate([
            totalPriceLbl.topAnchor.constraint(equalTo: mainContainerView.bottomAnchor, constant: 16.0),
            totalPriceLbl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0)
        ])
        
        confirmBtn.setCorner()
        confirmBtn.setShadow()
        NSLayoutConstraint.activate([
            confirmBtn.topAnchor.constraint(equalTo: totalPriceLbl.bottomAnchor, constant: 32.0),
            confirmBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0),
            confirmBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32.0),
            confirmBtn.heightAnchor.constraint(equalToConstant: 60.0)
        ])

    }
    
    private func addView(){
        addSubview(mainContainerView)
        addSubview(totalPriceLbl)
        addSubview(confirmBtn)
        mainContainerView.addSubview(cachLbl)
        mainContainerView.addSubview(cachBtn)
        mainContainerView.addSubview(cardLbl)
        mainContainerView.addSubview(cardBtn)
        mainContainerView.translatesAutoresizingMaskIntoConstraints = false
        cachLbl.translatesAutoresizingMaskIntoConstraints = false
        cachBtn.translatesAutoresizingMaskIntoConstraints = false
        cardBtn.translatesAutoresizingMaskIntoConstraints = false
        cardLbl.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLbl.translatesAutoresizingMaskIntoConstraints = false
        confirmBtn.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func addCustomView(){
        addMainContainer()
        addBtnAdnLbl()
    }
}

//
//  ShipsToView.swift
//  marktApp
//
//  Created by Ahmed on 3/22/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

@objc protocol ShipsToViewDelegate {
    @objc func continuAction()
    func openGetLocationVC()
}
class ShipsToView: UIView {

    var delegate: ShipsToViewDelegate?
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .clear
        sv.showsVerticalScrollIndicator = false
        sv.isScrollEnabled = true
        return sv
    }()
    
    private lazy var containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()
    
    private lazy var bottomConstrain: NSLayoutConstraint = {
        let constraint = NSLayoutConstraint(item: containerView,
                                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: scrollView,
                                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                                    multiplier: 1,
                                                    constant: -50)
        return constraint
    }()
    
    private lazy var reciverLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .DemiBold, size: 24.0)
        lbl.text = "Reciver"
        return lbl
    }()
    
    private lazy var addressLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .DemiBold, size: 24.0)
        lbl.text = "The address"
        return lbl
    }()
    
    private lazy var topContainerView: UIView = {
        var v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    private lazy var separateView: UIView = {
        var v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .gray
        return v
    }()
    
    lazy var nameRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.textField.placeholder = "Name *"
        rtf.textField.textContentType = .name
        rtf.imgView.image = #imageLiteral(resourceName: "person")
        return rtf
    }()
    
    lazy var phoneRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.textField.placeholder = "Phone *"
        rtf.textField.textContentType = .telephoneNumber
        rtf.textField.keyboardType = .phonePad
        rtf.imgView.image = #imageLiteral(resourceName: "phone")
        return rtf
    }()
    
    lazy var cityRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.textField.placeholder = "City *"
        rtf.textField.textContentType = .addressCity
        rtf.imgView.image = #imageLiteral(resourceName: "location")
        return rtf
    }()
    
    
    lazy var regionRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.textField.placeholder = "Region *"
        rtf.imgView.image = #imageLiteral(resourceName: "location")
        return rtf
    }()
    
    lazy var streetRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.textField.placeholder = "Street *"
        rtf.textField.textContentType = .streetAddressLine1
        rtf.imgView.image = #imageLiteral(resourceName: "location")
        return rtf
    }()
    
    lazy var buildingRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.textField.placeholder = "Building"
        rtf.imgView.image = #imageLiteral(resourceName: "location")
        return rtf
    }()
    
    lazy var floorRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.textField.placeholder = "Floor"
        rtf.imgView.image = #imageLiteral(resourceName: "location")
        return rtf
    }()
    
    lazy var locationRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.textField.textContentType = .location
        rtf.textField.placeholder = "Location *"
        rtf.imgView.tintColor = .red
        rtf.imgView.image = #imageLiteral(resourceName: "location")
        return rtf
    }()
    
    private lazy var continueBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
        btn.titleLabel?.textColor = .white
        btn.setTitle("Contineu", for: .normal)
        btn.titleLabel?.font = UIFont.setAvenirNext(with: .Medium, size: 26.0)
        btn.addTarget(delegate, action: #selector(delegate!.continuAction), for: .touchUpInside)
        return btn
    }()
    
    init(delegate: ShipsToViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.setupTFDelegat()
        self.addCustomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- extension to setup all UIComponent
extension ShipsToView {
    
    private func setupTFDelegat(){
        self.nameRTF.textField.delegate = self
        self.phoneRTF.textField.delegate = self
        self.cityRTF.textField.delegate = self
        self.regionRTF.textField.delegate = self
        self.streetRTF.textField.delegate = self
        self.buildingRTF.textField.delegate = self
        self.floorRTF.textField.delegate = self
        self.locationRTF.textField.delegate = self
    }
    
    private func setupScrollView(){
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    private func setupContainerView(){
        scrollView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            bottomConstrain
        ])
    }
    
    private func setupReciverLbl(){
        containerView.addSubview(reciverLbl)
        NSLayoutConstraint.activate([
            reciverLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16.0),
            reciverLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
        ])
    }
    
    private func setupTopContainerView(){
        containerView.addSubview(topContainerView)
        topContainerView.setCorner()
        topContainerView.setShadow()
        NSLayoutConstraint.activate([
            topContainerView.topAnchor.constraint(equalTo: reciverLbl.bottomAnchor, constant: 16.0),
            topContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            topContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
        ])
    }
    
    private func setupNmaeRTF(){
        topContainerView.addSubview(nameRTF)
        NSLayoutConstraint.activate([
            nameRTF.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 8),
            nameRTF.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 8),
            nameRTF.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -8),
            nameRTF.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupSeparateView(){
        topContainerView.addSubview(separateView)
        NSLayoutConstraint.activate([
            separateView.topAnchor.constraint(equalTo: nameRTF.bottomAnchor, constant: 0),
            separateView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor),
            separateView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor),
            separateView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
    
    private func setupPhoneRTF(){
        topContainerView.addSubview(phoneRTF)
        NSLayoutConstraint.activate([
            phoneRTF.topAnchor.constraint(equalTo: separateView.bottomAnchor, constant: 8),
            phoneRTF.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 8),
            phoneRTF.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -8),
            phoneRTF.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: -8),
            phoneRTF.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupAddressLbl(){
        containerView.addSubview(addressLbl)
        NSLayoutConstraint.activate([
            addressLbl.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 16.0),
            addressLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0)
        ])
    }
    
    private func setupCityRTF(){
        containerView.addSubview(cityRTF)
        cityRTF.setCorner()
        cityRTF.setShadow()
        NSLayoutConstraint.activate([
            cityRTF.topAnchor.constraint(equalTo: addressLbl.bottomAnchor, constant: 16.0),
            cityRTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            cityRTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            cityRTF.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupRegionRTF(){
        containerView.addSubview(regionRTF)
        regionRTF.setCorner()
        regionRTF.setShadow()
        NSLayoutConstraint.activate([
            regionRTF.topAnchor.constraint(equalTo: cityRTF.bottomAnchor, constant: 16.0),
            regionRTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            regionRTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            regionRTF.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupStreetRTF(){
        containerView.addSubview(streetRTF)
        streetRTF.setCorner()
        streetRTF.setShadow()
        NSLayoutConstraint.activate([
            streetRTF.topAnchor.constraint(equalTo: regionRTF.bottomAnchor, constant: 16.0),
            streetRTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            streetRTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            streetRTF.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupBuildingRTF(){
        containerView.addSubview(buildingRTF)
        buildingRTF.setCorner()
        buildingRTF.setShadow()
        NSLayoutConstraint.activate([
            buildingRTF.topAnchor.constraint(equalTo: streetRTF.bottomAnchor, constant: 16.0),
            buildingRTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            buildingRTF.trailingAnchor.constraint(equalTo: containerView.centerXAnchor),
            buildingRTF.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupFloorRTF(){
        containerView.addSubview(floorRTF)
        floorRTF.setCorner()
        floorRTF.setShadow()
        NSLayoutConstraint.activate([
            floorRTF.topAnchor.constraint(equalTo: streetRTF.bottomAnchor, constant: 16.0),
            floorRTF.leadingAnchor.constraint(equalTo: buildingRTF.trailingAnchor, constant: 16.0),
            floorRTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:  -16),
            floorRTF.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupLocationRTF(){
        containerView.addSubview(locationRTF)
        locationRTF.setCorner()
        locationRTF.setShadow()
        NSLayoutConstraint.activate([
            locationRTF.topAnchor.constraint(equalTo: buildingRTF.bottomAnchor, constant: 16.0),
            locationRTF.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            locationRTF.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            locationRTF.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    func setupContinueBtn(){
        containerView.addSubview(continueBtn)
        continueBtn.setCorner(radius: 10)
        continueBtn.setShadow()
        NSLayoutConstraint.activate([
            continueBtn.topAnchor.constraint(equalTo: locationRTF.bottomAnchor, constant: 64.0),
            continueBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24.0),
            continueBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24.0),
            continueBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24.0),
            continueBtn.heightAnchor.constraint(equalToConstant: 60),
        ])
        
    }
    
    private func addCustomView(){
        setupScrollView()
        setupContainerView()
        setupReciverLbl()
        setupTopContainerView()
        setupNmaeRTF()
        setupSeparateView()
        setupPhoneRTF()
        setupAddressLbl()
        setupCityRTF()
        setupRegionRTF()
        setupStreetRTF()
        setupBuildingRTF()
        setupFloorRTF()
        setupLocationRTF()
        setupContinueBtn()
    }
}

extension ShipsToView: UITextFieldDelegate{
    //MARK:- text field Delegates
    func endEditing(){
        bottomConstrain.constant = -50
        endEditing(true)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == locationRTF.textField {
            delegate?.openGetLocationVC()
        }
        bottomConstrain.constant = -300
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing()
    }
}

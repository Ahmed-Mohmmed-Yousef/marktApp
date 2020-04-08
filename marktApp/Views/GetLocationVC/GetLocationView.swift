//
//  GetLocationView.swift
//  marktApp
//
//  Created by Ahmed on 3/23/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit
import MapKit

@objc protocol GetLocationViewDelegate {
    @objc func confiremLocationAction()
    @objc func closeAction()
    @objc func getMyLocation()
    func keyboardReturn(search text: String)
}

class GetLocationView: UIView {

    lazy var mapView: MKMapView = {
        var mapv = MKMapView()
        mapv.translatesAutoresizingMaskIntoConstraints = false
        return mapv
    }()
    
    lazy var closeBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .gray
        btn.setImage(#imageLiteral(resourceName: "close") , for: .normal)
        btn.backgroundColor = .white
        btn.addTarget(delegate, action: #selector(delegate?.closeAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var searchRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.imgView.image = #imageLiteral(resourceName: "search")
        rtf.textField.placeholder = "Search on map"
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let image = UIImage(named: "scope")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        rtf.textField.rightView = imageView
        rtf.textField.rightViewMode = .always
        return rtf
    }()
    
    private lazy var bottomContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    private lazy var locationImgView: UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.contentMode = .scaleAspectFit
        imgv.tintColor = .gray
        imgv.image = #imageLiteral(resourceName: "location")
        return imgv
    }()
    
    lazy var locationLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 20.0)
        lbl.numberOfLines = 0
        lbl.text = "This is your location This is your location This is your location "
        return lbl
    }()
    
    lazy var confiremBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
        btn.titleLabel?.textColor = .white
        btn.setTitle("Confirem Locatiom", for: .normal)
        btn.titleLabel?.font = UIFont.setAvenirNext(with: .Medium, size: 26.0)
        btn.addTarget(delegate, action: #selector(delegate!.confiremLocationAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var myLocationBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(#imageLiteral(resourceName: "scope") , for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        btn.addTarget(delegate, action: #selector(delegate!.getMyLocation), for: .touchUpInside)
        return btn
    }()
    
    var delegate: GetLocationViewDelegate?
    
    init(delegate: GetLocationViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.searchRTF.textField.delegate = self
        self.addCustomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMapView(){
        addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupCloseBtn(){
        addSubview(closeBtn)
        closeBtn.setCorner(radius: 22.5)
        closeBtn.setShadow()
        NSLayoutConstraint.activate([
            closeBtn.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 24.0),
            closeBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            closeBtn.widthAnchor.constraint(equalToConstant: 45.0),
            closeBtn.heightAnchor.constraint(equalToConstant: 45.0)
        ])
    }
    
    private func setupSearchRTF(){
        addSubview(searchRTF)
        searchRTF.setCorner()
        searchRTF.setShadow()
        NSLayoutConstraint.activate([
            searchRTF.topAnchor.constraint(equalTo: closeBtn.bottomAnchor, constant: 24.0),
            searchRTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            searchRTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0),
            searchRTF.heightAnchor.constraint(equalToConstant: 70.0)
        ])
    }
    
    private func setupBottomContainerView(){
        addSubview(bottomContainerView)
        NSLayoutConstraint.activate([
            bottomContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            bottomContainerView.heightAnchor.constraint(equalToConstant: 200.0)
        ])
        bottomContainerView.setShadow()
    }
 
    private func setupConfiremBtn(){
        bottomContainerView.addSubview(confiremBtn)
        confiremBtn.setCorner(radius: 10)
        confiremBtn.setShadow()
        NSLayoutConstraint.activate([
            confiremBtn.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 30.0),
            confiremBtn.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -30.0),
            confiremBtn.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: -30.0),
            confiremBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    private func setupLocationImgView(){
        bottomContainerView.addSubview(locationImgView)
        NSLayoutConstraint.activate([
            locationImgView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 16.0),
            locationImgView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 16.0),
            locationImgView.widthAnchor.constraint(equalToConstant: 30.0)
        ])
    }
    
    private func setupLocationLbl(){
        bottomContainerView.addSubview(locationLbl)
        NSLayoutConstraint.activate([
            locationLbl.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 16.0),
            locationLbl.leadingAnchor.constraint(equalTo: locationImgView.trailingAnchor, constant: 8.0),
            locationLbl.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -16.0),
            locationLbl.bottomAnchor.constraint(equalTo: confiremBtn.topAnchor, constant: -16.0)
        ])
    }
    
    private func setupMyLocationBtn(){
        addSubview(myLocationBtn)
        myLocationBtn.setCorner(radius: 30)
        myLocationBtn.setShadow()
        NSLayoutConstraint.activate([
            myLocationBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            myLocationBtn.bottomAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: -16),
            myLocationBtn.widthAnchor.constraint(equalToConstant: 60.0),
            myLocationBtn.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func addCustomView(){
        setupMapView()
        setupCloseBtn()
        setupSearchRTF()
        setupBottomContainerView()
        setupConfiremBtn()
        setupLocationImgView()
        setupLocationLbl()
        setupMyLocationBtn()
    }
}


extension GetLocationView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        if let text = textField.text{
            delegate?.keyboardReturn(search: text)
        }
        return true
    }
}

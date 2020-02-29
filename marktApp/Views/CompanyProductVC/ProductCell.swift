//
//  ProductCell.swift
//  marktApp
//
//  Created by Ahmed on 2/27/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    // MARK: - Properties
    var product: Product?{
        didSet{
            imgView.image = product?.Img
        }
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let imgView: UIImageView = {
        let imgview = UIImageView()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        imgview.backgroundColor = .clear
        imgview.contentMode = .scaleAspectFit
        return imgview
    }()
    
    let productName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "defualt product name"
        lbl.font = UIFont.setAvenirNext(with: .Bold, size: 20)
        return lbl
    }()
    
    let productPrice: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Medium, size: 20)
        lbl.text = "23.30 $"
        return lbl
    }()
    
    let numberOfOrder: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 20)
        lbl.text = "5 G"
        return lbl
    }()
    
    let productSize: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 20)
        lbl.text = "1 liter"
        return lbl
    }()
    
    let orderBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8999999762, blue: 0.8999999762, alpha: 1)
        btn.setTitle("Add to the cart", for: .normal)
        return btn
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupContainerView()
        setupImgView()
        setupNameLbl()
        setupProductPrice()
        setupNumberOfOrder()
        setupProductSize()
        setupOrderBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     // MARK: - Handlers
    
    /// Setup content view  In View
    fileprivate func setupContainerView(){
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        containerView.setCorner()
        containerView.setShadow()
    }
    
    // Setup Image View In View
    fileprivate func setupImgView(){
        containerView.addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            imgView.widthAnchor.constraint(equalToConstant: 110.0),
            imgView.heightAnchor.constraint(equalToConstant: 110.0)
        ])
    }
    
    // Setup product name lbl
    fileprivate func setupNameLbl(){
        containerView.addSubview(productName)
        NSLayoutConstraint.activate([
            productName.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 2),
            productName.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
        ])
    }
    
    // setup product price
    fileprivate func setupProductPrice(){
        containerView.addSubview(productPrice)
        NSLayoutConstraint.activate([
           productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 4),
           productPrice.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
        ])
    }
    
    // setup Number Of Order
    fileprivate func setupNumberOfOrder(){
        containerView.addSubview(numberOfOrder)
        NSLayoutConstraint.activate([
           numberOfOrder.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 4),
           numberOfOrder.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
        ])
    }

    // setup product Size
    fileprivate func setupProductSize(){
        containerView.addSubview(productSize)
        NSLayoutConstraint.activate([
           productSize.topAnchor.constraint(equalTo: numberOfOrder.bottomAnchor, constant: 4),
           productSize.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
        ])
    }
    
    // set oreder buttn
    fileprivate func setupOrderBtn(){
        containerView.addSubview(orderBtn)
        NSLayoutConstraint.activate([
            orderBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            orderBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            orderBtn.widthAnchor.constraint(equalToConstant: 175),
            orderBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
        orderBtn.setCorner()
    }
    
    @objc fileprivate func orderAction(){
        
    }
}

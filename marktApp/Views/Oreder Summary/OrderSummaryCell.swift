//
//  OrderSummaryCell.swift
//  marktApp
//
//  Created by Ahmed on 3/30/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class OrderSummaryCell: UITableViewCell {
    
    var item: ShoppingItem? {
        didSet {
            if let item = item {
                let product = item.product
                imgView.image     = product.img
                productName.text  = product.productName
                productCount.text = "Quantity: \(item.count) cartons"
                productPrice.text = "\(item.totalPrice) Rial"
                productOwner.text = "The company: Nova for water"
            }
        }
    }
    
    private lazy var imgView: UIImageView = {
        let imgview = UIImageView()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        imgview.backgroundColor = .clear
        imgview.contentMode = .scaleAspectFit
        return imgview
    }()

    private lazy var productName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "product name"
        lbl.font = UIFont.setAvenirNext(with: .DemiBold, size: 18)
        return lbl
    }()
    
    lazy var stackView: UIStackView = {
        var sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    private lazy var productCount: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "product count"
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 16)
        return lbl
    }()
    
    private lazy var productPrice: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "product price"
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 16)
        return lbl
    }()
    
    private lazy var productOwner: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "product Owner"
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 16)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addCustomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupImgView(){
        addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            imgView.widthAnchor.constraint(equalToConstant: 90.0)
        ])
    }
    
    fileprivate func setupProductName(){
        addSubview(productName)
        NSLayoutConstraint.activate([
            productName.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            productName.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8)
        ])
    }
    
    fileprivate func setupProducCountAndPrice(){
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
        ])
        stackView.addArrangedSubview(productCount)
        stackView.addArrangedSubview(productPrice)
    }
    
    
    fileprivate func setupProductOwner(){
        addSubview(productOwner)
        NSLayoutConstraint.activate([
            productOwner.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            productOwner.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8)
        ])
    }
    
    private func addCustomView(){
        setupImgView()
        setupProductName()
        setupProducCountAndPrice()
        setupProductOwner()
    }
        

}

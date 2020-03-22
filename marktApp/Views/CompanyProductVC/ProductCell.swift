//
//  ProductCell.swift
//  marktApp
//
//  Created by Ahmed on 2/27/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

protocol ProductCellDelegat {
    func addProductToCart(product: Product, completion: @escaping(Bool) -> Void)
}

class ProductCell: UITableViewCell {

    // MARK: - Properties
    var product: Product?{
        didSet{
            imgView.image = product?.img
            productName.text = product?.productName
            productPrice.text = String(describing: product?.price ?? 00)
            setOrderBtnStatus()
        }
    }
    
    var isInShopCart = false {
        didSet{
            setOrderBtnStatus()
        }
    }
    
    var delegate: ProductCellDelegat?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
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
        lbl.text = "defualt product name"
        lbl.font = UIFont.setAvenirNext(with: .Bold, size: 20)
        return lbl
    }()
    
    private lazy var productPrice: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Medium, size: 18)
        lbl.text = "23.30 $"
        return lbl
    }()
    
    private lazy var numberOfOrder: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 18)
        lbl.text = "5 G"
        return lbl
    }()
    
    private lazy var productSize: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 18)
        lbl.text = "1 liter"
        return lbl
    }()
    
    private lazy var orderBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8999999762, blue: 0.8999999762, alpha: 1)
        btn.addTarget(self, action: #selector(orderBtnAction), for: .touchUpInside)
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
    @objc func orderBtnAction(){
        delegate?.addProductToCart(product: product!){ success in
            self.isInShopCart = success
        }
    }
    
    func setOrderBtnStatus(){
        orderBtn.backgroundColor = isInShopCart ? #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1) : #colorLiteral(red: 0.8980392157, green: 0.8999999762, blue: 0.8999999762, alpha: 1)
        let btnTitle = isInShopCart ? "In Cart" : "Add to the cart"
        orderBtn.setTitle(btnTitle, for: .normal)
    }
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
            orderBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
        orderBtn.setCorner()
    }
    
}

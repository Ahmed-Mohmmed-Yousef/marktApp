//
//  ShoppingItemCell.swift
//  marktApp
//
//  Created by Ahmed on 3/11/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

protocol  ShoppingItemCellProtocol{
    func numberOfItemChanged(in item: ShoppingItem, value:Int, completion: @escaping (Int) -> Void )
    func showSpinner()
    func removeSpinner()
    
}

class ShoppingItemCell: UITableViewCell {
    // MARK: - Properties
    var shoppingItem: ShoppingItem? {
        didSet{
            if let product = shoppingItem?.product{
                imgView.image           = product.img
                productName.text        = product.productName
                productPrice.text       = "price: \(product.price) $"
//                productCompany.text     = "\(product.ownerCompany)"
                numberOfOrder.text      = "count: \(shoppingItem?.count ?? 0)"
                stepper.minimumValue    = Double(product.lowerBoundForOrder)
            }            
        }
    }
    
    var delegate: ShoppingItemCellProtocol?
    var indexPath: IndexPath?
    
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
        lbl.text = "Nova"
        return lbl
    }()
    
    private lazy var productCompany: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 18)
        return lbl
    }()
    
    private lazy var numberOfOrder: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 18)
        return lbl
    }()
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        return stepper
    }()
    

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        setupContainerView()
        setupImgView()
        setupNameLbl()
        setupProductPrice()
        setupProductCompanye()
        setupNumberOfOrder()
        setupStepper()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func stepperValueChanged(_ sender:UIStepper!)
    {
        let value = Int(sender.value)
        
        delegate?.showSpinner()
        delegate?.numberOfItemChanged(in: shoppingItem!, value: value){ [weak self] newValue in
            guard let self = self else { return }
            self.delegate?.removeSpinner()
            self.numberOfOrder.text = "count: \(newValue)"
            self.stepper.value = Double(newValue)
        }
    }
    /// Setup content view  In View
    fileprivate func setupContainerView(){
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            // MARK: ~ there is a problem
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
            imgView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
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
    
    fileprivate func setupProductCompanye(){
        containerView.addSubview(productCompany)
        NSLayoutConstraint.activate([
           productCompany.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 4),
           productCompany.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
        ])
        
    }
    
    // setup Number Of Order
    fileprivate func setupNumberOfOrder(){
        containerView.addSubview(numberOfOrder)
        NSLayoutConstraint.activate([
           numberOfOrder.topAnchor.constraint(equalTo: productCompany.bottomAnchor, constant: 4),
           numberOfOrder.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8)
        ])
    }
    
    fileprivate func setupStepper(){
        containerView.addSubview(stepper)
        NSLayoutConstraint.activate([
            stepper.topAnchor.constraint(equalTo: numberOfOrder.bottomAnchor, constant: 4),
            stepper.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 8),
        ])
    }
    
}

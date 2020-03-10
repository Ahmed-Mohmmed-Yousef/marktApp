//
//  ProductDetails.swift
//  marktApp
//
//  Created by Ahmed on 2/29/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
     // MARK: - Properties
    var product: Product?{
        didSet{
            navigationItem.title = product?.productName
            navigationItem.titleView?.tintColor = .white
            imgView.image = product?.Img
            productName.text = product?.productName
            productPrice.text = "\(product?.price ?? 0.0) $"
            productSize.text = "\(product?.size ?? 0) liter"
            productDetails.text = product?.discreption
        }
    }
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .clear
        return sv
    }()
    
    let containerView1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let containerView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let imgView: UIImageView = {
        let imgview = UIImageView()
        imgview.translatesAutoresizingMaskIntoConstraints = false
        imgview.backgroundColor = .white
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
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("Add to the cart", for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        return btn
    }()
    
    let productDetails: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Medium, size: 18)
        lbl.text = "Bla Bla Bla ..."
        lbl.numberOfLines = 0
        return lbl
    }()
    
     // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        product = arrP[0]
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)

        setupScrollView()
        setupImageView()
        setupContianerView1()
        setupNameLbl()
        setupProductPrice()
        setupNumberOfOrder()
        setupProductSize()
        setupOrderBtn()
        
        setupContianerView2()
        setDetailLbl()
    }
    
    // MARK: - Handlers
    fileprivate func setupScrollView(){
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        scrollView.isScrollEnabled = true
    }
    
    // set image view
    fileprivate func setupImageView(){
        scrollView.addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            imgView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imgView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imgView.heightAnchor.constraint(equalToConstant: 300),

        ])
    }
    
    //set container view 1
    fileprivate func setupContianerView1(){
        scrollView.addSubview(containerView1)
        NSLayoutConstraint.activate([
            containerView1.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 2),
            containerView1.leadingAnchor.constraint(equalTo: imgView.leadingAnchor),
            containerView1.trailingAnchor.constraint(equalTo: imgView.trailingAnchor),
            containerView1.heightAnchor.constraint(equalToConstant: 200),
        ])
        
    }
    
    // Setup product name lbl
    fileprivate func setupNameLbl(){
        containerView1.addSubview(productName)
        NSLayoutConstraint.activate([
            productName.topAnchor.constraint(equalTo: containerView1.topAnchor, constant: 8),
            productName.leadingAnchor.constraint(equalTo: containerView1.leadingAnchor, constant: 8),
        ])
    }
    
    // setup product price
    fileprivate func setupProductPrice(){
        containerView1.addSubview(productPrice)
        NSLayoutConstraint.activate([
           productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 4),
           productPrice.leadingAnchor.constraint(equalTo: containerView1.leadingAnchor, constant: 8),
        ])
    }
    
    // setup Number Of Order
    fileprivate func setupNumberOfOrder(){
        containerView1.addSubview(numberOfOrder)
        NSLayoutConstraint.activate([
           numberOfOrder.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 4),
           numberOfOrder.leadingAnchor.constraint(equalTo: containerView1.leadingAnchor, constant: 8),
        ])
    }

    // setup product Size
    fileprivate func setupProductSize(){
        containerView1.addSubview(productSize)
        NSLayoutConstraint.activate([
           productSize.topAnchor.constraint(equalTo: numberOfOrder.bottomAnchor, constant: 4),
           productSize.leadingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: 8),
        ])
    }
    
    // set oreder buttn
    fileprivate func setupOrderBtn(){
        containerView1.addSubview(orderBtn)
        NSLayoutConstraint.activate([
            orderBtn.topAnchor.constraint(equalTo: productSize.bottomAnchor, constant: 8),
            orderBtn.leadingAnchor.constraint(equalTo: containerView1.leadingAnchor, constant: 32),
            orderBtn.trailingAnchor.constraint(equalTo: containerView1.trailingAnchor, constant: -32),
            orderBtn.bottomAnchor.constraint(equalTo: containerView1.bottomAnchor, constant: -16),
            orderBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
        orderBtn.setCorner()
        let imgv = UIImageView(image: #imageLiteral(resourceName: "Image"))
        imgv.backgroundColor = .clear
        imgv.contentMode = .scaleAspectFit
        imgv.translatesAutoresizingMaskIntoConstraints = false
        orderBtn.addSubview(imgv)
        NSLayoutConstraint.activate([
            imgv.topAnchor.constraint(equalTo: orderBtn.topAnchor, constant: 8),
            imgv.leadingAnchor.constraint(equalTo: orderBtn.leadingAnchor, constant: 24),
            imgv.bottomAnchor.constraint(equalTo: orderBtn.bottomAnchor, constant: -8),
            imgv.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // set button action
    @objc fileprivate func btnAction(){
        //MARK: ~ set code for button action
        print("i`m here")
    }
    
    // set container view 2
    fileprivate func setupContianerView2(){
        scrollView.addSubview(containerView2)
        NSLayoutConstraint.activate([
            containerView2.topAnchor.constraint(equalTo: containerView1.bottomAnchor, constant: 2),
            containerView2.leadingAnchor.constraint(equalTo: imgView.leadingAnchor),
            containerView2.trailingAnchor.constraint(equalTo: imgView.trailingAnchor),
//            containerView2.heightAnchor.constraint(equalToConstant: 200),
            containerView2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
    }
    
    // set detail label
    fileprivate func setDetailLbl(){
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Details"
        lbl.font = UIFont.setAvenirNext(with: .DemiBold, size: 22)
        containerView2.addSubview(lbl)
        NSLayoutConstraint.activate([
            lbl.topAnchor.constraint(equalTo: containerView2.topAnchor, constant: 8),
            lbl.leadingAnchor.constraint(equalTo: containerView2.leadingAnchor, constant: 8)
        ])
        
        containerView2.addSubview(productDetails)
        NSLayoutConstraint.activate([
            productDetails.topAnchor.constraint(equalTo: lbl.bottomAnchor, constant: 8),
            productDetails.leadingAnchor.constraint(equalTo: containerView2.leadingAnchor, constant: 8),
            productDetails.trailingAnchor.constraint(equalTo: containerView2.trailingAnchor, constant: -8),
            productDetails.bottomAnchor.constraint(equalTo: containerView2.bottomAnchor, constant: -8)
        ])
    }
    
}

//
//  OrderSummaryView.swift
//  marktApp
//
//  Created by Ahmed on 3/30/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

@objc protocol OrderSummaryDelegate: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @objc func goBack()
    @objc func choosePayMethodPressed()
}

class OrderSummaryView: UIView {
    
    private var delegate: OrderSummaryDelegate?
    
    private var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .clear
        sv.showsVerticalScrollIndicator = false
        sv.isScrollEnabled = true
        return sv
    }()
    
    private var containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        return v
    }()
    
    lazy var bottomConstrain: NSLayoutConstraint = {
        let constraint = NSLayoutConstraint(item: containerView,
                                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: scrollView,
                                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                                    multiplier: 1,
                                                    constant: -50)
        return constraint
    }()
    
    //MARK: - ship to part
    private var shipToLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .DemiBold, size: 24.0)
        lbl.text = "Ships to"
        return lbl
    }()
    
    private var shipContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    private var nameLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Medium, size: 18.0)
        lbl.text = UserInfo.name
        return lbl
    }()
    
    private var phoneLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Medium, size: 18.0)
        lbl.text = UserInfo.phone
        return lbl
    }()
    
    private var addressLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Medium, size: 18.0)
        lbl.text = UserInfo.city + " " + UserInfo.region + " " + UserInfo.street
        return lbl
    }()
    
    private var changeBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.setTitle("Change address", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.setAvenirNext(with: .DemiBold, size: 18.0)
        return btn
    }()
    
    //MARK: - recive date part
    private var reciveDateLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .DemiBold, size: 24.0)
        lbl.text = "recive date"
        return lbl
    }()
    
    private var hintLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 16.0)
        lbl.textColor = .secondaryLabel
        lbl.text = "Minimum after 24 hours"
        return lbl
    }()
    
    var reciveStackView: UIStackView = {
        var sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    var dayRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.textField.placeholder = "Day *"
        rtf.imgView.image = #imageLiteral(resourceName: "day")
        return rtf
    }()
    
    var timeRTF: ReusableTextField = {
        var rtf = ReusableTextField()
        rtf.translatesAutoresizingMaskIntoConstraints = false
        rtf.textField.placeholder = "Day *"
        rtf.imgView.image = #imageLiteral(resourceName: "time")
        return rtf
    }()
    
    
    //MARK: - your order part
    private lazy var yourOrderLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .DemiBold, size: 24.0)
        lbl.text = "Your Order"
        return lbl
    }()
    
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = .clear
        tb.separatorStyle = .singleLine
        tb.delegate = self.delegate
        tb.dataSource = self.delegate
        tb.register(OrderSummaryCell.self, forCellReuseIdentifier: "CC")
        return tb
    }()
    
    //MARK: - summary of orders part
    var price = SC.calcTotalPrice()
    
    private var summaryLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .DemiBold, size: 24.0)
        lbl.text = "Summary of your order"
        return lbl
    }()
    
    private var summarypContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    private var summaryStackView: UIStackView = {
        var sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 20
        return sv
    }()
    
    private lazy var allOrdersLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 18.0)
        let priceString = String(format: "%.02f", price)
        lbl.text = "All Order: \(priceString) RS"
        return lbl
    }()
    
    private lazy var deliveryChargeLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 18.0)
        let priceString = String(format: "%.02f", price * 0.05)
        lbl.text = "Delivery charge: \(priceString) RS"
        return lbl
    }()
    
    private lazy var totalAmountLbl: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.setAvenirNext(with: .Regular, size: 18.0)
        let priceString = String(format: "%.02f", (price * 0.05 + price))
        lbl.text = "Total amount: \(priceString) RS"
        return lbl
    }()
    
    //MARK:- Copone part
    private lazy var coponContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    lazy var coponTF: UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter Copon Code"
        tf.tintColor = .gray
        return tf
    }()
    
    private lazy var coponBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Apply", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.titleLabel?.font = UIFont.setAvenirNext(with: .Regular, size: 18.0)
        btn.backgroundColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
        return btn
    }()
    
    //MARK:- Choose .. Btn
    private lazy var chooseBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Choose your payment method ", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.titleLabel?.font = UIFont.setAvenirNext(with: .DemiBold, size: 20.0)
        btn.backgroundColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
        return btn
    }()
    //MARK:- init
    init(delegate: OrderSummaryDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.setDelegateTF()
        self.addCustomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegateTF(){
        dayRTF.textField.delegate = self.delegate
        timeRTF.textField.delegate = self.delegate
        coponTF.delegate = self.delegate
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
    
    //MARK: - ship to setup view
    private func setupShipToLbl(){
        containerView.addSubview(shipToLbl)
        NSLayoutConstraint.activate([
            shipToLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16.0),
            shipToLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
        ])
    }
    
    private func setupShippContainerView(){
        containerView.addSubview(shipContainerView)
        shipContainerView.setCorner()
        shipContainerView.setShadow()
        NSLayoutConstraint.activate([
            shipContainerView.topAnchor.constraint(equalTo: shipToLbl.bottomAnchor, constant: 16.0),
            shipContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            shipContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
        ])
    }
    
    private func setupNameLabl(){
        shipContainerView.addSubview(nameLbl)
        NSLayoutConstraint.activate([
            nameLbl.topAnchor.constraint(equalTo: shipContainerView.topAnchor, constant: 16.0),
            nameLbl.leadingAnchor.constraint(equalTo: shipContainerView.leadingAnchor, constant: 8.0),
            nameLbl.trailingAnchor.constraint(equalTo: shipContainerView.trailingAnchor, constant: -8.0),
        ])
    }
    
    private func setupPhoneLabl(){
        shipContainerView.addSubview(phoneLbl)
        NSLayoutConstraint.activate([
            phoneLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 8.0),
            phoneLbl.leadingAnchor.constraint(equalTo: shipContainerView.leadingAnchor, constant: 8.0),
            phoneLbl.trailingAnchor.constraint(equalTo: shipContainerView.trailingAnchor, constant: -8.0),
        ])
    }
    
    private func setupAddressLabl(){
        shipContainerView.addSubview(addressLbl)
        NSLayoutConstraint.activate([
            addressLbl.topAnchor.constraint(equalTo: phoneLbl.bottomAnchor, constant: 8.0),
            addressLbl.leadingAnchor.constraint(equalTo: shipContainerView.leadingAnchor, constant: 8.0),
            addressLbl.trailingAnchor.constraint(equalTo: shipContainerView.trailingAnchor, constant: -8.0),
        ])
    }
    
    private func setupChangeBtn(){
        shipContainerView.addSubview(changeBtn)
        NSLayoutConstraint.activate([
            changeBtn.topAnchor.constraint(equalTo: addressLbl.bottomAnchor, constant: 8.0),
            changeBtn.trailingAnchor.constraint(equalTo: shipContainerView.trailingAnchor, constant: -8.0),
            changeBtn.bottomAnchor.constraint(equalTo: shipContainerView.bottomAnchor, constant: -16.0)
        ])
        changeBtn.addTarget(delegate, action: #selector(delegate?.goBack), for: .touchUpInside)
    }
    
    //MARK: - reciving time setup view
    private func setupReciveDateLbl(){
        containerView.addSubview(reciveDateLbl)
        NSLayoutConstraint.activate([
            reciveDateLbl.topAnchor.constraint(equalTo: shipContainerView.bottomAnchor, constant: 16.0),
            reciveDateLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0)
        ])
    }
    
    private func setupReciveStackView(){
        containerView.addSubview(reciveStackView)
        NSLayoutConstraint.activate([
            reciveStackView.topAnchor.constraint(equalTo: reciveDateLbl.bottomAnchor, constant: 16.0),
            reciveStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            reciveStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            reciveStackView.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }
    
    private func setupDayAndTimeRTF(){
        reciveStackView.addArrangedSubview(dayRTF)
        reciveStackView.addArrangedSubview(timeRTF)
        dayRTF.setCorner()
        dayRTF.setShadow()
        timeRTF.setCorner()
        timeRTF.setShadow()
    }
    
    
    //MARK: - Your order setup view
    private func setupYourOrderLbl(){
        containerView.addSubview(yourOrderLbl)
        NSLayoutConstraint.activate([
            yourOrderLbl.topAnchor.constraint(equalTo: reciveStackView.bottomAnchor, constant: 16.0),
            yourOrderLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0)
        ])
    }
    
    func setupTableView(){
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        containerView.addSubview(view)
        view.setCorner()
        view.setShadow()
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: yourOrderLbl.bottomAnchor, constant: 16.0),
            view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            view.heightAnchor.constraint(equalToConstant: 400.0),
        ])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 2.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2.0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2.0),
        ])
    }
    
    //MARK: - Summary setup view
    private func setupSummaryLbl(){
        containerView.addSubview(summaryLbl)
        NSLayoutConstraint.activate([
            summaryLbl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 16.0),
            summaryLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0)
        ])
    }
    
    private func setupSummaryContainerView(){
        containerView.addSubview(summarypContainerView)
        summarypContainerView.setCorner()
        summarypContainerView.setShadow()
        NSLayoutConstraint.activate([
            summarypContainerView.topAnchor.constraint(equalTo: summaryLbl.bottomAnchor, constant: 16.0),
            summarypContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            summarypContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
        ])
    }
    
    private func setupSummaryStackView(){
        summarypContainerView.addSubview(summaryStackView)
        NSLayoutConstraint.activate([
            summaryStackView.topAnchor.constraint(equalTo: summarypContainerView.topAnchor, constant: 16.0),
            summaryStackView.leadingAnchor.constraint(equalTo: summarypContainerView.leadingAnchor, constant: 16.0),
            summaryStackView.trailingAnchor.constraint(equalTo: summarypContainerView.trailingAnchor, constant: -16.0),
            summaryStackView.bottomAnchor.constraint(equalTo: summarypContainerView.bottomAnchor, constant: -16.0)
        ])
        
        summaryStackView.addArrangedSubview(allOrdersLbl)
        summaryStackView.addArrangedSubview(deliveryChargeLbl)
        summaryStackView.addArrangedSubview(totalAmountLbl)
    }
    
    //MARK: - Copon view
    private func setupCoponContainerView(){
        containerView.addSubview(coponContainerView)
        coponContainerView.setCorner()
        coponContainerView.setShadow()
        NSLayoutConstraint.activate([
            coponContainerView.topAnchor.constraint(equalTo: summarypContainerView.bottomAnchor, constant: 16.0),
            coponContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            coponContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            coponContainerView.heightAnchor.constraint(equalToConstant: 60.0),
        ])
    }
    
    private func setupCoponBtn(){
        coponContainerView.addSubview(coponBtn)
        coponBtn.setCorner()
        NSLayoutConstraint.activate([
            coponBtn.topAnchor.constraint(equalTo: coponContainerView.topAnchor, constant: 8),
            coponBtn.bottomAnchor.constraint(equalTo: coponContainerView.bottomAnchor, constant: -8),
            coponBtn.trailingAnchor.constraint(equalTo: coponContainerView.trailingAnchor, constant: -16.0),
            coponBtn.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    private func setCoponTF(){
        coponContainerView.addSubview(coponTF)
        NSLayoutConstraint.activate([
            coponTF.topAnchor.constraint(equalTo: coponContainerView.topAnchor, constant: 8),
            coponTF.bottomAnchor.constraint(equalTo: coponContainerView.bottomAnchor, constant: -8),
            coponTF.leadingAnchor.constraint(equalTo: coponContainerView.leadingAnchor, constant: 16.0),
            coponTF.trailingAnchor.constraint(equalTo: coponBtn.leadingAnchor, constant: -16.0)
        ])
    }
    
    //MARK: - Choose Btn
    private func setChooseBtn(){
        containerView.addSubview(chooseBtn)
        chooseBtn.setCorner()
        chooseBtn.setShadow()
        NSLayoutConstraint.activate([
            chooseBtn.topAnchor.constraint(equalTo: coponContainerView.bottomAnchor, constant: 16),
            chooseBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32.0),
            chooseBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32.0),
            chooseBtn.heightAnchor.constraint(equalToConstant: 60.0),
            chooseBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8.0),

        ])
        chooseBtn.addTarget(delegate, action: #selector(delegate?.choosePayMethodPressed), for: .touchUpInside)
    }
    
    private func addCustomView(){
        setupScrollView()
        setupContainerView()
        setupShipToLbl()
        setupShippContainerView()
        setupNameLabl()
        setupPhoneLabl()
        setupAddressLabl()
        setupChangeBtn()
        setupReciveDateLbl()
        setupReciveStackView()
        setupDayAndTimeRTF()
        setupYourOrderLbl()
        setupTableView()
        setupSummaryLbl()
        setupSummaryContainerView()
        setupSummaryStackView()
        setupCoponContainerView()
        setupCoponBtn()
        setCoponTF()
        setChooseBtn()
    }
}

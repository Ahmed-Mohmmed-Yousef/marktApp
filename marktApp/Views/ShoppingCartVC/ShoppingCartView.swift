//
//  ShoppingCartView.swift
//  marktApp
//
//  Created by Ahmed on 3/11/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

@objc protocol ShoppingCartProtocol: UITableViewDelegate, UITableViewDataSource {
    var navigationItem: UINavigationItem { get }
    var navigationController: UINavigationController? { get }
    @objc func deleteAction()
}

class ShoppingCartView: UIView{
    
    private weak var delegate: ShoppingCartProtocol!
    let cellId = "ShoppingItemCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8999999762, blue: 0.8999999762, alpha: 1)
        return view
    }()
    
    var deleteBarBtn: UIBarButtonItem? = {
        let barBtn = UIBarButtonItem()
        return barBtn
    }()
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = .clear
        tb.separatorStyle = .none
        return tb
    }()
    
    private lazy var bottomContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var sumLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.setAvenirNext(with: .Medium, size: 26.0)
        lbl.text = "23.98 $"
        return lbl
    }()
    
    private lazy var continueBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
        btn.titleLabel?.textColor = .white
        btn.setTitle("Contineu", for: .normal)
        btn.titleLabel?.font = UIFont.setAvenirNext(with: .Medium, size: 26.0)
        return btn
    }()
    
    init(delegate: ShoppingCartProtocol) {
        super.init(frame: .zero)
        self.delegate = delegate
        tableView.delegate = delegate
        tableView.dataSource = delegate
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubview(){
        addSubview(containerView)
        containerView.addSubview(tableView)
        containerView.addSubview(bottomContainerView)
        containerView.addSubview(tableView)
        
        bottomContainerView.addSubview(sumLbl)
        bottomContainerView.addSubview(continueBtn)
    }
    
    func setupNavBar(){
        
        deleteBarBtn = UIBarButtonItem(image: UIImage(named: "trash")?.withTintColor(.white), style: .plain, target: delegate, action: #selector(delegate.deleteAction))
        delegate.navigationItem.rightBarButtonItem = deleteBarBtn
    }
//    
    func setupContainerView(){
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    
    
    func setupBottomContainerView(){
        NSLayoutConstraint.activate([
            bottomContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bottomContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            bottomContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            bottomContainerView.heightAnchor.constraint(equalToConstant: 150.0)
        ])
        bottomContainerView.setShadow()
    }
    
    
    func setupContinueBtn(){
        continueBtn.setCorner(radius: 10)
        continueBtn.setShadow()
        NSLayoutConstraint.activate([
            continueBtn.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor, constant: 30.0),
            continueBtn.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor, constant: -30.0),
            continueBtn.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: -30.0),
            continueBtn.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    func setupSumLbl(){
        NSLayoutConstraint.activate([
            sumLbl.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor),
            sumLbl.bottomAnchor.constraint(equalTo: continueBtn.topAnchor, constant: -20.0)
        ])
    }
    
    func setupTableView(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomContainerView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        tableView.register(ShoppingItemCell.self, forCellReuseIdentifier: cellId)
    }
    
    func layoutUI(){
        addSubview()
        setupNavBar()
        setupContainerView()
        setupBottomContainerView()
        setupContinueBtn()
        setupSumLbl()
        setupTableView()
    }
}

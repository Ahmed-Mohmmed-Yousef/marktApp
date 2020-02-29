//
//  CompanyProductsVC.swift
//  marktApp
//
//  Created by Ahmed on 2/26/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class CompanyProductsVC: UIViewController {

    var products: [Product]?
    var company: Company?
    let cellId = "productCell"
    let tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = .clear
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.isEnabled = false

        
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        // navigation Item
        setupCartIcon()
        setupTableView()
    }
    
    func setupCartIcon(){
        navigationItem.backBarButtonItem?.tintColor = .white
        let barBtn = UIBarButtonItem(image: UIImage(named: "carts"), style: .plain, target: self, action: #selector(CartBarBtnPressed))
        barBtn.tintColor = .white
        navigationItem.rightBarButtonItem = barBtn
    }
    
    @objc func CartBarBtnPressed(){
        // MARK: Action when cart button pressed
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.allowsSelection = true
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
    }
    

}

extension CompanyProductsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrP.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! ProductCell
        cell.product = arrP[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

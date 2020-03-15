//
//  ShoppingCartVC.swift
//  marktApp
//
//  Created by Ahmed on 3/11/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class ShoppingCartVC: UIViewController, ShoppingCartProtocol, ShoppingItemCellProtocol {

    lazy var mainView: ShoppingCartView = {
        let view = ShoppingCartView(delegate: self)
        view.backgroundColor = .white
        return view
    }()
    var shopItems = SC.shoppingItems
    lazy var spinner = SpinnerViewController()
    let cellId = "ShoppingItemCell"
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showTotalPrice()
    }
    
    
    func countTotalPrice() -> Double{
        return SC.totalPrice
    }
    
    func showTotalPrice(){
        mainView.sumLbl.text = "\(countTotalPrice()) $"
    }
    // MARK: - ShoppingCartProtocol
    func deleteAction() {
        print("Delete")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! ShoppingItemCell
        let shopCart = shoppingCart[indexPath.row]
        shopCart.valueChaned = {
            print("value changed completon")
        }
        cell.shoppingItem = shopCart
        cell.indexPath = indexPath
        cell.delegate = self
        print(indexPath.row)
        print(shoppingCart[indexPath.row].valueChaned ?? "nil")
        print(shopCart.valueChaned ?? "nil")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // MARK: - ShoppingItemCellProtocol
    func numberOfItemChanged(indexPath: IndexPath, value: Int, completion: @escaping (Int) -> Void) {
        print(indexPath.row)
        shopItems[indexPath.row].setCount(value: value){ [weak self] newValue in
            guard let self = self else {return}
            self.showTotalPrice()
            completion(newValue)
        }
        
    }
    
    
    func deleteItem() {
        
    }
    
    func showSpinner() {
        addChild(spinner)
        spinner.view.frame = view.frame
        view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    
    func removeSpinner() {
        spinner.willMove(toParent: nil)
        spinner.view.removeFromSuperview()
        spinner.removeFromParent()
    }
}



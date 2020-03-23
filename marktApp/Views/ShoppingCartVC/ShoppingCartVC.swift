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
    var shopItems: [ShoppingItem] = SC.shoppingItems
    lazy var spinner = SpinnerViewController()
    let cellId = "ShoppingItemCell"
    
    override func loadView() {
        super.loadView()
        view = mainView
        self.navigationItem.title = "Shopping Cart"
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
        return SC.calcTotalPrice()
    }
    
    func showTotalPrice(){
        mainView.sumLbl.text = "\(countTotalPrice()) $"
    }
    // MARK: - ShoppingCartProtocol and tableView
    func deleteAction() {
        if SC.shoppingItems.count != 0 {
            let isEditing = self.mainView.tableView.isEditing
            self.mainView.tableView.isEditing = !isEditing
            self.mainView.deleteBarBtn?.image = UIImage(named: !isEditing ? "like" : "trash")
        }
    }
    
    func continuAction() {
        if SC.shoppingItems.count != 0 {
            let vc = ShipsToVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SC.shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! ShoppingItemCell
        let shopCart = SC.shoppingItems[indexPath.row]
        cell.shoppingItem = shopCart
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let tempObjcMoved = SC.shoppingItems[sourceIndexPath.item]
        SC.shoppingItems.remove(at: sourceIndexPath.item)
        SC.shoppingItems.insert(tempObjcMoved, at: sourceIndexPath.item)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            SC.shoppingItems.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            // update totale price
            showTotalPrice()
        }
    }
    
    

    // MARK: - ShoppingItemCellProtocol
    func numberOfItemChanged(in item: ShoppingItem, value: Int, completion: @escaping (Int) -> Void) {
        item.setCount(value: value){ [weak self] newValue in
            guard let self = self else {return}
            self.showTotalPrice()
            completion(newValue)
        }
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



//
//  ShowSearchResultsVC.swift
//  marktApp
//
//  Created by Ahmed on 3/27/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit
import MapKit

class ShowSearchResultsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var matchingItems:[MKMapItem] = []
    private let cellId = "mapItemCell"
    
    private var tableView: UITableView = {
        var tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "mapItemCell")
        return tb
    }()
    
    private lazy var closeBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .gray
        btn.setImage(#imageLiteral(resourceName: "close") , for: .normal)
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return btn
    }()
    
    var didSelectAction: ((MKMapItem?)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setupCloseBtn()
        self.setupTableView()
    }
    
    // MARK:~ UITableViewDelegate, UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let selectedItem = matchingItems[indexPath.row].placemark
        cell.textLabel?.text = selectedItem.name
        cell.detailTextLabel?.text = selectedItem.subtitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mapItem = matchingItems[indexPath.row]
        guard let didSelectAction = didSelectAction else { return }
        didSelectAction(mapItem)
        self.closeAction()
    }
    
    @objc func closeAction(){
        self.dismiss(animated: true)
    }
    
    private func setupCloseBtn(){
        self.view.addSubview(closeBtn)
        NSLayoutConstraint.activate([
            closeBtn.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 8.0),
            closeBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8.0),
        ])
    }
    
    private func setupTableView(){
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: closeBtn.bottomAnchor, constant: 8.0),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

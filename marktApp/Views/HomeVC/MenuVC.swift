//
//  MenuVC.swift
//  marktApp
//
//  Created by Ahmed on 2/25/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

private let reuseIdentifer = "MenuOptionCell"

class MenuVC: UIViewController {
    
    // MARK: - Properties
    var delegate: HomeControllerDelegate?
    var tableView: UITableView!

    let profileView: UIView = {
        let pview = UIView()
        pview.translatesAutoresizingMaskIntoConstraints = false
        pview.backgroundColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
        return pview
    }()
    
    let profileImg: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "profile"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .clear
        return imgView
    }()
    
    let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "User name"
        lbl.textColor = .white
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 24)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let profileSettingBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Edite your data", for: .normal)
        btn.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 22)
        btn.setTitleColor(#colorLiteral(red: 1, green: 0.837153554, blue: 0, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(editeBtnAction), for: .touchUpInside)
        return btn
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis          = .vertical
        sv.distribution  = .fill
        sv.spacing       = 4
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupProfileView()
        setupProfileImg()
        setupTableView()
        setupStackView()
    }
    
    @objc func editeBtnAction(){
        // MARK: ~ Go to profile settings
    }

    func setupProfileView(){
        view.addSubview(profileView)
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setupProfileImg(){
        profileView.addSubview(profileImg)
        NSLayoutConstraint.activate([
            profileImg.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 16.0),
            profileImg.bottomAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -20.0),
            profileImg.widthAnchor.constraint(equalToConstant: 80),
            profileImg.heightAnchor.constraint(equalToConstant: 80)
        ])
        profileImg.layer.borderWidth = 2
        profileImg.layer.borderColor = UIColor.white.cgColor
        profileImg.layer.cornerRadius = 40
        profileImg.clipsToBounds = true
    }
    
    func setupStackView(){
        profileView.addSubview(stackView)
        stackView.addArrangedSubview(nameLbl)
        stackView.addArrangedSubview(profileSettingBtn)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: profileImg.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 10)
        ])
    }
    
    func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifer)
        tableView.backgroundColor = .white
        tableView.tintColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: profileView.bottomAnchor)
        ])
    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionCell
        
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
    
}

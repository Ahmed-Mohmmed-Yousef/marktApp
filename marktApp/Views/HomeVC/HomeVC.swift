//
//  HomeVC.swift
//  marktApp
//
//  Created by Ahmed on 2/16/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
     var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
    
    let ContainerLoginView: UIView = {
        let ContainerView = UIView()
        ContainerView.translatesAutoresizingMaskIntoConstraints = false
        ContainerView.backgroundColor = .lightGray
        return ContainerView
    }()
    
    let contentView: UIView = {
        let ContentView = UIView()
        ContentView.translatesAutoresizingMaskIntoConstraints = false
        ContentView.backgroundColor = .white
        return ContentView
    }()
    
    let loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return loginBtn
    }()
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.text = "Select your company"
        lbl.font = UIFont(name: "AvenirNextCondensed-Bold", size: 30)
        return lbl
    }()
    
    let tableView: UITableView = {
       let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()

    var authController = AuthController()
    
    let cellId = "CompanyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMinue()
        setIcon()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkLogin()
    }
    
    // set water icon in nav bar
    func setIcon(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 35))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "water")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    // set side minue
    func setupSideMinue(){
        let image = UIImage(named: "person")
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
    }
    
    
   
    // MARK:~ content view setup
    func setupContentView(){
        view.addSubview(contentView)
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0)
            .isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0)
            .isActive = true
        contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0)
            .isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0)
            .isActive = true
        contentView.backgroundColor = #colorLiteral(red: 0.9479303083, green: 0.95, blue: 0.95, alpha: 1)
        
        titleLblSetup()
        setupTableView()
    }
    
    func titleLblSetup(){
        contentView.addSubview(titleLbl)
        titleLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }
    
    func setupTableView(){
        contentView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 32).isActive = true
        tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        tableView.register(CompanyCell.self, forCellReuseIdentifier: cellId)
    }

}

// MARK:~ UITableViewDelegate, UITableViewDataSource
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CompanyCell
        let currentLastItem = arrC[indexPath.row]
        cell.company = currentLastItem
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
}


// MARK:~  exteintion for login vc and login setups
extension HomeVC: LoginDelegate{
    func loginDone() {
        checkLogin()
    }
    
    fileprivate func checkLogin() {
           self.ContainerLoginView.removeFromSuperview()
           if !authController.isLoged(){
               setupLoginBtn()
               loginAction()
           } else {
               setupContentView()
           }
       }


       /// login view
       func setupLoginBtn(){
           // ContainerView
           view.addSubview(ContainerLoginView)
           ContainerLoginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0)
               .isActive = true
           ContainerLoginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0)
               .isActive = true
           ContainerLoginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0)
               .isActive = true
           ContainerLoginView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0)
               .isActive = true
           
           // loginBtn
           ContainerLoginView.addSubview(loginBtn)
           loginBtn.centerYAnchor.constraint(equalTo: ContainerLoginView.centerYAnchor, constant: 0.0)
               .isActive = true
           loginBtn.centerXAnchor.constraint(equalTo: ContainerLoginView.centerXAnchor, constant: 0.0)
               .isActive = true
           loginBtn.widthAnchor.constraint(equalToConstant: 100)
               .isActive = true
           loginBtn.heightAnchor.constraint(equalToConstant: 40)
               .isActive = true
           loginBtn.setTitleColor(.white, for: .normal)
           loginBtn.titleLabel?.font = UIFont(name: "Avenir Next", size: 30)
           loginBtn.backgroundColor = .orange
           loginBtn.setBorder()
           loginBtn.setCorner()
       }
       
       @objc func loginAction(){
           let sb = UIStoryboard(name: "LoginVC", bundle: nil)
           let vc = sb.instantiateInitialViewController() as! LoginVC
           vc.delegat = self
           present( vc, animated: true)
       }
       
}


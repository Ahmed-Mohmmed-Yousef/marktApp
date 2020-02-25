//
//  CompanyCell.swift
//  marktApp
//
//  Created by Ahmed on 2/23/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {
    
    var company: Company? {
        didSet{
            imgView.image = company?.img
            nameLbl.text = company?.name
        }
    }
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let imgView: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "waterBottol"))
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let nameLbl: UILabel = {
        let lbl  = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "AvenirNext-DemiBold", size: 26)
        lbl.textAlignment = .center
        lbl.textColor = .black
        return lbl
    }()
    
    let goImg: UIImageView = {
        let goImg = UIImageView()
        goImg.translatesAutoresizingMaskIntoConstraints = false
        goImg.backgroundColor = .clear
        goImg.image = #imageLiteral(resourceName: "right-arrow")
        return goImg
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupContainerView()
        setupImgView()
        setupNameLbl()
        setupGoImg()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContainerView(){
        addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        containerView.setCorner()
        containerView.setShadow()
    }
    
    func setupImgView(){
        containerView.addSubview(imgView)
        imgView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imgView.contentMode = .scaleAspectFit
        
    }
    
    func setupNameLbl() {
        containerView.addSubview(nameLbl)
        nameLbl.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        nameLbl.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 16).isActive = true
    }
    
    func setupGoImg(){
        containerView.addSubview(goImg)
        goImg.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        goImg.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        goImg.widthAnchor.constraint(equalToConstant: 24).isActive = true
        goImg.contentMode = .scaleAspectFit
        goImg.tintColor = #colorLiteral(red: 0.875915885, green: 0.1924651265, blue: 0.2923229039, alpha: 1)
    }
    
    

}

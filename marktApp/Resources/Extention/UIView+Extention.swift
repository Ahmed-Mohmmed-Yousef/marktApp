//
//  UIView+Extention.swift
//  marktApp
//
//  Created by Ahmed on 2/10/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

extension UIView{
    func setCorner(radius: CGFloat = 10.0) {
        self.layoutIfNeeded()
        self.layer.cornerRadius = radius
//        self.clipsToBounds = true
    }
    
    func circleCorner() {
        superview?.layoutIfNeeded()
        setCorner(radius: frame.height / 2)
    }
    
    func setBorder(width: CGFloat = 0.5, color: UIColor = .black) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func setShadow(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false

    }
    
    func setValidInput(){
        layer.shadowColor = UIColor.green.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
    }
    
    func setErrorInput(){
        layer.shadowColor = UIColor.red.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
    }
}

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
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func circleCorner() {
        superview?.layoutIfNeeded()
        setCorner(radius: frame.height / 2)
    }
    
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func setShadow(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false

//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 1
//        layer.shadowOffset = .zero
        
//        layer.shadowRadius = 10
//        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale
    }
}

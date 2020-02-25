//
//  UITextField.swift
//  marktApp
//
//  Created by Ahmed on 2/14/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

extension UITextField{
    enum Style: String {
        case Bold = "Avenir Next Bold"
        case Medium = "Avenir Next Medium"
        case Regular = "Avenir Next Regular"
    }
    
    func fontSetup(style: Style, size: CGFloat){
        self.font = UIFont(name: style.rawValue, size: size)
    }
    
}

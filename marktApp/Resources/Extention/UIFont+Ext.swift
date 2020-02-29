//
//  UIFont+Ext.swift
//  marktApp
//
//  Created by Ahmed on 2/29/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

extension UIFont{
    enum AvenirNextStyl: String {
        case Bold = "AvenirNext-Bold"
        case Medium = "AvenirNext-Medium"
        case Regular = "AvenirNext-Regular"
        case DemiBold = "AvenirNext-DemiBold"
    }
    
    static func setAvenirNext(with style: AvenirNextStyl, size: CGFloat) -> UIFont?{
        return UIFont(name: style.rawValue, size: size)
    }
}

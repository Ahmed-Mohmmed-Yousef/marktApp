//
//  MenuOption.swift
//  marktApp
//
//  Created by Ahmed on 2/25/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit
enum MenuOption: Int, CustomStringConvertible {
    
    case Main
    case Orders
    case Call
    case About
    case Usage
    case Share
    
    var description: String {
        switch self {
            case .Main:     return "Main View"
            case .Orders:   return "All orders"
            case .Call:     return "Contact us"
            case .About:    return "About app"
            case .Usage:    return "Usage rules"
            case .Share:    return "Share"
        }
    }
    
    var image: UIImage {
        switch self {
            case .Main:     return UIImage(systemName: "house") ?? UIImage()
            case .Orders:   return UIImage(systemName: "cart") ?? UIImage()
            case .Call:     return UIImage(systemName: "phone") ?? UIImage()
            case .About:    return UIImage(systemName: "info.circle") ?? UIImage()
            case .Usage:    return UIImage(systemName: "lock") ?? UIImage()
            case .Share:    return UIImage(systemName: "square.and.arrow.up") ?? UIImage()
        }
    }
}

//
//  DataCenter.swift
//  marktApp
//
//  Created by Ahmed on 2/20/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

struct Company {
    let name: String
    let img: UIImage
}
struct Product {
    let productName: String
    let price: Double
    let lowerBoundForOrder: Int
    let size: Int
    let ownerCompany: String
    let Img: UIImage
    let discreption: String
}

let nova = Company(name: "Nova", img: #imageLiteral(resourceName: "novaWater"))
let nestle = Company(name: "Nestle", img: #imageLiteral(resourceName: "nestleWater"))
let hellwa = Company(name: "Hellwa", img: #imageLiteral(resourceName: "hilwaWater"))
let berain = Company(name: "Berain", img: #imageLiteral(resourceName: "perainWater"))
let tania = Company(name: "Tania", img: #imageLiteral(resourceName: "taniaWater"))
let arrC = [nova,nestle,hellwa,berain,tania]

let p1 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla......")
let p2 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla......")
let p3 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla......")
let p4 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla......")
let p5 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla......")
let p6 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla......")
let p7 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla......")
let p8 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla......")
let ap8 = Product(productName: "", price: 0, lowerBoundForOrder: 0, size: 0, ownerCompany: "", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "")
let arrP: [Product] = [p1,p2,p3,p4,p5,p6,p7,p8]
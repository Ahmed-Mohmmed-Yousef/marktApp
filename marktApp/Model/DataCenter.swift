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

class ShoppingItem {
    let product: Product
    private(set) var count: Int{
        didSet{
            if let chaned = valueChaned{
                chaned()
            }else{
                print("nil value")
            }
        }
    }
    
    var totalPrice: Double {
        return Double(count) * product.price
    }
    
    var valueChaned:(() ->())?
    
    
    init(product: Product) {
        self.product = product
        self.count = product.lowerBoundForOrder
    }
    
    func setCount(value: Int, completion: @escaping(Int) -> Void){
        count = value < product.lowerBoundForOrder ? product.lowerBoundForOrder : value
        completion(count)
    }
    
    
}

let nova    = Company(name: "Nova", img: #imageLiteral(resourceName: "novaWater"))
let nestle  = Company(name: "Nestle", img: #imageLiteral(resourceName: "nestleWater"))
let hellwa  = Company(name: "Hellwa", img: #imageLiteral(resourceName: "hilwaWater"))
let berain  = Company(name: "Berain", img: #imageLiteral(resourceName: "perainWater"))
let tania   = Company(name: "Tania", img: #imageLiteral(resourceName: "taniaWater"))
let arrC    = [nova,nestle,hellwa,berain,tania]

let p1 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 3, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
let p2 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
let p3 = Product(productName: "Nestle Water", price: 23.0, lowerBoundForOrder: 7, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bl ABCDEF\n ❤️😂😍😁🔥👍")
let p4 = Product(productName: "Nestle Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nestl", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
let p5 = Product(productName: "Hellwa Water", price: 23.0, lowerBoundForOrder: 1, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
let p6 = Product(productName: "Hellwa Water", price: 23.0, lowerBoundForOrder: 9, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
let p7 = Product(productName: "Berain Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
let p8 = Product(productName: "Berain Water", price: 23.0, lowerBoundForOrder: 8, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
let p9 = Product(productName: "Tania Water", price: 23.0, lowerBoundForOrder: 2, size: 12, ownerCompany: "Nova", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
let p10 = Product(productName: "Tania Water", price: 23.0, lowerBoundForOrder: 3, size: 12, ownerCompany: "Nestl", Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Bla Bla BlaBla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")

let arrP: [Product] = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10]
var shoppingCart: [ShoppingItem] = [ShoppingItem(product: p1), ShoppingItem(product: p4)]


class SC {
    static var shoppingItems: [ShoppingItem] = [ShoppingItem(product: p1), ShoppingItem(product: p4)]
    static var totalPrice: Double{
        var total = 0.0
        for item in shoppingItems {
            total += item.totalPrice
        }
        return total
    }
}

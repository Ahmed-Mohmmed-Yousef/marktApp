//
//  DataCenter.swift
//  marktApp
//
//  Created by Ahmed on 2/20/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class Company {
    static var mainId = 0
    var id: Int
    let name: String
    let img: UIImage
    var products: [Product] = [Product]()
    init(name: String, img: UIImage) {
        self.name = name
        self.img = img
        id = Company.mainId
        Company.mainId += 1
    }
}

class Product {
    private static var mainId = 0
    var id: Int
    let productName: String
    let price: Double
    let lowerBoundForOrder: Int
    let size: Int
    let img: UIImage
    let discreption: String
    
    init(productName: String, price: Double, lowerBoundForOrder: Int, size: Int, Img: UIImage, discreption: String) {
        self.productName = productName
        self.price = price
        self.lowerBoundForOrder = lowerBoundForOrder
        self.size = size
        self.img = Img
        self.discreption = discreption
        self.id = Product.mainId
        Product.mainId += 1
    }
    
}

class ShoppingItem {
    let product: Product
    private(set) var count: Int
    var totalPrice: Double {
        return Double(count) * product.price
    }
    init(product: Product) {
        self.product = product
        self.count = product.lowerBoundForOrder
    }
    
    func setCount(value: Int, completion: @escaping(Int) -> Void){
        count = value < product.lowerBoundForOrder ? product.lowerBoundForOrder : value
        completion(count)
    }
}
let p1 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 3, size: 3, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Nova Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
class SC {
    static var shoppingItems: [ShoppingItem] = [ShoppingItem(product: p1), ShoppingItem(product: p1), ShoppingItem(product: p1)]
    
    private init(){}
    
    static func calcTotalPrice() -> Double{
        var total = 0.0
        for item in shoppingItems {
            total += item.totalPrice
        }
        return total
    }
    
    static func addItem(product: Product, completion: @escaping(Bool) -> Void){
        if isExiste(product: product){
            let indx = shoppingItems.firstIndex{$0.product.id == product.id}!
            shoppingItems.remove(at: indx)
            completion(false)
        } else {
            let item = ShoppingItem(product: product)
            shoppingItems.append(item)
            completion(true)
        }
    }
    
    static func isExiste(product: Product) -> Bool{
        return shoppingItems.contains{$0.product.id == product.id}
    }
    
}

class API{
    private static var companies: [Company] = []
    private static func initValues(){
        let p1 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 3, size: 3, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Nova Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
        let p2 = Product(productName: "Nova Water", price: 23.0, lowerBoundForOrder: 2, size: 12, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Nova Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
        let p3 = Product(productName: "Nestle Water", price: 23.0, lowerBoundForOrder: 7, size: 12, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Nestle Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bl ABCDEF\n ❤️😂😍😁🔥👍")
        let p4 = Product(productName: "Nestle Water", price: 23.0, lowerBoundForOrder: 2, size: 9, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Nestle Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
        let p5 = Product(productName: "Hellwa Water", price: 23.0, lowerBoundForOrder: 1, size: 12, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Hellwa Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
        let p6 = Product(productName: "Hellwa Water", price: 23.0, lowerBoundForOrder: 9, size: 2, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Hellwa Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
        let p7 = Product(productName: "Berain Water", price: 23.0, lowerBoundForOrder: 2, size: 5, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Berain Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
        let p8 = Product(productName: "Berain Water", price: 23.0, lowerBoundForOrder: 8, size: 8, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Berain Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
        let p9 = Product(productName: "Tania Water", price: 23.0, lowerBoundForOrder: 2, size: 14, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Tania Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
        let p10 = Product(productName: "Tania Water", price: 23.0, lowerBoundForOrder: 3, size: 6, Img: #imageLiteral(resourceName: "waterBottol"), discreption: "Tania Water Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla Bla ABCDEF\n ❤️😂😍😁🔥👍")
        let nova    = Company(name: "Nova", img: #imageLiteral(resourceName: "novaWater"))
        let nestle  = Company(name: "Nestle", img: #imageLiteral(resourceName: "nestleWater"))
        let hellwa  = Company(name: "Hellwa", img: #imageLiteral(resourceName: "hilwaWater"))
        let berain  = Company(name: "Berain", img: #imageLiteral(resourceName: "perainWater"))
        let tania   = Company(name: "Tania", img: #imageLiteral(resourceName: "taniaWater"))
        
        nova.products   = [p1, p2]
        nestle.products = [p3, p4]
        hellwa.products = [p5, p6]
        berain.products = [p7, p8]
        tania.products  = [p9, p10]
        
        companies = [nova, nestle, hellwa, berain, tania]
    }
    
    static func getCompanies() -> [Company]{
        if companies.count == 0 {
            initValues()
        }
        return companies
    }
    
}

class UserInfo {
    static var name = "Ahmed Mohamed"
    static var phone = "01141746591"
    static var city = "Qena"
    static var region = "Abnoud"
    static var street = "El-Omda"
    static var building = "#3"
    static var floor = "#3"
    static var location = "Egypt"
    
}




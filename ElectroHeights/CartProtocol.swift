//
//  CartProtocol.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 17/11/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

protocol CartProtocol {
    
    
    func totalAmount()->Double
    func totalProducts()->Int
    func contents()->[AnyObject]
    
    func getProduct(productID:String)->CartItem
    func removeProduct(product: ProductItem)->Bool
    func addProduct(product:ProductItem)->Bool
    func addProduct(product:ProductItem, quantity : Int)
    func exists(product: ProductItem)->Bool
    func isEmpty()->Bool
    func clearCart()->Bool
}

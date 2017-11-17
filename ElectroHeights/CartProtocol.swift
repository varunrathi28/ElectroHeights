//
//  CartProtocol.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 17/11/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

protocol CartProtocol {
    
    
    static  func totalAmount()->Double
    static  func totalProducts()->Int
    static  func contents()->[AnyObject]
    
    static  func getProduct(productID:String)->CartItem
    static  func removeProduct(product: ProductItem)->Bool
    static   func addProduct(product:ProductItem)->Bool
    static  func addProduct(product:ProductItem, quantity : Int)
    static  func exists(product: ProductItem)->Bool
    static  func isEmpty()->Bool
    static  func clearCart()->Bool
}

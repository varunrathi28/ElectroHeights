//
//  WishListProduct.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 13/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SwiftyJSON

class WishListProduct: BaseProduct {

    var ProductVariationID:Int!
    var ProductSubTitle:String!
    var ProductLot:Float?
    var ProductMRP:Float!
    var DiscountMRP:Float!
    var MinOrderQty:Float?
    var OrderQty:Float!
    var ProductURL:String!
    var ImageLocation:String!
    var InStock:Bool!
    
    
    
    init(with json:JSON) {
        self.ProductVariationID = json["ProductVariationID"].intValue
        self.ProductSubTitle = json["ProductSubTitle"].stringValue
        self.ProductLot = json["ProductLot"].floatValue
        self.ProductMRP = json["ProductMRP"].floatValue
        self.MinOrderQty = json["MinOrderQty"].floatValue
        self.OrderQty = json["OrderQty"].floatValue
        self.DiscountMRP = json["DiscountMRP"].floatValue
        self.ImageLocation = json["ImageLocation"].stringValue
        self.ProductURL = json["ProductURL"].stringValue
        self.InStock = json["InStock"].boolValue
    }
    
}

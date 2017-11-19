//
//  ShoppingCartProduct.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 13/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SwiftyJSON

class ShoppingCartProduct: NSObject {

    var ProductName:String!
    var MinOrderQty:Double!
    var ProductLot:Double!
    var ProductCode:String!
    var ProductSubTitle:String!
    var ImageLocation:String!
    var UnitName:String!
    var ProductURL:String!
    
    var TaxPer:Double!
    var Amount:Double!
    var TaxValue:Double?
    var ProductQty:Double!
    var ProductVariationID:Double!
    var ProductMRP:Double!
    var OfferDiscountRs:Double?
    
    init(with json:JSON) {
        
        super.init()
        self.ProductName = json["ProductName"].stringValue
        self.MinOrderQty = json["MinOrderQty"].doubleValue
        self.ProductLot = json["ProductLot"].doubleValue
        self.ProductCode = json["ProductCode"].stringValue
        self.ProductSubTitle = json["ProductSubTitle"].stringValue
        self.ImageLocation = json["ImageLocation"].stringValue
        self.UnitName = json["UnitName"].stringValue
        self.ProductURL = json["ProductURL"].stringValue
        self.TaxPer = json["TaxPer"].doubleValue
        self.Amount = json["Amount"].doubleValue
        self.ProductQty = json["ProductQty"].doubleValue
        self.ProductVariationID = json["ProductVariationID"].doubleValue
        self.ProductMRP = json["ProductMRP"].doubleValue
        self.OfferDiscountRs = json["OfferDiscountRs"].doubleValue
    }

}
/*
{
    "TaxPer" : 12,
    "Amount" : 76160,
    "ProductName" : "Led Panel light",
    "MinOrderQty" : 50,
    "ProductLot" : 50,
    "ProductVariationID" : 157,
    "ProductCode" : "6sslm",
    "ProductMRP" : 100,
    "ProductSubTitle" : "6 Watt Square slim Led Panel Light",
    "ImageLocation" : "http:\/\/admin.electroheight.com\/uploads\/Product\/ProductImages\/188.jpg",
    "DiscountRs" : 32000,
    "OfferDiscountRs" : 0,
    "TaxValue" : 8160,
    "ProductQty" : 1000,
    "UnitName" : "Piece",
    "ProductURL" : "6-Watt-Square-slim-Led-Panel-Light"
}

 
 */

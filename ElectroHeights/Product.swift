//
//  Product.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 02/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SwiftyJSON



class BaseProduct
{
    var productType:ProductType!
    
}

class CategoryProduct: BaseProduct {
    
    var ProductSubCategoryID:Double!
    var SubCategoryName :String?
    var CategoryUrl:String?
    var ImageLocation:String?
    
    init(productSubCategoryID: Double, SubCategoryName:String, CategoryUrl:String, ImageLocation:String)
    {
        self.ProductSubCategoryID = productSubCategoryID
        self.SubCategoryName = SubCategoryName
        self.CategoryUrl = CategoryUrl
        self.ImageLocation = ImageLocation
    }
    
    
    class func build(json:JSON) -> CategoryProduct? {
        
           let subCategoryId = json["ProductSubCategoryID"].double
         let   subCatName = json["SubCategoryName"].string
          let  catUrl  = json["CategoryUrl"].string
         let   imgLocation = json["ImageLocation"].string
           
        
            return CategoryProduct(productSubCategoryID: subCategoryId!, SubCategoryName: subCatName!, CategoryUrl: catUrl!, ImageLocation: imgLocation!)
        }
}


class FeaturedProduct: BaseProduct {
    
    var ProductVariationID:Double!
    var ProductSubTitle:String?
    var ProductURL:String!
    
    var ProductDescription:String?
    var ProductTags:String?
    var ProductMRP:Double?
    var DiscountMRP:Double?
    var ProductLot:Double?
    var MinOrderQty:Double?
    var OrderQty:Double?
    var ImageLocation:String?
    var UnitName:String?
    var ProductCode:String!
    var WishlistClass:String?
    var InStock:Bool?
    
    
     init(ProductVariationID: Double, ProductSubTitle:String, ProductURL:String, ProductDescription:String,
        ProductTags:String, ProductMRP:Double , DiscountMRP:Double, ProductLot:Double, MinOrderQty:Double, OrderQty:Double,ImageLocation:String, UnitName:String, ProductCode:String, WishlistClass:String, InStock:Bool)
     {
        self.ProductVariationID = ProductVariationID
        self.ProductSubTitle = ProductSubTitle
        self.ProductDescription = ProductDescription
        self.ProductTags = ProductTags
        self.ProductMRP = ProductMRP
        self.DiscountMRP = DiscountMRP
        self.ProductLot = ProductLot
        self.MinOrderQty = MinOrderQty
        self.OrderQty = OrderQty
        self.ImageLocation = ImageLocation
        self.UnitName = UnitName
        self.ProductCode = ProductCode
        self.WishlistClass = WishlistClass
        self.InStock = InStock
        
    }
    
    
    class func build(json:JSON) -> FeaturedProduct? {
        
        let ProductVariationID = json["ProductVariationID"].doubleValue
         let ProductSubTitle = json["ProductSubTitle"].string
        let ProductURL = json["ProductURL"].stringValue
        let ProductDescription = json["ProductDescription"].string
        let ProductTags = json["ProductTags"].string
        let ProductMRP = json["ProductMRP"].double
        let DiscountMRP = json["DiscountMRP"].double
        let ProductLot = json["ProductLot"].double
        let MinOrderQty = json["MinOrderQty"].double
        let OrderQty = json["OrderQty"].double
        let ImageLocation = json["ImageLocation"].string
        let UnitName = json["UnitName"].string
         let ProductCode = json["ProductCode"].stringValue
         let WishlistClass = json["WishlistClass"].string
         let InStock = json["InStock"].bool
        
        return FeaturedProduct(ProductVariationID: ProductVariationID, ProductSubTitle: ProductSubTitle!, ProductURL: ProductURL, ProductDescription: ProductDescription!, ProductTags: ProductTags!, ProductMRP: ProductMRP!, DiscountMRP: DiscountMRP!, ProductLot: ProductLot!, MinOrderQty: MinOrderQty!, OrderQty: OrderQty!, ImageLocation: ImageLocation!, UnitName: UnitName!, ProductCode: ProductCode, WishlistClass: WishlistClass!, InStock: InStock!)
    }

    
    /*
     {
     "ProductVariationID": 109,
     "ProductSubTitle": "150mm*1.9mm cable tie 100pcs",
     "ProductURL": "150mm-19mm-cable-tie-100pcs",
     "ProductDescription": "A cable tie is designed to make wiring and the installation of wiring systems quick easy and well organised.",
     "ProductTags": "100mm-cable-tie,4nch-cable-tie",
     "ProductMRP": 21,
     "DiscountMRP": 1,
     "ProductLot": 5,
     "MinOrderQty": 5,
     "OrderQty": 5,
     "ImageLocation": "http://admin.electroheight.com/uploads/Product/ProductImages/123.jpg",
     "UnitName": "Pkt",
     "ProductCode": "15019nb",
     "WishlistClass": "icon fa fa-heart",
     "InStock": true
     }
 */
}

//
//  Model.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 12/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//




import UIKit
import SwiftyJSON


struct CellData
{
    var text:String!
    var imageName:String!
    
    init(text:String!, imageName:String = "electro_heights") {
        self.text = text
        self.imageName = imageName
    }
    
}


struct Category
{
    var ProductCategoryID:Int!
    var CategoryName:String!
    
    init(categoryId:Int, categoryName:String) {
        self.CategoryName = categoryName
        self.ProductCategoryID = categoryId
        
        
    }
    
    init(with json:JSON) {
        self.ProductCategoryID = json["ProductCategoryID"].intValue
        self.CategoryName = json["CategoryName"].stringValue
    }
    
}

struct SubCategory {
    var ProductSubCategoryID:Int!
    var SubCategoryName:String!
    var ImageLocation:String!
    
    init(with json :JSON) {
        self.ProductSubCategoryID = json["ProductSubCategoryID"].intValue
        self.SubCategoryName = json["SubCategoryName"].stringValue
        self.ImageLocation = json["ImageLocation"].stringValue
    }
}





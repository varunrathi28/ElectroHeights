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


struct Banner {
    var BannerUrl:String!
    var ImageLocation:String!
}


class User : NSObject
{
    
    var CustomerID: Double!
    
    var MobileNo:String!
    var ServiceTaxNo:String?
    var OpeningBalance:Double?
    var AlternativeMobileNo2:String!
    
    var Name:String!
    var EmailAddress:String?
    var CityID:Double?
    var TINNo:String?
    
    var AlternativeMobileNo3 :String!
    var CompanyName : String!
    var Address:String!
    var Gender:String!
    var WhatsappNo:String!
    var PostalCode:String!
    var CTSNo:String!
    var AlternativeMobileNo1:String!
    
    var CreditLimit:Double?
    var StateID :Double?
    
     init(with data:JSON)
    {
        super.init()
        
        self.MobileNo = data["MobileNo"].string
        self.ServiceTaxNo = data["ServiceTaxNo"].string
        self.OpeningBalance = data["ServiceTaxNo"].double
        self.AlternativeMobileNo1 = data["AlternativeMobileNo1"].string
         self.AlternativeMobileNo2 = data["AlternativeMobileNo2"].string
         self.AlternativeMobileNo3 = data["AlternativeMobileNo3"].string
        
        self.Name = data["Name"].stringValue
        
        self.EmailAddress = data["EmailAddress"].string
        self.CityID = data["CityID"].double

        self.TINNo = data["TINNo"].string
        self.CompanyName = data["CompanyName"].string
        self.Address = data["Address"].string
        self.Gender = data["Gender"].string
        self.WhatsappNo = data["WhatsappNo"].string
        self.PostalCode = data["PostalCode"].string
        self.CTSNo = data["CTSNo"].string
        self.CreditLimit = data["CreditLimit"].double
        self.StateID = data["StateID"].double
    }
    

    
}


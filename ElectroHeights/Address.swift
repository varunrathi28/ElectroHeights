//
//  Address.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 20/11/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SwiftyJSON

class Address: NSObject {
//ShippingAddressID ,StreetAddress,Name,CityName,StateName,Pincode,PhoneNo,IsDefault
    
    var ShippingAddressID: String!
    var StreetAddress:String?
    var Name:String!
    var CityName:String!
    var StateName:String!
    var Pincode:String!
    var PhoneNo:String!
    var IsDefault:Bool?
    var isSelected:Bool!
   
    
    
    init(with json:JSON) {
        
        self.ShippingAddressID = json["ShippingAddressID"].stringValue
        self.StreetAddress = json["StreetAddress"].stringValue
        self.Name = json["Name"].stringValue
        self.CityName = json["CityName"].stringValue
        self.StateName = json["StateName"].stringValue
        self.Pincode = json["Pincode"].stringValue
        self.PhoneNo = json["PhoneNo"].stringValue
        self.IsDefault = json["IsDefault"].boolValue
        self.isSelected = false
    }
    
    override init() {
        super.init()
       
    }
}

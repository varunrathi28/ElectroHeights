//
//  Order.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 16/11/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SwiftyJSON

class CustomerOrder: NSObject
{
    var Status:String!
    var SellingOrderID:Double!
    var AddedOn:String?
    var TotalDiscount:Double?
    var RowID:Int!
    var TotalTax:Double?
    var OrderNo:String!
    var IsPending:Bool!
    
      init(with json:JSON) {
        
        super.init()
        self.Status = json["Status"].stringValue
        self.SellingOrderID = json["SellingOrderID"].doubleValue
        self.AddedOn = json["AddedOn"].stringValue
        self.TotalDiscount = json["TotalDiscount"].doubleValue
        self.RowID = json["RowID"].intValue
        self.TotalTax = json["TotalTax"].doubleValue
        self.OrderNo = json["OrderNo"].stringValue
        self.IsPending = json["IsPending"].boolValue
    }
    
}



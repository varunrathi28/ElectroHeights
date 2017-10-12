//
//  Enums.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 30/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit



enum ProductType:Int {
    case FeaturedProduct = 0, NewProducts , SubCategory, Banners
}

public enum MyProfileMenu:Int, Hashable {
    case name
    case email
    case mobileNo
    case whatsAppNo
    case gender
    case state
    case city
    case pincode
    case address
    case companyName
    case CTSNo
    case tinNo
    case customerServiceTaxNo
    
    public var hashValue : Int {
        return self.toInt()
    }

    
    static public func == (lhs: MyProfileMenu, rhs: MyProfileMenu) -> Bool {
        return lhs.toInt() == rhs.toInt()
    }

    
    private func toInt()->Int
    {
        switch self {
        case .name:
            return 0
            
        case .email:
                return 1
            
        case .mobileNo:
                return 2
            
        case .whatsAppNo:
                return 3
            
        case .gender:
                return 4
            
        case .state:
                return 5
            
        case .city:
                return 6
            
        case .pincode:
                return 7
            
        case .address:
                return 8
            
        case .companyName:
                return 9
            
        case .CTSNo:
                return 10
            
        case .tinNo:
                return 11
            
        case .customerServiceTaxNo:
                return 12
        }
        
        
        
    }
    
    
    
    
}

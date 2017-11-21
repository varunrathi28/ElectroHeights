//
//  User.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 06/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SwiftyJSON

enum Gender {
    case Male
    case Female
}


class Customer : NSObject, NSCoding
{
    var CustomerID: Double!
    var Name:String!
    var Gender:String!
    
     init(customerID:Double, Name:String, Gender:String) {
      super.init()
        self.CustomerID = customerID
        self.Name = Name
        self.Gender = Gender
      
    }
    
    //MARK:- NSCoding
    required init?(coder aDecoder: NSCoder) {
        CustomerID = aDecoder.decodeObject(forKey: "CustomerID") as! Double
        Name = aDecoder.decodeObject(forKey: "Name")  as! String
        Gender = aDecoder.decodeObject(forKey: "Gender") as! String
        
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(Name, forKey: "Name")
        aCoder.encode(Gender,forKey: "Gender")
        aCoder.encode(CustomerID,forKey: "CustomerID")
    }
    
   private static var _currentUser:User!
    
    
    
    
    static var isLoggedIn:Bool
    {
        return currentUser != nil
    }
    
    static var currentUser:User?
    {
        
        get
        {
            if _currentUser != nil
            {
                return _currentUser
            }
            else
            {
                let defaults = UserDefaults.standard
                
                if let unArchivedObject = defaults.object(forKey: "currentUser") as? NSData
                {
                    _currentUser = NSKeyedUnarchiver.unarchiveObject(with: unArchivedObject as Data) as? User
                    return _currentUser
                }
                
                return nil
            }
            
        }
        set
        {
            _currentUser = newValue
            let defaults = UserDefaults.standard
            
            if let user = newValue
            {
                let archivedObject = NSKeyedArchiver.archivedData(withRootObject: user)
                defaults.set(archivedObject, forKey: "currentUser")
                
            }
            else
            {
                defaults.removeObject(forKey: "currentUser")
            }
            
            
        }
    }
    
    
}


class User : NSObject, NSCoding
{
    // MARK: - Properties
    
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
    
    //MARK:- NSCoding
    required init?(coder aDecoder: NSCoder) {
        CustomerID = aDecoder.decodeObject(forKey: "CustomerID") as! Double
        Name = aDecoder.decodeObject(forKey: "Name")  as! String
        Gender = aDecoder.decodeObject(forKey: "Gender") as! String
        
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(Name, forKey: "Name")
        aCoder.encode(Gender,forKey: "Gender")
        aCoder.encode(CustomerID,forKey: "CustomerID")
    }
    
    //MARK:- Authentication
    
    static var _currentUser:User!
    
   
    
    
    static var isLoggedIn:Bool
    {
        return currentUser != nil
    }
    
    static var currentUser:User?
    {
        
        get
        {
            if _currentUser != nil
            {
                return _currentUser
            }
            else
            {
                let defaults = UserDefaults.standard
                
                if let unArchivedObject = defaults.object(forKey: "currentUser") as? NSData
                {
                    _currentUser = NSKeyedUnarchiver.unarchiveObject(with: unArchivedObject as Data) as? User
                    return _currentUser
                }
                
                return nil
            }
            
        }
        set
        {
            _currentUser = newValue
            let defaults = UserDefaults.standard
            
            if let user = newValue
            {
                let archivedObject = NSKeyedArchiver.archivedData(withRootObject: user)
                defaults.set(archivedObject, forKey: "currentUser")
                
            }
            else
            {
                defaults.removeObject(forKey: "currentUser")
            }
            
            
        }
    }
    
    
}



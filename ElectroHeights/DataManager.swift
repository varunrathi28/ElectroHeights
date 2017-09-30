//
//  DataManager.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 30/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
   static  func getDataDicForLeftMenu()->[String:[String]]
    {
        let dataDic = ["0":["Home",
                            "My Account",
                            "My Orders",
                            "Shopping Cart",
                            "Wish List"],
                       "1":["Settings",
                            "App Suggestions",
                            "Help and Support",
                            "Cotact Us"]]
        
        return dataDic
        
    }
    
   static func getImageNameDicForLeftMenu()->[String:[String]]
    {
        let imageDic = ["0":["menu_0opt0",
                             "menu_0opt1",
                             "menu_0opt2",
                             "menu_0opt3",
                             "menu_0opt4"],
                        "1":["menu_1opt0",
                             "menu_1opt1",
                             "menu_1opt2",
                             "menu_1opt3"]]
        
        return imageDic
    }

}

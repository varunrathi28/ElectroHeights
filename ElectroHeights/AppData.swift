//
//  AppData.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 21/11/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class AppData: NSObject {

    private var user:User?
    static func isLoggedIn()->Bool
    {
        let userDefaults = UserDefaults.standard
        if let session = userDefaults.value(forKey: ConstUrl.LoggedIn)
        {
            return true
        }
        return false
    }
    
    func clearData()
    {
        let userDefaults = UserDefaults.standard
        
        
    }
}

//
//  Banner.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 06/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SwiftyJSON

class Banner
{
    var BannerId:Int!
    var BannerUrl:String!
    var ImageLocation:String!
    
    init(fromJSON: JSON) {
        
        self.BannerId = fromJSON["BannerId"].intValue
        self.BannerUrl = fromJSON["BannerUrl"].stringValue
        self.ImageLocation = fromJSON["ImageLocation"].stringValue
    }
   
    
}

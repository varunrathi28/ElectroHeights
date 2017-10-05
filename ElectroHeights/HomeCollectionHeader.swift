//
//  HomeCollectionHeader.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 05/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class HomeCollectionHeader: UICollectionReusableView {

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var btnViewAll:UIButton!
    
    var section:Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.white
        btnViewAll.layer.cornerRadius = 5.0
        btnViewAll.layer.masksToBounds = true
        btnViewAll.titleLabel?.textColor = UIColor.white
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

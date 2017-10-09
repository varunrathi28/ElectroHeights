//
//  MyProfileImageHeader.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 09/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class MyProfileImageHeader: UIView {

    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var ivBackground:UIImageView!
    @IBOutlet weak var ivProfile:UIImageView!
    @IBOutlet weak var btnAddImage:UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivProfile.layer.cornerRadius = ivProfile.bounds.size.height/2
        ivProfile.clipsToBounds = true
        
        btnAddImage.setImage(UIImage(named: ""), for: .normal)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

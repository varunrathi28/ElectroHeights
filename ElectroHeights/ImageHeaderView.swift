//
//  ImageHeaderView.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 30/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ImageHeaderView: UIView {
    
    @IBOutlet weak var ivBackground:UIImageView!
    @IBOutlet weak var ivForeground:UIImageView!
    @IBOutlet weak var lblTitle:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblTitle.textColor = UIColor.white
        ivForeground.layer.cornerRadius = ivForeground.frame.size.height/2
        ivForeground.layer.masksToBounds = true
        ivBackground.image = UIImage(named: "wallpaper")
        ivForeground.image = UIImage(named: "acc_img1")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

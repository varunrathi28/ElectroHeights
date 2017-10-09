//
//  MyProfileEditingCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 09/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class MyProfileEditingCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var tfEntry:SkyFloatingLabelTextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

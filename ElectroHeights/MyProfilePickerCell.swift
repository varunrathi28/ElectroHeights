//
//  MyProfilePickerCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 09/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class MyProfilePickerCell: UITableViewCell {

    
    // Picker
    @IBOutlet weak var ivCountry:UIImageView!
    @IBOutlet weak var lblCountryCode:UILabel!
    @IBOutlet weak var lblPhCode:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

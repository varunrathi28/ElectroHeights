//
//  MyProfileRadioCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 09/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class MyProfileRadioCell: UITableViewCell {

    @IBOutlet  var btnCollection:[CheckBox]!
    @IBOutlet weak var lblTitle:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func radioButtonClicked(sender:CheckBox)
    {
        for btn in btnCollection
        {
          btn.isChecked = false
        }
        sender.isChecked = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

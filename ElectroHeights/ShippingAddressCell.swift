//
//  ShippingAddressCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 11/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ShippingAddressCell: UITableViewCell {
    
    @IBOutlet weak var lblAddName:UILabel!
    @IBOutlet weak var lblAddStreet:UILabel!
    @IBOutlet weak var lblAddCity:UILabel!
      @IBOutlet weak var lblAddPin:UILabel!
      @IBOutlet weak var lblAddState:UILabel!
      @IBOutlet weak var lblPhone:UILabel!
      @IBOutlet weak var lblActiveText:UILabel!
      @IBOutlet weak var btnSelected:UIButton!
      @IBOutlet weak var segmentedControl:UISegmentedControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

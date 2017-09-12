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
        
      
        lblActiveText.isHidden = true
        setDummyText()
        btnSelected.setImage(UIImage(named: "checkbox_checked"), for: .selected)
        btnSelected.setImage(UIImage(named: "checkbox_unchecked"), for: .normal)
        
        segmentedControl.tintColor = UIColor.lightGray
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDummyText()
    {
        lblAddName.text = "Address"
        lblAddPin.text = "Pin Code"
        lblPhone.text = "+(101)58844"
        lblAddState.text = "State"
        lblAddCity.text = "City"
        lblAddStreet.text = "Street Info"
    }
    
    @IBAction func checkBoxToggled(sener:AnyObject)
    {
        btnSelected.isSelected = !btnSelected.isSelected
    }
    

    @IBAction func onOffSwitched(_ sender: UISegmentedControl?) {
        
        if segmentedControl.selectedSegmentIndex == 1
        {
            segmentedControl.isHidden = true
            lblActiveText.isHidden = false
        }
        else
        {
            lblActiveText.isHidden = true
        }
        
    }
}

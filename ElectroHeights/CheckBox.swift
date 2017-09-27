//
//  CheckBox.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 27/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
class CheckBox: UIButton {
        // Images
        let checkedImage = UIImage(named: "checkbox_checked")! as UIImage
        let uncheckedImage = UIImage(named: "checkbox_unchecked")! as UIImage
        
        // Bool property
        var isChecked: Bool = false {
            didSet{
                if isChecked == true {
                    self.setImage(checkedImage, for: UIControlState.normal)
                } else {
                    self.setImage(uncheckedImage, for: UIControlState.normal)
                }
            }
        }
        
        override func awakeFromNib() {
            self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
            self.isChecked = false
        }
        
        func buttonClicked(sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
        }
}


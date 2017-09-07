//
//  WishListTableCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 07/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class WishListTableCell: UITableViewCell {

    @IBOutlet weak var ivProduct:UIImageView!
    @IBOutlet weak var lblProductName:UILabel!
    @IBOutlet weak var lblProductPrice:UILabel!
    @IBOutlet weak var btnDelete:UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivProduct.image = UIImage(named: "Product")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

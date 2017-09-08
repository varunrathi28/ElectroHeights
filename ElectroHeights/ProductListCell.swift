//
//  ProductListCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 08/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ProductListCell: UITableViewCell {
    
    @IBOutlet weak var ivProduct:UIImageView!
    @IBOutlet weak var lblProductName:UILabel!
    @IBOutlet weak var lblCodeTitle:UILabel!
    @IBOutlet weak var lblCodeDetail:UILabel!
    @IBOutlet weak var lblPriceTitle:UILabel!
    @IBOutlet weak var lblPriceNewDetail:UILabel!
    @IBOutlet weak var lblPriceOldDetail:UILabel!
    @IBOutlet weak var lblQtyTitle:UILabel!
    @IBOutlet weak var lblPieceText:UILabel!
    @IBOutlet weak var tfQuantity:UITextField!
    @IBOutlet weak var btnAddToCard:UIButton!
    @IBOutlet weak var viewQuantityContainer:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

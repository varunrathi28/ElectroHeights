//
//  ProductListCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 08/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

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
    @IBOutlet weak var tfQuantity:SkyFloatingLabelTextField!
    @IBOutlet weak var btnAddToCard:UIButton!
    @IBOutlet weak var viewQuantityContainer:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnAddToCard.setTitle("Add to Cart", for: .normal)
        btnAddToCard.layer.masksToBounds = true
        btnAddToCard.layer.cornerRadius = 5.0
        viewQuantityContainer.layer.borderWidth = 1.0
        viewQuantityContainer.layer.borderColor = UIColor.lightGray.cgColor
        // Initialization code
    }
    
    
    func updateData(with product:FeaturedProduct)
    {
        lblCodeDetail.text = product.ProductCode
        if let subTitle = product.ProductSubTitle
        {
            lblProductName.text = subTitle
        }

        if let imageUrl = product.ImageLocation
        {
            ivProduct.kf.setImage(with: URL(string:imageUrl))
        }
        
        if let quantity = product.OrderQty
        {
            // tfQuantity.text = String(quantity)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

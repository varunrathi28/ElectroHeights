//
//  WishListTableCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 07/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

protocol WishListDelegate {
    
    func deleteClickedWith(index:Int)
}
class WishListTableCell: UITableViewCell {

    @IBOutlet weak var ivProduct:UIImageView!
    @IBOutlet weak var lblProductName:UILabel!
    @IBOutlet weak var lblProductPrice:UILabel!
    @IBOutlet weak var btnDelete:UIButton!
    
    var index:Int!
    var delegate:WishListDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivProduct.image = UIImage(named: "new")
        // Initialization code
    }

    func updateCell(with product:WishListProduct)
    {
        if let imageUrl = product.ImageLocation
        {
            ivProduct.kf.setImage(with: URL(string: imageUrl))
        }
        
        lblProductName.text = product.ProductSubTitle
        lblProductPrice.text = "Discounted Price : " + String(format: "%.2f", product.DiscountMRP)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnDeleteClicked(sender:UIButton)
    {
        delegate?.deleteClickedWith(index: index)
    }

}

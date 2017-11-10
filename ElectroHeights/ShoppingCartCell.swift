//
//  ShoppingCartCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 08/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit


class ShoppingCartCell: UITableViewCell {

    @IBOutlet weak var btnRemove:UIButton!
    
    // Section 1
    @IBOutlet weak var lblProductName:UILabel!
    @IBOutlet weak var lblCodeTitle:UILabel!
    @IBOutlet weak var lblCodeDetail:UILabel!
    @IBOutlet weak var lblPriceTitle:UILabel!
    @IBOutlet weak var lblPriceDetail:UILabel!
    @IBOutlet weak var lblQuantityTitle:UILabel!
    @IBOutlet weak var lblQuantityDetail:UILabel!
    @IBOutlet weak var ivProduct:UIImageView!
    
    var index:Int!
    var delegate:ShopCartCellDelegate?
    
    
    // Section 2
    
    @IBOutlet weak var viewAccordian:UIView!
    
    // Section 3
    
    @IBOutlet weak var lblQuantityTotal:UILabel!
    @IBOutlet weak var lblTotalPrice:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: <#T##Selector?#>)
        ivProduct.addGestureRecognizer(<#T##gestureRecognizer: UIGestureRecognizer##UIGestureRecognizer#>)
        
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productIconClicked(sender:AnyObject)
    {
        delegate?.productIconClicked(index: self.index)
    }
    
    func btnRemoveClicked(sender:UIButton)
    {
        delegate?.btnRemoveClicked(index: self.index)
        
    }

}

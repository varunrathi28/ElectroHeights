//
//  ProductCollectionCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 25/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var lblProductName:UILabel!
    @IBOutlet weak var lblProductDetail:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUp()
    }
    
    
    func updateData(with product:FeaturedProduct)
    {
        if let productname = product.ProductSubTitle
        {
            lblProductName.text = productname
        }
        
        if let mrp = product.DiscountMRP , let price = product.ProductMRP
        {
            
            var priceAttrStr:NSMutableAttributedString = NSMutableAttributedString()
            
            if mrp != price
            {
                
                let mrpStr = String(format: "%.1f",mrp)
                let priceStr = String(format: "%.1f", price)
                let  str1 =  "Rs " + mrpStr + "   " + priceStr
               
                priceAttrStr = Utility.getAttributedStringWithStrikeThrough(for: str1, with: priceStr)
            }
            else
            {
                let mrpStr = String(format: "%.1f",mrp)
                let  str1 =  "Rs " + mrpStr
                priceAttrStr = Utility.getAttributedStringWithStrikeThrough(for: str1, with: "")
            }
            
            
            lblProductDetail.attributedText = priceAttrStr
        }
        
        if let url = product.ImageLocation
        {
            imageView.kf.setImage(with: URL(string: url))
        }
        
    }
    
    func setUp()
    {
        let red = Double(arc4random_uniform(255))
        let blue = Double(arc4random_uniform(255))
        let green = Double(arc4random_uniform(255))
        
        let color = UIColor(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: 1.0)
        contentView.backgroundColor = color
        
    }
    
}

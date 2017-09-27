//
//  ProductCollectionCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 25/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ProductCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var lblProductName:UILabel!
    @IBOutlet weak var lblProductDetail:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUp()
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

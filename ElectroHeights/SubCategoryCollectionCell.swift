//
//  SubCategoryCollectionCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 13/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import Kingfisher

class SubCategoryCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var lblSubCategoryTitle:UILabel!
    @IBOutlet weak var ivSubcategory:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.backgroundColor = UIColor.white
        
    }
    
    
    func updateSubCategory(with subcategory:SubCategory)
    {
        lblSubCategoryTitle.text = subcategory.SubCategoryName
        ivSubcategory.kf.setImage(with: URL(string: subcategory.ImageLocation))
    }
    

    
}

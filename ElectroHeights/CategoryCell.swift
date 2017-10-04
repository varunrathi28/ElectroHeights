//
//  CategoryCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 12/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var ivCategory:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ivCategory.image = UIImage(named:"electro_heights")
        // Initialization code
    }
    
    func updateCategory(with category:Category)
    {
        lblTitle.text = category.CategoryName
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

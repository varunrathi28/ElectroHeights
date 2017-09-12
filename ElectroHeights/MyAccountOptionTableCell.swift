//
//  MyAccountOptionTableCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 07/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class MyAccountOptionTableCell: UITableViewCell {

    @IBOutlet weak var ivOption:UIImageView!
    @IBOutlet weak var lblOptionName:UILabel!
    
    var indexPath:NSIndexPath!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //ivOption.image = UIImage(named: "MyAccOpt2")
        // Initialization code
    }
    
    func updateData(data:CellData)
    {
        ivOption.image = UIImage(named: data.imageName)
        lblOptionName.text = data.text

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

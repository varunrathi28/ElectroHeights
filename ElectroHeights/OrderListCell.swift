//
//  OrderListCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 12/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class OrderListCell: UITableViewCell {

    @IBOutlet weak var ivProduct:UIImageView!
    @IBOutlet weak var lblOrderNo:UILabel!
    @IBOutlet weak var lblOrderDetail:UILabel!
    @IBOutlet weak var lblStatus:UILabel!
    @IBOutlet weak var lblStatusDetail:UILabel!
    @IBOutlet weak var lblTimestamp:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblTimestamp.textColor = UIColor.lightGray
        lblTimestamp.text = "2017-09-12  17:51"
        
        lblStatusDetail.text = "Pending"
        lblTimestamp.textColor = UIColor.lightGray
        
        // Initialization code
    }
    
    func updateData(data:CellData)
    {
        lblOrderDetail.text = data.text
        ivProduct.image = UIImage(named: data.imageName)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

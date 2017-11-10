//
//  MenTableViewCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 16/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class MenTableViewCell: UITableViewCell {

    var lblTitle:UILabel = UILabel()
    var ivIcon:UIImageView = UIImageView()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        ivIcon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lblTitle)
        contentView.addSubview(ivIcon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func addConstraints()
    {
        ivIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ivIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        ivIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ivIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        lblTitle.leftAnchor.constraint(equalTo: ivIcon.rightAnchor, constant: 20).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        lblTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override func layoutSubviews() {
        
        
        
    }
}

//
//  Protocols.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 10/11/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit


// for ShoppingCartCell
protocol ShopCartCellDelegate {
    
    func productIconClicked(index:Int)
    func btnRemoveClicked(index:Int)
}

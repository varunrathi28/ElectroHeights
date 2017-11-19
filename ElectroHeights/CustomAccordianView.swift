//
//  CustomAccordianView.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 08/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

struct AccordianHeading {
    
    var heading1:String!
    var heading2:String!
    var heading3:String!
    var heading4:String!
}

struct AccordianDetail
{
    var detail1:String?
    var detail2:String?
    var detail3:String?
    var detail4:String?
    
}

struct AccordianData
{
    
}

class CustomAccordianDetailView:UIView
{
    //DETAIL
    
    @IBOutlet weak var detailView:UIView!
    
    @IBOutlet weak var lblDetail1:UILabel!
    @IBOutlet weak var lblDetail2:UILabel!
    @IBOutlet weak var lblDetail3:UILabel!
    @IBOutlet weak var lblDetail4:UILabel!
    @IBOutlet weak var lblDetail5:UILabel!
    
}

class CustomAccordianHeadView: UIView {
    
    // HEADING
    
    @IBOutlet weak var headingView:UIView!
    @IBOutlet weak var lblHeading1:UILabel!
    @IBOutlet weak var lblHeading2:UILabel!
     @IBOutlet weak var lblHeading3:UILabel!
     @IBOutlet weak var lblHeading4:UILabel!
     @IBOutlet weak var lblHeading5:UILabel!
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

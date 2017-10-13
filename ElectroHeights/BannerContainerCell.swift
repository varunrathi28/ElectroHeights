//
//  BannerContainerCell.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 12/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import Kingfisher


protocol DockOptionViewDelegate {

    func dockClicked(index:Int)
}
class BannerContainerCell: UICollectionViewCell {
    
    
    var delegate:DockOptionViewDelegate?
    
    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var containerView:UIView!
    @IBOutlet weak var btnOption1:UIButton!
    @IBOutlet weak var btnOption2:UIButton!
    @IBOutlet weak var btnOption3:UIButton!
    @IBOutlet weak var btnOptionViewAll:UIButton!
    
    override func awakeFromNib() {
         super.awakeFromNib()
        
        btnOption1.setImage(UIImage(named: "dock_img1"), for: .normal)
        btnOption1.tag = 1
        btnOption2.setImage(UIImage(named: "dock_img2"), for: .normal)
        btnOption2.tag = 2
        btnOption3.setImage(UIImage(named: "dock_img3"), for: .normal)
        btnOption3.tag = 3
        btnOptionViewAll.setImage(UIImage(named: "dock_img4"), for: .normal)
        btnOptionViewAll.tag = 4
       
    }
    
    
    func updateDataWithBanners(banners:[Banner])
    {
        var offset:CGFloat = 0
        let width = scrollView.frame.size.width
        let height = scrollView.frame.size.height
        for bannerObj in banners
        {
            let imageView:UIImageView = UIImageView(frame: CGRect(x: offset, y: 0, width: width, height: height))
            
            let url = bannerObj.ImageLocation
            imageView.kf.setImage(with: URL(string: url!))
                
            offset += width
            scrollView.addSubview(imageView)
            var contentSize = scrollView.contentSize
            contentSize.width += width
            scrollView.contentSize = contentSize
            
        }
        
        scrollView.contentSize = CGSize(width:CGFloat(banners.count) * width, height: height)
        
    }
    
    @IBAction func dockBtnClicked(sender:UIButton)
    {
        
        switch sender.tag {
        case 1:
            delegate?.dockClicked(index: 1)
            
        case 2:
            delegate?.dockClicked(index: 2)
            
        case 3:
            delegate?.dockClicked(index: 3)
            
        default:
            delegate?.dockClicked(index: 4)
        }
    }
}

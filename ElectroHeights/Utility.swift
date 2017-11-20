//
//  Utility.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 13/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit


public class Utility:NSObject
{
    
    static let sharedInstance:Utility =
    {
        let util = Utility()
        return util
    }()
    
    static let NumberCharacterSet = "0123456789"
    static let screenSize  = UIScreen.main.bounds
    static let screenWidth =  UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    
    static func getAlert()
    {
        
        
    }
    
    static func getKeyboardToolbar()->UIToolbar
    {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = AppTheme.kNavigationBarColor
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        return toolBar
    }
    
    static func getStringForRequestBodyWithPararmeters(dict:[String:AnyObject])->String
    {
        var string:String = ""
        
       if dict.values.count > 0
        {
            for (key , value) in dict
            {
                string = string + key + "=" + (value as! String) + "&"
            }
            
            string = string.substring(to: string.index(before: string.endIndex))
        }

        return string
    }
    
    
    static func getUrlForEndPoint(endPoint:String)->String
    {
        return URLConstant.kBaseURL + endPoint
    }
    
    static func reloadTableViewOnMainThread(with tableview:UITableView)
    {
        DispatchQueue.main.async {
            tableview.reloadData()
        }
    }
    
  //  var indicator:NVActivityIndicatorView = ProgressHUDManager.sharedInstance
    
    // MARK: - Main Story board helpers
    
    static func getViewControllerFromStoryBoard(of type:StoryboardType, with ID:String) -> AnyObject
    {
        var storyboard:UIStoryboard
        switch type {
        case .Main:
            storyboard = getMainStoryBoard()
 
        case .Product:
            storyboard = getProductStoryboard()
            
        default:
            storyboard = getOtherStoryboard()
        }
        
        let vc = storyboard.instantiateViewController(withIdentifier: ID)
        return vc
    }
    
    
    static func getViewControllerFromMainStoryBoard(with ID:String)->AnyObject
    {
        let storyboard = getMainStoryBoard()
        let vc = storyboard.instantiateViewController(withIdentifier: ID)
        return vc
    }
    
    static func getMainStoryBoard()->UIStoryboard
    {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyBoard
    }
    
    // MARK: - Product StoryBoard helpers
    
    static func getViewControllerFromProductStoryBoard(with ID:String)->AnyObject
    {
        let storyboard = getProductStoryboard()
        let vc = storyboard.instantiateViewController(withIdentifier: ID)
        return vc
    }
    
    static func getProductStoryboard()-> UIStoryboard
    {
        let storyBoard = UIStoryboard.init(name: "Product", bundle: nil)
        return storyBoard
    }
    
    
    static func getOtherStoryboard()->UIStoryboard
    {
        let storyBoard = UIStoryboard.init(name: "Other", bundle: nil)
        return storyBoard
    }
    
    
    func checkStatusResponse(status:String)
    {
        
        
        
    }
    
    class func getAttributedStringWithStrikeThrough(for text:String ,with strikeText:String)->NSMutableAttributedString
    {
        var attrString = NSMutableAttributedString(string: text)
        
         let strikeThroughRange  = (text as NSString).range(of: strikeText)
        
        // Strike Stype
        attrString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: strikeThroughRange)
        
        // Strike Color
        attrString.addAttribute(NSStrikethroughColorAttributeName, value: AppTheme.kStrikeThroughLineColor, range:strikeThroughRange)
        
        // Srtike Text Color
        
         attrString.addAttribute(NSForegroundColorAttributeName, value:AppTheme.kStrikeThroughTextColor, range:strikeThroughRange)
        
        return attrString
    }
    
    
//    func startIndicator()
//    {
//        if !indicator.isAnimating
//        {
//            indicator.startAnimating()
//        }
//    }
//    
//    func stopIndicator()
//    {
//        if indicator.isAnimating
//        {
//            indicator.stopAnimating()
//        }
//    }
    
}

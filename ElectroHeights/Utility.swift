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
    
  //  var indicator:NVActivityIndicatorView = ProgressHUDManager.sharedInstance
    
    // MARK: - Main Story board helpers
    
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
    
    func checkStatusResponse(status:String)
    {
        
        
        
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

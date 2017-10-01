//
//  OnBoardingVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 01/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SwiftyOnboard

class OnBoardingVC: UIViewController {
    
    var onBoardView:SwiftyOnboard!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        onBoardView = SwiftyOnboard(frame: view.frame)
        onBoardView.shouldSwipe = true
        onBoardView.fadePages = true
        view.addSubview(onBoardView)
        onBoardView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension OnBoardingVC:SwiftyOnboardDataSource
{
    
    func swiftyOnboardNumberOfPages(_ swiftyOnboard: SwiftyOnboard) -> Int {
        return 5
    }
    
    func swiftyOnboardPageForIndex(_ swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
        let page = SwiftyOnboardPage()
        return page
    }
}

extension OnBoardingVC:SwiftyOnboardDelegate
{
    
}

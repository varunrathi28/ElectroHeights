//
//  ExSlideMenuController.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 30/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ExSlideMenuController: SlideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func isTagetViewController() -> Bool {
        if let vc = UIApplication.topViewController() {
            if vc is HomeCollectionViewController
//                ||
//                vc is SwiftViewController ||
//                vc is JavaViewController ||
//                vc is GoViewController
            {
                return true
            }
        }
        return false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

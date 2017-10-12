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
    
    var titleArray:[String] = ["Home Screen", "Just For You Screen", "Product Detail Screen", "Shopping Cart","My Order"]
    
    var subTitleArray:[String] = ["This screen shows all new Arrivals/Featured Products etc",
                                    "This screen shows the various offers avaiable to you",
                                    "This screen shows the detailed description of the product",
                                    "This screen shows the list of products added to your shopping cart",
                                    "This screen shows the list of all ordered products"]
    
    let arrImages:[UIImage]! = [
                              UIImage(named: "swipe_home")!,
                              UIImage(named: "swipe_jst_4u")!,
                              UIImage(named: "swipe_product_details")!,
                              UIImage(named: "swipe_cart")!,
                              UIImage(named: "swipe_order")!
                            ]
    
    var gradiant: CAGradientLayer = {
        //Gradiant for the background view
        let blue = UIColor(red: 69/255, green: 127/255, blue: 202/255, alpha: 1.0).cgColor
        let purple = UIColor(red: 166/255, green: 172/255, blue: 236/255, alpha: 1.0).cgColor
        let gradiant = CAGradientLayer()
        gradiant.colors = [purple, blue]
        gradiant.startPoint = CGPoint(x: 0.5, y: 0.18)
        return gradiant
    }()


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         UIApplication.shared.statusBarStyle = .lightContent
        
       
        onBoardView = SwiftyOnboard(frame: view.frame, style: .light)
        onBoardView.shouldSwipe = true
        onBoardView.fadePages = true
        onBoardView.backgroundColor = UIColor.black
        view.addSubview(onBoardView)
        onBoardView.delegate = self
        onBoardView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func gradient() {
        //Add the gradiant to the view:
        self.gradiant.frame = view.bounds
        view.layer.addSublayer(gradiant)
    }
    
    
    func handleContinue(sender: UIButton) {
        let index = sender.tag
        onBoardView.goToPage(index: index + 1, animated: true)
    }

    
    func handleSkip(sender:UIButton)
    {
        let vc = Utility.getViewControllerFromMainStoryBoard(with:StoryBoardID.LoginController) as! LoginVC
        present(vc, animated: true, completion: nil)
    }
    

}

extension OnBoardingVC:SwiftyOnboardDataSource
{
    
    func swiftyOnboardNumberOfPages(_ swiftyOnboard: SwiftyOnboard) -> Int {
        return titleArray.count
    }
    
    func swiftyOnboardPageForIndex(_ swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
        let view = SwiftyOnboardPage()
        
       
        //Set the image on the page:
        view.imageView.image = arrImages[index]
        
        //Set the font and color for the labels:
        view.title.font = UIFont.boldSystemFont(ofSize: 22)
        view.subTitle.font = UIFont.boldSystemFont(ofSize: 16)
        
        //Set the text in the page:
        view.title.text = titleArray[index]
        view.subTitle.text = subTitleArray[index]
        
        //Return the page for the given index:
        return view
    }
}

extension OnBoardingVC:SwiftyOnboardDelegate
{
    
    func swiftyOnboardViewForOverlay(_ swiftyOnboard: SwiftyOnboard) -> SwiftyOnboardOverlay? {
        let overlay = SwiftyOnboardOverlay()
        
        overlay.skipButton.addTarget(self, action: #selector(handleSkip(sender:)), for: .touchUpInside)
        overlay.skipButton.tintColor = UIColor.white
        //Setup targets for the buttons on the overlay view:
        overlay.continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
        
        //Setup for the overlay buttons:
        overlay.continueButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 16)
        overlay.continueButton.setTitleColor(UIColor.white, for: .normal)
        overlay.continueButton.tintColor = UIColor.white

  
        //Return the overlay view:
        return overlay
    }
    
    func swiftyOnboardOverlayForPosition(_ swiftyOnboard: SwiftyOnboard, overlay: SwiftyOnboardOverlay, for position: Double) {
        let currentPage = round(position)
        overlay.continueButton.tag = Int(position)
        
        if currentPage == 0.0 || currentPage == 1.0 {
            overlay.continueButton.setTitle("Next", for: .normal)
            overlay.skipButton.setTitle("Skip", for: .normal)
            overlay.skipButton.isHidden = false
        } else {
           overlay.continueButton.setTitle("Done", for: .normal)
            overlay.skipButton.isHidden = true
        }
    }

    
}

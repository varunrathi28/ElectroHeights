//
//  HomeCollectionViewController.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 12/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class HomeCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var viewSegmentedButtons:UIView!
    @IBOutlet weak var scrollView:UIScrollView!
    var CustomerID:String = "5253"
    
    var arrNewProducts:[FeaturedProduct] = []
    var arrFeaturedProducts:[FeaturedProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

         callWebServiceToFetchProducts(type: .FeaturedProduct)
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func callWebServiceToFetchProducts(type:ProductType)
    {
        let url = getUrlForProductType(type: type)
        let apiManager = RestApiManager.sharedInstance
        var bodyDic = [String:String]()
        bodyDic["CustomerID"] = CustomerID
        let bodyStr:String = Utility.getStringForRequestBodyWithPararmeters(dict: bodyDic as [String : AnyObject])
        apiManager.post(urlString: url, parameters: bodyStr) { (json, error, status) in
            if status == true
            {
                if let productArray = json.array
                {
                    switch type
                    {
                    case .FeaturedProduct:
                
                        
                        self.arrFeaturedProducts = productArray.map{
                        
                            return FeaturedProduct.build(json: $0)!
                        }
                        
                        DispatchQueue.main.async {
                              self.collectionView.reloadData()
                        }
                    
                        break
                        
                    case .NewProducts:
                        for (obj) in productArray
                        {
                        
                            
                        }
                        break
                    default:
                        break
                        
                        
                    }
                    
                    
                    
                }
                
            }
            else
            {
                
            }
        }
        
        
        
    }
    
    func getUrlForProductType(type:ProductType)->String
    {
        
        var urlStr = URLConstant.kBaseURL
        
        switch type {
        case .FeaturedProduct:
                urlStr = urlStr + URLEndPoints.kFetchFeaturedProducts
            break
            
        case .NewProducts:
            urlStr = urlStr + URLEndPoints.kFetchNewProducts
            break
            
        case .SubCategory:
             urlStr = urlStr + URLEndPoints.kFetchShopByCategory
            break
        default:
            break
        }
        
        return urlStr
    }

}

extension HomeCollectionViewController:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.SubProductCell, for: indexPath) as! ProductCollectionCell
        
        let product = arrFeaturedProducts[indexPath.row]
        cell.updateData(with: product)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return arrFeaturedProducts.count
    }
    
}

extension HomeCollectionViewController: UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        
        let cellWidth = (width - 3 * 5)/2
        
        return CGSize(width: cellWidth, height: 300.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

extension HomeCollectionViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}


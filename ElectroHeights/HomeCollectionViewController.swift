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
    
    var arrNewArrivals:[FeaturedProduct] = []
    var arrFeaturedProducts:[FeaturedProduct] = []
    var arrAllCategories:[Category] = []
    var arrHeaderText:[String] = [" ", HomeHeaderText.Header1,HomeHeaderText.Header2,HomeHeaderText.Header3,HomeHeaderText.Header4]
    var arrBanners:[Banner] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        let flowLayout:UICollectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 10, 5)
        callWebServicesToFetchData()
        
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
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
       
    }
    
    //MARK: - Actions
    
    @IBAction func openAllCategoriesClicked(sender:AnyObject)
    {
        let vc = Utility.getViewControllerFromProductStoryBoard(with: StoryBoardID.CategoryListController) as! CategoryListVC
        vc.arrDataSource = self.arrAllCategories
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btnViewAllClicked(sender:AnyObject? = nil)
    {
        let btn = sender as! UIButton
        switch btn.tag {
        case 0:
            break
            
        case 1:
            break
            
        case 2:
            openAllCategoriesClicked(sender:self.arrAllCategories as AnyObject)
            break
        default:
            break
        }
        
    }
    
    
    //MARK:- Network Requests
    
    func callWebServicesToFetchData()
    {
        callWebServiceToFetchProducts(type: .Banners)
        callWebServiceToFetchProducts(type: .FeaturedProduct)
        callWebServiceToFetchProducts(type: .NewProducts)
        callWebServiceToFetchAllCategories()
    
    }
    
    func callWebServiceToFetchAllCategories()
    {
        let apiManager = RestApiManager.sharedInstance
        
        apiManager.post(urlString: URLConstant.kBaseURL + URLEndPoints.kFetchProductCategories, parameters: nil) { (json, error,status ) in
        
            if status == true
            {
                if let categoryArray = json.array
                {
                    self.arrAllCategories = categoryArray.map({ (json) -> Category in
                        
                        return Category(with: json)
                    })
                }
                
            }
            else
            {
                
            }
        }
        
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
                       
                        self.arrNewArrivals = productArray.map{
                        
                        return FeaturedProduct.build(json: $0)!
                        }
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                        
                        break
                        
                    case .Banners:
                        
                        self.arrBanners = productArray.map({ (json) -> Banner in
                            
                            return Banner.init(fromJSON: json)
                        })
                        
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
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
            
            
        case .Banners:
            urlStr = urlStr + URLEndPoints.kFetchBanners
            
        default:
            break
        }
        
        return urlStr
    }

}

extension HomeCollectionViewController:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrHeaderText.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.HomeBannerCell, for: indexPath) as! BannerContainerCell
            
            
            cell.delegate = self
            if arrBanners.count > 0
            {
                cell.updateDataWithBanners(banners: arrBanners)
            }
            
            return cell
        }
        else
        
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.SubProductCell, for: indexPath) as! ProductCollectionCell
            
            if indexPath.section == 1
            {
                let newProduct = arrNewArrivals[indexPath.row]
                cell.updateData(with: newProduct)
            }
            else
            {
                let product = arrFeaturedProducts[indexPath.row]
                cell.updateData(with: product)
            }
            
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0
        {
            return 1
        }
            
        else if section == 1
        {
               return min(arrNewArrivals.count, arrHeaderText.count)
        }
        else
        {
               return min(arrFeaturedProducts.count, arrHeaderText.count)
        }
        
     //  return arrFeaturedProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reUsableView:UICollectionReusableView = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader
        {
            let headerView:HomeCollectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! HomeCollectionHeader
            
                headerView.btnViewAll.tag = 100 + indexPath.section
                headerView.section = indexPath.section
                headerView.btnViewAll.addTarget(self, action: #selector(btnViewAllClicked(sender:)), for: .touchUpInside)
                headerView.lblTitle.text = arrHeaderText[indexPath.section]
                headerView.btnViewAll.setTitle("View All", for: .normal)
                return headerView
            
        }
        
        if kind == UICollectionElementKindSectionFooter
        {
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "FooterView", for: indexPath)
                return view
            
        }
        
        return reUsableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == arrHeaderText.count - 1
        {
            return CGSize(width: collectionView.frame.size.width, height: 200)
        }
        else
        {
            return  CGSize(width: 0, height: 0  )
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0
        {
            return CGSize(width: 0, height: 0)
            
        }
        else
        {
            return CGSize(width: collectionView.frame.size.width, height: 60)
        }
    }
    
}


extension HomeCollectionViewController:UICollectionViewDelegate
{
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        openAllCategoriesClicked(sender:self.arrAllCategories as AnyObject)
    }
}

extension HomeCollectionViewController: UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0
        {
            let width = collectionView.frame.size.width
            let height:CGFloat = 290
            
            return CGSize(width: width, height: height)
            
        }
        else
        {
            
            let width = collectionView.frame.size.width
            
            let cellWidth = (width - 3 * 5)/2
            
            return CGSize(width: cellWidth, height: 300.0)
        }
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

extension HomeCollectionViewController:DockOptionViewDelegate
{
    func dockClicked(index:Int)
    {
        switch index {
        case 4:
             self.openAllCategoriesClicked(sender:self.arrAllCategories as AnyObject)
            
        default:
            break
        }
        
    }
}


//
//  HomeCollectionViewController.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 12/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import Segmentio

struct HomeCollectionLayout {
  static let  kMaxProductInSection = 4
  static let kMaxCategoryInSection = 8
}

class HomeCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var offerCollectionView:UICollectionView!
   
    @IBOutlet weak var containerView:UIView!
    @IBOutlet weak var searchBar:UISearchBar!
    @IBOutlet weak var contraintCollectionEnd:NSLayoutConstraint!
    @IBOutlet weak var contraintCollectionStart:NSLayoutConstraint!
    
  
    
  @IBOutlet weak var segmentView:Segmentio!
    var CustomerID:String = "5253"
    
    var arrNewArrivals:[FeaturedProduct] = []
    var arrFeaturedProducts:[FeaturedProduct] = []
    var arrAllCategories:[Category] = []
    var arrShopByCategory:[SubCategory] = []
    var arrRecentView:[FeaturedProduct] = []
    var arrHeaderText:[String] = [" ", HomeHeaderText.Header1,HomeHeaderText.Header2,HomeHeaderText.Header3,HomeHeaderText.Header4]
    var arrBanners:[Banner] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        let flowLayout:UICollectionViewFlowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 10, 5)
        collectionView.alwaysBounceVertical = false
        self.collectionView.register(UINib(nibName: "SubCategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.CategoryCollectionCellId)
        // Do any additional setup after loading the view.
    }

    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    //   setUpSegmentedView()
    }
    func setUpSegmentedView()
    {
        var content = [SegmentioItem]()
        
        let optionNew = SegmentioItem(title: "What's New", image: nil)
        let optionJustForYou = SegmentioItem(title: "JUST FOR YOU", image: nil)
        content = [optionNew,optionJustForYou]
       
       segmentView.setup(content: content, style: SegmentioStyle.onlyLabel, options: nil)
        segmentView.selectedSegmentioIndex = 0
        segmentView.valueDidChange = { segmentio, segmentIndex in
            print("Selected item: ", segmentIndex)
            
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
        callWebServicesToFetchData()
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
     //   setUpSegmentedView()
       
    }
    
    //MARK: - Actions
    
    @IBAction func openAllCategoriesClicked(sender:AnyObject)
    {
        let vc = Utility.getViewControllerFromProductStoryBoard(with: StoryBoardID.CategoryListController) as! CategoryListVC
        vc.arrDataSource = self.arrAllCategories
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func openProductListForType(type : AllProductTypes)
    {
        let vc = Utility.getViewControllerFromStoryBoard(of: .Product, with: StoryBoardID.AllProductListVC) as! ProductListVC
        vc.productType = type
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @IBAction func btnViewAllClicked(sender:AnyObject? = nil)
    {
        let btn = sender as! UIButton
        switch btn.tag {
        case 1:
            openProductListForType(type: .NewProduct)
        
        case 2:
            openProductListForType(type: .FeaturedProduct)
            
        case 3:
            openAllCategoriesClicked(sender:self.arrAllCategories as AnyObject)
            
        default:
            openProductListForType(type: .RecentViewed)
            break
        }
        
    }
    
    
    //MARK:- Network Requests
    
    func callWebServicesToFetchData()
    {
        callWebServiceToFetchProducts(type: .Banners)
        callWebServiceToFetchProducts(type: .FeaturedProduct)
        callWebServiceToFetchProducts(type: .NewProducts)
        callWebServiceToFetchProducts(type: .SubCategory)
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
                    case .Banners: // Section 0
                        self.arrBanners = productArray.map({ (json) -> Banner in
                            
                            return Banner.init(fromJSON: json)
                        })
                    
                    case .NewProducts: // section 1
                        self.arrNewArrivals = productArray.map{
                            
                            return FeaturedProduct.build(json: $0)!
                        }
                    case .FeaturedProduct: // Section 2
                        self.arrFeaturedProducts = productArray.map{
                        
                            return FeaturedProduct.build(json: $0)!
                        }
                        
         
                        
                    case .SubCategory: // Section 3
                        self.arrShopByCategory = productArray.map({ (json) -> SubCategory in
                            
                            return SubCategory.init(with: json)
                            
                        })
                        
                    default:
                        break
                        
                        
                    }
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
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

    
    @IBAction func btnSwitchCollectionView(sender:UIButton)
    {
        let tag = sender.tag
        
        if tag == 1
        {
            animateCollectionViewSwitch(on:false)
            
        }
        else
        {
            animateCollectionViewSwitch(on: true)
        }
        
    }
    
    func animateCollectionViewSwitch(on: Bool)
    {
        
        // On: True -> Animation to Left
        let offSet:CGFloat = on ? -collectionView.bounds.width : 0
        
        collectionView.layoutIfNeeded()
        offerCollectionView.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5) {
            
            self.contraintCollectionEnd.constant = offSet
            self.contraintCollectionStart.constant = offSet

            
        }
    }
    
    
}

extension HomeCollectionViewController:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrHeaderText.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.HomeBannerCell, for: indexPath) as! BannerContainerCell
            
            
            cell.delegate = self
            if arrBanners.count > 0
            {
                cell.updateDataWithBanners(banners: arrBanners)
            }
            
            return cell
            
        case 3:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.CategoryCollectionCellId, for: indexPath) as! SubCategoryCollectionCell
            
                let subCategory = arrShopByCategory[indexPath.row]
                cell.updateSubCategory(with: subCategory)
                return cell
        
        default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.SubProductCell, for: indexPath) as! ProductCollectionCell
                
                if indexPath.section == 1
                {
                    let newProduct = arrNewArrivals[indexPath.row]
                    cell.updateData(with: newProduct)
                }
                else if indexPath.section == 2
                {
                    let product = arrFeaturedProducts[indexPath.row]
                    cell.updateData(with: product)
                }
                    
                else
                {
                    let recentProduct = arrRecentView[indexPath.row]
                    cell.updateData(with: recentProduct)
                }
                
                return cell
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
            
        case 1:
             return min(arrNewArrivals.count, HomeCollectionLayout.kMaxProductInSection)
        case 2:
            return min(arrFeaturedProducts.count, HomeCollectionLayout.kMaxProductInSection)
            
        case 3:
           return min(arrShopByCategory.count, HomeCollectionLayout.kMaxCategoryInSection)
            
        default:
            return min(arrRecentView.count, HomeCollectionLayout.kMaxProductInSection)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reUsableView:UICollectionReusableView = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader
        {
            let headerView:HomeCollectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! HomeCollectionHeader
            
                headerView.btnViewAll.tag = indexPath.section
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
            
        else if indexPath.section == 3
        {
             let width = collectionView.frame.size.width
            let cellWidth = (width - 3 * 5)/2
            return CGSize(width: cellWidth, height: cellWidth * 0.8)
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


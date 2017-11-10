//
//  WishListVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 07/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class WishListVC: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    // MARK:- View Controller Life Cycle
    
    let CustomerID = "5253"
    var arrWishListItems:[WishListProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        setupViews()
        self.setNavigationBarItem()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callWebServiceToFetchWishList()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    

    
  func  setupViews()
    {
        
        setupNavBar()
        tableView.backgroundColor = UIColor.clear
        view.backgroundColor = AppTheme.kBackgroundColorLightGray
    
    }
    
    func setupNavBar()
    {
        navigationItem.title = StringConstants.WishListTitle
        navigationController?.navigationBar.barTintColor = AppTheme.kNavigationBarColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
      
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "shopping_cart"), style: .plain, target: self, action: #selector(btnCartPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_icon"), style: .plain, target: self, action: #selector(btnCartPressed))
        
        navigationController?.navigationBar.isTranslucent = false
    }

    
   @IBAction func btnCartPressed()
    {
        
    }
    
    
    func callWebServiceToFetchWishList()
    {
        let apiManager = RestApiManager.sharedInstance
        let url = Utility.getUrlForEndPoint(endPoint: URLEndPoints.kFetchWishlistProducts)
        var dic = [String:AnyObject]()
        dic["CustomerID"] = CustomerID as AnyObject 
        let params = Utility.getStringForRequestBodyWithPararmeters(dict: dic)
        apiManager.post(urlString: url, parameters: params) { (json, error, status) in
            if status == true
            {
                
               if  let array = json.array
                {
                    
                    self.arrWishListItems = array.map({ (json) -> WishListProduct in
                        
                        return WishListProduct(with: json)
                    })
                    
                    DispatchQueue.main.async {
                          self.tableView.reloadData()
                    }
                }
                
            }
            else
            {
                
            }
        }
        
        
    }
    
    
    func callWebServiceToDeleteProduct(at index:Int)
    {
        
        let apiManager = RestApiManager.sharedInstance
        
        let url = Utility.getUrlForEndPoint(endPoint: URLEndPoints.kDeleteWishlistProduct)
        var dic = [String:AnyObject]()
        let productToDelete = arrWishListItems[index]
        dic["CustomerID"] = CustomerID as AnyObject
        
        var parameters = Utility.getStringForRequestBodyWithPararmeters(dict: dic)
        
        parameters  = parameters + "&ProductVariationID=" +  String(productToDelete.ProductVariationID)
        apiManager.post(urlString: url, parameters: parameters) { (json, error, status) in
            
            if status == true
            {
                let responseCode = json.intValue
                
                if responseCode > 0
                {
                    self.tableView.beginUpdates()
                    let indexPath = IndexPath(row: index, section: 0)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                    self.tableView.endUpdates()
                }
            }
            else
            {
                
            }
        }
    }
  

}

extension WishListVC:UITableViewDataSource
{
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier:CellIdentifiers.WishCellId) as! WishListTableCell
        let wishProduct = arrWishListItems[indexPath.row]
        cell.updateCell(with: wishProduct)
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrWishListItems.count
    }
    
    
}

extension WishListVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            self.arrWishListItems .remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
}

extension WishListVC : WishListDelegate
{
    func deleteClickedWith(index: Int) {
        
        self.callWebServiceToDeleteProduct(at: index)
    }
}


//
//  ShoppingCartVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 08/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ShoppingCartVC: UIViewController {

    @IBOutlet weak var tableView:UITableView!
     var arrCartProducts:[ShoppingCartProduct] = []
    //MARK:- View Controller Life cycle methods
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.register(UI, forCellReuseIdentifier: <#T##String#>)
        self.setNavigationBarItem()
        
        

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callWebServiceFetchCartProducts()
    
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callWebServiceFetchCartProducts()
    {
    
        let apiManager = RestApiManager.sharedInstance
        
        let url = Utility.getUrlForEndPoint(endPoint: URLEndPoints.kFetchCartProducts)
        var dic = [String:AnyObject]()
        dic["CustomerID"] = DataManager.CustomerID as AnyObject
        let bodyStr = Utility.getStringForRequestBodyWithPararmeters(dict: dic)
        apiManager.post(urlString: url, parameters: bodyStr) { (json, error, status) in
            
            if status == true
            {
                if let cartProductList = json.array
                {
                    self.arrCartProducts = cartProductList.map({ (json) -> ShoppingCartProduct
                        in
                        return ShoppingCartProduct(with: json)
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
    
    
    

}

extension ShoppingCartVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier:CellIdentifiers.ShoppingCartCellId, for: indexPath) as! ShoppingCartCell
        cell.selectionStyle = .none
        
        let cartProduct = arrCartProducts[indexPath.row]
        cell.updateData(with: cartProduct)
        return cell
        
    }
    
    
}

extension ShoppingCartVC : UITableViewDelegate
{
    
    
}

extension ShoppingCartVC : ShopCartCellDelegate
{
    func btnRemoveClicked(index: Int) {
        
    }
    
    func productIconClicked(index: Int) {
        
    }
    
}

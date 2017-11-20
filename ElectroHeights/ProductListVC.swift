//
//  ProductListVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 08/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ProductListVC: UIViewController {
    
    //MARK: - View Controller Life Cycle

    @IBOutlet weak var  tableView:UITableView!
    var productType:AllProductTypes!

    var arrProducts:[FeaturedProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callWebServiceForProductType()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getURLForProductType(type:AllProductTypes)->String?
    {
        var url = URLConstant.kBaseURL
        switch type {
        case .NewProduct:
            url = url + URLEndPoints.kFetchNewProducts
            
        case .FeaturedProduct:
            url = url + URLEndPoints.kFetchFeaturedProducts
        default:
            return nil
        }
        
        return url
    }
    
    func callWebServiceForProductType()
    {
        guard let url = getURLForProductType(type: self.productType) else {
            return
        }
        var dic = [String: String]()
        dic[ConstUrl.CustomerID] = DataManager.CustomerID
        let bodyStr = Utility.getStringForRequestBodyWithPararmeters(dict: dic as [String:AnyObject])
        let apiManager = RestApiManager.sharedInstance
        apiManager.post(urlString: url, parameters: bodyStr) { (json, error, status) in
            
            if status == true
            {
                if let jsonArr = json.array
                {
                    self.arrProducts = jsonArr.map({ (json) -> FeaturedProduct in
                        return FeaturedProduct.build(json: json)!
                    })
                    
                    Utility.reloadTableViewOnMainThread(with: self.tableView)
                    
                }
                
            }
        }
    }
}

extension ProductListVC : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrProducts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.ProductListCellId) as! ProductListCell
        let product = arrProducts[indexPath.section]
        cell.updateData(with: product)
        return cell
    }
}

extension ProductListVC: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}



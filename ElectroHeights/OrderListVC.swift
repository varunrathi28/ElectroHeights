//
//  OrderListVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 12/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class OrderListVC: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    var arrOrders:[CustomerOrder] = []

    var PageIndex = "1"
    var PageSize = "20"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        setUpViews()
        //setupNavBar()
        self.setNavigationBarItem()


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callWebServiceForOrderList()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //MARK: - Views Setup
    
    func setUpViews()
    {
        self.view.backgroundColor = AppTheme.kBackgroundColorLightGray
        self.tableView.backgroundColor = UIColor.clear
    }
    
    func setupNavBar()
    {
        navigationItem.title = StringConstants.OrderListTitle
        navigationController?.navigationBar.barTintColor = AppTheme.kNavigationBarColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_icon"), style: .plain, target: self, action: #selector(btnCartPressed))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "shopping_cart"), style: .plain, target: self, action: #selector(btnDrawerMenuPressed))
        
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    //MARK:- Actions
    
    func btnCartPressed()
    {
        
    }
    
    func btnDrawerMenuPressed()
    {
        
    }
    
    func callWebServiceForOrderList()
    {
        let apiManager = RestApiManager.sharedInstance
        
        let url = Utility.getUrlForEndPoint(endPoint: URLEndPoints.kFetchOrders)
        var dic = [String:AnyObject]()
        dic["CustomerID"] = DataManager.CustomerID as AnyObject
        dic["PageIndex"] = PageIndex as AnyObject
        dic["PageSize"] = PageSize as AnyObject
        let bodyStr = Utility.getStringForRequestBodyWithPararmeters(dict: dic)
        apiManager.post(urlString: url, parameters: bodyStr) { (json, error, status) in
            
            if status == true{
             
                if let orderArr = json.array {
                    
                    self.arrOrders = orderArr.map { (json) in
                        
                        return CustomerOrder.init(with: json)
                        
                    }
                    
                    DispatchQueue.main.async {
                         self.tableView.reloadData()
                    }
                   
                }
                
            }
            
            else {
                
            }
        }
    }
    
}

extension OrderListVC : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return arrOrders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.OrderCellId, for: indexPath) as! OrderListCell
        cell.updateOrder(order: arrOrders[indexPath.section])
        return cell
    }
    
}

extension OrderListVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
}


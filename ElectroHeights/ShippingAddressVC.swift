//
//  ShippingAddressVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 07/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ShippingAddressVC: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    //MARK:-  View Controller Life cycle
    
    var arrShippingAddress:[Address] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        setUpViews()
        setupNavBar()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callWebserviceFetchAddress()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpViews()
    {
        self.view.backgroundColor = AppTheme.kBackgroundColorLightGray
        self.tableView.backgroundColor = UIColor.clear
    }
    
    func setupNavBar()
    {
        navigationItem.title = StringConstants.ShippingAddressTitle
        navigationController?.navigationBar.barTintColor = AppTheme.kNavigationBarColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(btnBackPressed))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(btnDeletePressed))
        
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    func btnDeletePressed()
    {
        
        let selectedPredicate = NSPredicate(format: "isSelected == %d",1)
        let selectedArr:[Address] = (arrShippingAddress as NSArray).filtered(using: selectedPredicate) as! [Address]
        
        if selectedArr.count > 0
        {
            for obj in selectedArr
            {
                if  let index:Int = self.arrShippingAddress.index(of: obj)
                {
                    
                    self.arrShippingAddress.remove(at: index)
                }
            }
            
        }
    }
    
    func btnBackPressed()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    func callWebserviceFetchAddress()
    {
        var dic = [String:String]()
        dic[ConstUrl.CustomerID] = DataManager.CustomerID
        
        let bodyStr = Utility.getStringForRequestBodyWithPararmeters(dict: dic as! [String:AnyObject])
        let url = Utility.getUrlForEndPoint(endPoint: URLEndPoints.kFetchAddresses)
        callWebServiceWithTask(for: .Fetch,url: url, bodyStr: bodyStr)
    }

    func callWebServiceDeleteAddress(with AddressID:String)
    {
        
    }
    
    func setDefaultAddress(with AddressID:String)
    {
        
    }
    
    func callWebServiceWithTask(for type: AddressRequestType,url:String, bodyStr:String,at row:Int? = 0)
    {
        let apiManager = RestApiManager()
        apiManager.post(urlString: url, parameters: bodyStr) { (json, error, status) in
            
            if status == true
            {
                switch type
                {
                case .Fetch:
                    
                    if let addressArr  = json.array
                    {
                        self.arrShippingAddress = addressArr.map({ (json) -> Address in
                            return Address(with: json)
                        })
                        
                         Utility.reloadTableViewOnMainThread(with: self.tableView)
                    }
                    
                    
                case .Delete:
                   
                    if let status = json.int
                    {
                        print("Success: %d",status)
                        self.arrShippingAddress.remove(at: row!)
                        Utility.reloadTableViewOnMainThread(with: self.tableView)
                    }
                    
                case .Update:
                    if let status = json.int
                    {
                        print("Success")
                        let address = self.arrShippingAddress[row!]
                        address.IsDefault = true
                        Utility.reloadTableViewOnMainThread(with: self.tableView)
                        
                    }
                    
                case .Add:
                     print("Success")
                }
                
                
            }
            
        }
        
        
    }

}

extension ShippingAddressVC:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return arrShippingAddress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.ShippingCellId, for: indexPath) as! ShippingAddressCell
        cell.selectionStyle = .none
        
        let address:Address = arrShippingAddress[indexPath.section]
        cell.updateData(with: address)
        return cell
        
    }
    
}

extension ShippingAddressVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    
    
}



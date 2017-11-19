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
        
    }
    
    func btnBackPressed()
    {
        
    }
    
    func callWebserviceFetchAddress()
    {
        
    }

    func callWebServiceDeleteAddress(with AddressID:String)
    {
        
    }
    
    func setDefaultAddress(with AddressID:String)
    {
        
    }
    
    func callWebServiceWithTask(for type: AddressRequestType, bodyStr:String)
    {
        let apiManager = RestApiManager()
        let url = ""
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
                        print("Success")
                        
                    }
                    
                case .Update:
                    if let status = json.int
                    {
                        print("Success")
                        
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
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.ShippingCellId, for: indexPath)
        cell.selectionStyle = .none
        
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



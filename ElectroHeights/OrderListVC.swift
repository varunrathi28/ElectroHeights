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
    var arrDataSource:[CellData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        setUpViews()
        //setupNavBar()
        setUpDataSource()
        
        self.setNavigationBarItem()


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
    
    
    func setUpDataSource()
    {
        arrDataSource = []
        
        let opt1 = CellData(text: "122131321")
        let opt2 = CellData(text: "2313212332")
        let opt3 = CellData(text: "33333")
        
        arrDataSource.append(opt1)
        arrDataSource.append(opt2)
        arrDataSource.append(opt3)
  
    }
    
    //MARK:- Actions
    
    func btnCartPressed()
    {
        
    }
    
    func btnDrawerMenuPressed()
    {
        
    }
    
}

extension OrderListVC : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return arrDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.OrderCellId, for: indexPath) as! OrderListCell
        
        cell.updateData(data: arrDataSource[indexPath.section])
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


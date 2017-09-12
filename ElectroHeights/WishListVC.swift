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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        setupViews()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "shopping_cart"), style: .done, target: self, action: #selector(btnCartPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_icon"), style: .done, target: self, action: #selector(btnCartPressed))
        
        navigationController?.navigationBar.isTranslucent = false
    }

    
   @IBAction func btnCartPressed()
    {
        
    }
  

}

extension WishListVC:UITableViewDataSource
{
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier:CellIdentifiers.WishCellId) as! WishListTableCell
        return cell
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
}

extension WishListVC:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
}


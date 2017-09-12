//
//  CategoryListVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 12/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class CategoryListVC: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    var arrDataSource:[CellData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        
        setUpViews()
        setupNavBar()
        setUpDataSource()
        
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
        navigationItem.title = StringConstants.CategotiesListTitle
        navigationController?.navigationBar.barTintColor = AppTheme.kNavigationBarColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(btnBackPressed))
       
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    func setUpDataSource()
    {
        arrDataSource = []
        
        let opt1 = CellData(text: "Electrical")
        let opt2 = CellData(text: "Electronics")
        let opt3 = CellData(text: "Hardware")
        let opt4 = CellData(text: "Electronics")
        let opt5 = CellData(text: "Switchgear")

        arrDataSource.append(opt1)
        arrDataSource.append(opt2)
        arrDataSource.append(opt3)
        arrDataSource.append(opt4)
        arrDataSource.append(opt5)
        
    }
    
    
    
    @IBAction func btnBackPressed(sender:AnyObject)
    {
        
    }
    

}

extension CategoryListVC : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
     
        return arrDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.CategoryCellId, for: indexPath) as! CategoryCell
        
        cell.updateData(data: arrDataSource[indexPath.section])
        return cell
    }
    
}

extension CategoryListVC:UITableViewDelegate
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

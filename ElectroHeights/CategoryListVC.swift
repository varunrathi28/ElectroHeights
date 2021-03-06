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
    
    var arrDataSource:[Category] = []
    
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
        tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fetchAllSubCategories(forCategory: Category)
    {
        let ApiManager = RestApiManager.sharedInstance
        let url = Utility.getUrlForEndPoint(endPoint: URLEndPoints.kFetchProductSubCategories)
        
        let parameterStr = "ProductCategoryID=" + String(forCategory.ProductCategoryID)
        ApiManager.post(urlString: url, parameters: parameterStr) { (json, error, status) in
            
            if status == true
            {
               if  let subCategories = json.array
               {
                    let subCatList = subCategories.map({ (json) -> SubCategory in
                        return SubCategory(with:json)
                    })
                
                    let vc = Utility.getViewControllerFromProductStoryBoard(with: StoryBoardID.SubCategoryList) as! SubCategoryCollectionViewController
                    vc.arrSubCategoryList = subCatList
                
                DispatchQueue.main.async {
                      self.navigationController?.pushViewController(vc, animated: true)
                    }
                
                
                
                }
                
                
            }
            else
            {
                
            }
        }
        
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
    
    @IBAction func btnBackPressed(sender:AnyObject)
    {
        self.navigationController?.popViewController(animated: true)
        
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
        
        let category = arrDataSource[indexPath.section]
        cell.updateCategory(with: category)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = arrDataSource[indexPath.section]
        fetchAllSubCategories(forCategory: category)
        
        
    }
    
}

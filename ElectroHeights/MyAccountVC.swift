//
//  MyAccountVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 07/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class MyAccountVC: UIViewController {
    
    @IBOutlet weak var ivProfileImage:UIImageView!
    @IBOutlet weak var topContainerView:UIView!
    @IBOutlet weak var lblUserName:UILabel!
    @IBOutlet weak var tableView:UITableView!
    
    var arrDatasource:[CellData] = []

    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        setUpDataSource()
        setUpDataSource()
        setUpViews()
        
        
        setDummyText()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    func setDummyText()
    {
        lblUserName.text = "User"
        ivProfileImage.image = UIImage(named: "new")
    }
    
    func setUpDataSource()
    {
        arrDatasource = []

        let opt1 = CellData(text: MyAccountOptionStrings.MyAccOpt1, imageName: "acc_img1")
        let opt2 = CellData(text: MyAccountOptionStrings.MyAccOpt2, imageName: "acc_img2")
        let opt3 = CellData(text: MyAccountOptionStrings.MyAccOpt3, imageName: "acc_img3")
        let opt4 = CellData(text: MyAccountOptionStrings.MyAccOpt4, imageName: "acc_img4")
        arrDatasource.append(opt1)
         arrDatasource.append(opt2)
         arrDatasource.append(opt3)
         arrDatasource.append(opt4)
        
    }
    
    func setUpViews()
    {
        ivProfileImage.layer.masksToBounds = true
        ivProfileImage.layer.cornerRadius = ivProfileImage.frame.size.height/2
        
        tableView.tableFooterView = UIView()
        
        topContainerView.backgroundColor = AppTheme.kNavigationBarColor
        
        setupNavBar()
    }
    
    func setupNavBar()
    {
        navigationItem.title = StringConstants.MyAccountTitle
        navigationController?.navigationBar.barTintColor = AppTheme.kNavigationBarColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "shopping_cart"), style: .plain, target: self, action: #selector(buttonLogoutPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_icon"), style: .plain, target: self, action: #selector(buttonLogoutPressed))
        
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    func buttonLogoutPressed()
    {
        
    }

}

extension MyAccountVC:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MyAccountCellId) as! MyAccountOptionTableCell
        cell.updateData(data: arrDatasource[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDatasource.count
    }
    
}


extension MyAccountVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}

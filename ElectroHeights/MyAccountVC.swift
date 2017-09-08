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
    
    var arrDatasource:[String] = []
    
    let footerButton:UIButton = {
    
        
        
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.titleLabel?.text = "Logout"
        button.titleLabel?.textColor = UIColor.white
        button.addTarget(self, action: #selector(buttonLogoutPressed), for: .touchUpInside)
        
        return button
    
    }()

    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
    
        setUpDataSource()
        setUpViews()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    func setUpDataSource()
    {
        arrDatasource = []
        arrDatasource.append(MyAccountOptionStrings.MyAccOpt1)
        arrDatasource.append(MyAccountOptionStrings.MyAccOpt2)
        arrDatasource.append(MyAccountOptionStrings.MyAccOpt3)
        arrDatasource.append(MyAccountOptionStrings.MyAccOpt4)
    }
    
    func setUpViews()
    {
        ivProfileImage.layer.masksToBounds = true
        ivProfileImage.layer.cornerRadius = ivProfileImage.frame.size.height/2
        
        tableView.tableFooterView = footerButton
    }
    
    
    func buttonLogoutPressed()
    {
        
    }

}

extension MyAccountVC:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MyAccountCellId) as! MyAccountOptionTableCell
        let optionText = arrDatasource[indexPath.row]
        cell.lblOptionName.text = optionText
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

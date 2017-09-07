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
    
    var arrDatasource:[String]

    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDataSource()
        
        

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
    

}

extension MyAccountVC:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MyAccountCellIdentifer) as! MyAccountOptionTableCell
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

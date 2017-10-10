//
//  MyProfileViewController.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 09/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    
    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        self.automaticallyAdjustsScrollViewInsets = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


extension MyProfileViewController : UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        switch indexPath.row {
        case 2:
           let cell = tableView.dequeueReusableCell(withIdentifier:CellIdentifiers.MyProfileRadioCell, for: indexPath) as! MyProfileRadioCell
           
            return cell

        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MyProfilePickerCell, for: indexPath) as! MyProfilePickerCell
            return cell
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MyProfileEditCell, for: indexPath) as! MyProfileEditingCell
            return cell
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
}

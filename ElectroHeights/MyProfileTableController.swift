//
//  MyProfileTableController.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 10/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit




class MyProfileTableController: UITableViewController {
    
    let staticHeaderHeight:CGFloat = 161
    @IBOutlet weak var myProfileStretchyHeader:MyProfileImageHeader!
    @IBOutlet weak var headerHeightConstraint:NSLayoutConstraint!
    
    var arrMenuOptions:[MyProfileMenu] = [.name, .email, .whatsAppNo, .gender , .state , .city, .pincode, .address, .tinNo, .customerServiceTaxNo]
    var dataDic:[MyProfileMenu:String] = DataManager.getDataDicForMyProfile()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrMenuOptions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let title = self.dataDic[MyProfileMenu(rawValue: indexPath.row)!]
        switch indexPath.row {
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier:CellIdentifiers.MyProfileRadioCell, for: indexPath) as! MyProfileRadioCell

            cell.lblTitle.text = title
            return cell
            
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MyProfilePickerCell, for: indexPath) as! MyProfilePickerCell
        
            cell.lblTitle.text = title
            
            return cell
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.MyProfileEditCell, for: indexPath) as! MyProfileEditingCell

            cell.lblTitle.text = title
            return cell
            
        }

    }
    
    /*
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0
        {
            return self.headerHeightConstraint.constant
        }
        else
        {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0
        {
            return myProfileStretchyHeader
            
        }
        else
        {
            let view = UIView()
            return view
        }
    }
    */
    
    

    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if self.headerHeightConstraint.constant > staticHeaderHeight
        {
             animateHeader()
        }
       
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if self.headerHeightConstraint.constant > staticHeaderHeight
        {
            animateHeader()
        }

    }
 
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        if scrollView.contentOffset.y < 0
        {
            self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
            
        }
        else if scrollView.contentOffset.y > 0  && self.headerHeightConstraint.constant > 64
        {
            self.headerHeightConstraint.constant -= scrollView.contentOffset.y/100
            
        if self.headerHeightConstraint.constant < 65
        {
            self.headerHeightConstraint.constant = 65
        }
        }
    }
    
    
    func animateHeader()
    {
        self.headerHeightConstraint.constant = staticHeaderHeight
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MyProfileTableController:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


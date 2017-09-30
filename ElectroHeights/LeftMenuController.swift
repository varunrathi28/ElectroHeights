//
//  LeftMenuController.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 30/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class LeftMenuController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
     var mainViewController: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false

        // Do any additional setup after loading the view.
    }
    

}

extension LeftMenuController:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
       let dataDic = DataManager.getDataDicForLeftMenu() as [String:[String]]
        return dataDic.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        let dataDic = DataManager.getDataDicForLeftMenu() as [String:[String]]
        let arr = dataDic["\(section)"]
        return (arr?.count)!
        
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as UITableViewCell
        
        let dataDic = DataManager.getDataDicForLeftMenu()
        let imageDic = DataManager.getImageNameDicForLeftMenu()
        let arr = dataDic["\(indexPath.section)"]
        let imgArr = imageDic["\(indexPath.section)"]
        
        tableCell.textLabel?.text = arr?[indexPath.row]
        tableCell.imageView?.image = UIImage(named: (imgArr?[indexPath.row])!)
        return tableCell
    }
    

}

extension LeftMenuController : UITableViewDelegate
{
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return section == 0 ? 0.0 : 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0
        {
            let view = UIView()
            
            return view
        }
        else
        {
            let view = UIView()
            view.backgroundColor = UIColor.lightGray
            return view
        }
    }
    
}

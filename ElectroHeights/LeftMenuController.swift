//
//  LeftMenuController.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 30/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit


enum LeftMenu: Int {
    case home = 0
    case account
    case orders
    case shoppingCart
    case wish
    case settings
    case suggestions
    case help
    case contact
}

class LeftMenuController: UIViewController {
    
        @IBOutlet weak var tableView:UITableView!
        var mainViewController: UIViewController!
        var  accountsVC:UIViewController!
        var myOrdersVc:UIViewController!
        var shoppingCartVC:UIViewController!
        var wishListVC:UIViewController!


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        
        setUpMenuViewControllers()

        // Do any additional setup after loading the view.
    }
    
    
    
    func setUpMenuViewControllers()
    {
        
        let orderVC = Utility.getViewControllerFromProductStoryBoard(with: StoryBoardID.OrdersListController) as! OrderListVC
        
        let accountsVC = Utility.getViewControllerFromProductStoryBoard(with: StoryBoardID.MyAccountsController) as! MyAccountVC
        
        let shoppingCartVC = Utility.getViewControllerFromProductStoryBoard(with: StoryBoardID.ShoppingCartController) as! ShoppingCartVC
        
        let wishVC = Utility.getViewControllerFromProductStoryBoard(with: StoryBoardID.WishListController) as! WishListVC
        
        self.myOrdersVc = UINavigationController(rootViewController: orderVC)
        self.accountsVC =  UINavigationController(rootViewController: accountsVC)
        self.shoppingCartVC = UINavigationController(rootViewController: shoppingCartVC)
        self.wishListVC = UINavigationController(rootViewController: wishVC)
        
    }
    
    func changeViewController(_ menu: LeftMenu) {
        
        switch menu {
        case .home:
           self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)

            
        case .account:
             self.slideMenuController()?.changeMainViewController(self.accountsVC, close: true)
            
        case .orders:
             self.slideMenuController()?.changeMainViewController(self.myOrdersVc, close: true)
        
        case .shoppingCart:
             self.slideMenuController()?.changeMainViewController(self.shoppingCartVC, close: true)
            
        case .wish:
             self.slideMenuController()?.changeMainViewController(self.wishListVC, close: true)
            
        default:
             self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        }
        
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
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let menu = LeftMenu(rawValue: indexPath.row)
        {
            self.changeViewController(menu)
            
        }
        
        
    }
   
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

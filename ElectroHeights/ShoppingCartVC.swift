//
//  ShoppingCartVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 08/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ShoppingCartVC: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    //MARK:- View Controller Life cycle methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.register(UI, forCellReuseIdentifier: <#T##String#>)
        
        
        

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ShoppingCartVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopCell", for: indexPath) as! ShoppingCartCell
        
        return cell
        
    }
    
    
}

extension ShoppingCartVC : UITableViewDelegate
{
    
    
}

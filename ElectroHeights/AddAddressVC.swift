//
//  AddAddressVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 20/11/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import CountryPicker

class AddAddressVC: UIViewController {

    @IBOutlet weak var lblHeading:UILabel!
    @IBOutlet weak var tfName:SkyFloatingLabelTextField!
    @IBOutlet weak var tfStreet:SkyFloatingLabelTextField!
    @IBOutlet weak var btnShowState:UIButton!
    @IBOutlet weak var btnShowCity:UIButton!
    @IBOutlet weak var tfPinCode:SkyFloatingLabelTextField!
    @IBOutlet weak var tfPhone:SkyFloatingLabelTextField!
    
    // Picker
    @IBOutlet weak var ivCountry:UIImageView!
    @IBOutlet weak var lblCountryCode:UILabel!
    @IBOutlet weak var lblPhCode:UILabel!
    @IBOutlet weak var viewPicker:UIView!
    @IBOutlet weak var viewCountryPicker:UIView!
    @IBOutlet weak var countryPicker:CountryPicker!
    @IBOutlet weak var picker:UIPickerView!
    var phoneCd:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnSaveClicked(sender:UIButton)
    {
        guard let city = btnShowCity.title(for: .normal),
            let state = btnShowState.title(for: .normal),
            let mob = tfPhone.text,
            let name = tfName.text,
            let pin = tfPinCode.text,
            let street = tfStreet.text
        else
        {
            return
        }
        
        var addressDic = [String:String]()
        addressDic["StateName"] = state
        addressDic["Pincode"] = pin
        addressDic["Name"] = name
        addressDic["PhoneNo"] = mob
        addressDic["CityName"] = city
        addressDic["StreetAddress"] = street
         addressDic["CustomerID"] = DataManager.CustomerID
      
        
        callWebServiceToAddAddress(with: addressDic)
        
    }
    
    func callWebServiceToAddAddress(with dic:[String:String])
    {
        let apiManager = RestApiManager.sharedInstance
        
        let url = Utility.getUrlForEndPoint(endPoint: URLEndPoints.kAddNewAddress)
        var bodyStr = Utility.getStringForRequestBodyWithPararmeters(dict: dic as [String:AnyObject])
        apiManager.post(urlString: url, parameters: bodyStr) { (json, error, status) in
            
            if status == true{
            
                if let status = json.int
                {
                    if status > 0
                    {
                        print("Success")
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                
            }
            
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension AddAddressVC:CountryPickerDelegate
{
    
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        
        lblCountryCode.text = countryCode
        lblPhCode.text = phoneCode
        ivCountry.image = flag
        phoneCd = phoneCode
    }
    
    
}

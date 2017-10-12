//
//  SignUpVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 13/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import CountryPicker
import SkyFloatingLabelTextField

class SignUpVC: UIViewController {
    
    //Picker
    @IBOutlet weak var ivCountry:UIImageView!
    @IBOutlet weak var lblCountryCode:UILabel!
    @IBOutlet weak var lblPhCode:UILabel!
    @IBOutlet weak var viewPicker:UIView!
    @IBOutlet weak var picker:CountryPicker!
    
    
     var phoneCd:String?
    // Screen
    @IBOutlet weak var ivLogo:UIImageView!
    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var tfName: SkyFloatingLabelTextField!
    @IBOutlet weak var tfMobNo: SkyFloatingLabelTextField!
    @IBOutlet weak var tfPassword: SkyFloatingLabelTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfMobNo.keyboardType = .numberPad
        setUpPicker()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        picker.countryPickerDelegate = self
        hidePicker()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        picker.countryPickerDelegate = nil
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpPicker()
    {
        let locale = Locale.current
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?
        
        picker.showPhoneNumbers = true
        picker.setCountry(code!)
    }
    
    func showPicker()
    {
        let pickerHeight = viewPicker.frame.size.height
        
        let screenHeight = view.frame.size.height
        
        let offset = screenHeight - pickerHeight
        
        UIView.animate(withDuration: 0.2) {
            
            self.viewPicker.frame = CGRect(x: 0, y: offset, width: self.viewPicker.frame.size.width, height: self.viewPicker.frame.size.height)
        }
        
    }
    
    func hidePicker()
    {
        UIView.animate(withDuration: 0.2) {
            
            self.viewPicker.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.viewPicker.frame.size.width, height: self.viewPicker.frame.size.height)
        }
    }
    
    func hidePickerWithoutAnimation()
    {
        UIView.animate(withDuration: 0.0) {
            
            self.viewPicker.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.viewPicker.frame.size.width, height: self.viewPicker.frame.size.height)
        }
        
    }
    
    @IBAction func pickerDoneClicked(sender:AnyObject)
    {
        hidePicker()
        
    }
    @IBAction func pickerCancelClicked(sender:AnyObject)
    {
        hidePicker()
    }
    
    
    @IBAction func showPickerClicked(sender:AnyObject)
    {
        showPicker()
        
    }
    
    @IBAction func btnSubmitClicked(sender:AnyObject)
    {
        guard let mobile = tfMobNo.text,
        let password = tfPassword.text,
        let name = tfName.text,
        var code = phoneCd
        else
        {
            return
        }
        
        code = code.replacingOccurrences(of: "+", with: "")
        var reqDic = [String:String]()
        reqDic["MobileNo"] = code + mobile
        reqDic["Password"] = password
        reqDic["Name"] = name
        reqDic["EmailAddress"] = ""
        
        callWebServiceForValidatingPhone(with: reqDic as [String : AnyObject])

    }
    
    
    
   func  callWebServiceForInserting(with details:[String:AnyObject])
    {
    let parameterStr = Utility.getStringForRequestBodyWithPararmeters(dict: details)
    let apiManager = RestApiManager()
    apiManager.post(urlString: URLConstant.kBaseURL + URLEndPoints.kInsertCustomer, parameters: parameterStr) { (json, error, status) in
    
        }
        
    }

    
    func callWebServiceForValidatingPhone(with info:[String:AnyObject])
    {
        var dic = [String:String]()
        dic["MobileNo"] = info["MobileNo"] as! String
        
        let bodyStr = Utility.getStringForRequestBodyWithPararmeters(dict: dic as [String : AnyObject])
        let apiManager = RestApiManager.sharedInstance
        apiManager.post(urlString: URLConstant.kBaseURL + URLEndPoints.kValidateMobile, parameters: bodyStr) { (json, error, status) in
            
            if status == true
            {
                let statusValue = json.boolValue
                
                if statusValue
                {
                
                    let vc = Utility.getViewControllerFromMainStoryBoard(with: StoryBoardID.OTPVerification) as! OTPVerficationVC
                    vc.userInfoDic = info
                    
                    DispatchQueue.main.async {
                        self.present(vc, animated: true, completion: nil)
                    }
                }
                else
                {
                    // Phone already exists/ Invalid
                }

                
            }
            else
            {
                
            }
            
        }
        
    }
    

}

extension SignUpVC:CountryPickerDelegate
{
    
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        
        lblCountryCode.text = countryCode
        lblPhCode.text = phoneCode
        ivCountry.image = flag
        phoneCd = phoneCode
    }
}

extension SignUpVC:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        hidePicker()
        return true
    }
}

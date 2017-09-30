//
//  PasswordResetVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 13/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import CountryPicker
import SkyFloatingLabelTextField

class PasswordResetVC: UIViewController {

    @IBOutlet weak var ivCountry:UIImageView!
    @IBOutlet weak var lblCountryCode:UILabel!
    @IBOutlet weak var lblPhCode:UILabel!
    @IBOutlet weak var viewPicker:UIView!
    @IBOutlet weak var picker:CountryPicker!
    
    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var lblInfo :UILabel!
    
    @IBOutlet weak var bntGoToLogin:UIButton!
    @IBOutlet weak var tfMobile:SkyFloatingLabelTextField!
    @IBOutlet weak var btnPickerAction:UIButton!
    
    @IBOutlet weak var ivLogo:UIImageView!
    
    var phoneCd:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPicker()
        hidePickerWithoutAnimation()
     
        
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
    
    @IBAction func showPicker(sender:AnyObject)
    {
        self.view.endEditing(true)
        showPicker()
        
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
        self.view.endEditing(true)
        showPicker()
        
    }
    
    @IBAction func submitButtonClicked(sender:AnyObject)
    {
        
        guard let mobile = tfMobile.text ,
        var code = phoneCd
        else
        {
            return
        }
        
        closeKeyBoard()
        
        code = code.replacingOccurrences(of: "+", with: "")
        let apiManager = RestApiManager()
        var reqDic = [String:String]()
        reqDic["MobileNo"] = code + mobile
        
        let bodyStr = Utility.getStringForRequestBodyWithPararmeters(dict: reqDic as [String:AnyObject])
        
        apiManager.post(urlString: URLConstant.kBaseURL + URLEndPoints.kForgotPasswordEndPoint, parameters: bodyStr) { (data, error, status) in
            
            if status == true
            {
                
            }
            else
            {
                
            }
        }
        
        
    }
    
    func closeKeyBoard()
    {
        self.view.endEditing(true)
        hidePicker()
    }

}

extension PasswordResetVC:CountryPickerDelegate
{
    
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        
        lblCountryCode.text = countryCode
        lblPhCode.text = phoneCode
        ivCountry.image = flag
        phoneCd = phoneCode
    }
}

extension PasswordResetVC:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        hidePicker()
    }
}

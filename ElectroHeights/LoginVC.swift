//
//  LoginVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 13/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import CountryPicker
import SkyFloatingLabelTextField
import SlideMenuControllerSwift



protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LoginVC: UIViewController , LeftMenuProtocol {
    func changeViewController(_ menu: LeftMenu) {
        
    }

    // Picker
    @IBOutlet weak var ivCountry:UIImageView!
    @IBOutlet weak var lblCountryCode:UILabel!
    @IBOutlet weak var lblPhCode:UILabel!
    @IBOutlet weak var viewPicker:UIView!
    @IBOutlet weak var picker:CountryPicker!
    
    var phoneCd:String?
    
    @IBOutlet weak var ivLogo: UIImageView!
    @IBOutlet weak var btnFacebookLogin:UIButton!
    @IBOutlet weak var btnGoogleLogin:UIButton!
    @IBOutlet weak var btnSubmit:UIButton!
    
    @IBOutlet weak var tfMobNo:SkyFloatingLabelTextField!
    @IBOutlet weak var tfPassword:SkyFloatingLabelTextField!
    
    @IBOutlet weak var viewPickerContainer:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        picker.countryPickerDelegate = self
        hidePickerWithoutAnimation()
        
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      //  hidePicker()
        picker.isHidden = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        picker.countryPickerDelegate = nil
          picker.isHidden = true
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
    
            self.viewPicker.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.viewPicker.frame.size.width, height: self.viewPicker.frame.size.height)
    }
    
    //MARK: - Action Handlers
    
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
        guard let number = tfMobNo.text,
        let password = tfPassword.text ,
        var code = phoneCd
        else {
            return
        }
        
        self.pushTestScreen()
        return
            
        //
        
        
        code = code.replacingOccurrences(of: "+", with: "")
        
        var bodyDic = [String:String]()
        bodyDic["MobileNo"] = code +  number
        bodyDic["Password"] = password
        bodyDic["FCMID"] = URLConstant.FCMID
        
        let bodyStr = Utility.getStringForRequestBodyWithPararmeters(dict: bodyDic as [String : AnyObject])
        let apiManager =  RestApiManager.sharedInstance
        apiManager.post(urlString: URLConstant.kBaseURL + URLEndPoints.kGetLoginEndPoint, parameters: bodyStr) { (json, error, status) in
            
            if status == true
            {
             self.openHomeCollection()
                let user = User(with: json)
                    
               if let userid = user.CustomerID
               {
                
                
                }
                
            }
            else
            {
                
            }
        }
        
    }
    
    @IBAction func btnFaceBookLoginClicked(sender:AnyObject)
    {
    
    }
    
    @IBAction func btnGoogleLoginClicked(sender:AnyObject)
    {
        
    }
    
    func pushTestScreen()
    {
        let vc = Utility.getViewControllerFromProductStoryBoard(with: StoryBoardID.MyProfileController) as! MyProfileViewController
        present(vc, animated: true, completion: nil)
    }
    
    func openHomeCollection()
    {
        
        let mainVC = Utility.getViewControllerFromProductStoryBoard(with: StoryBoardID.HomeController) as! HomeCollectionViewController
        let leftVC = Utility.getViewControllerFromProductStoryBoard(with: StoryBoardID.LeftMenuController) as! LeftMenuController
        let navVC = UINavigationController(rootViewController: mainVC)
        let slideMenu = ExSlideMenuController(mainViewController: navVC, leftMenuViewController: leftVC)
        
        leftVC.mainViewController = navVC
        slideMenu.automaticallyAdjustsScrollViewInsets = false
        slideMenu.delegate = mainVC
        
        DispatchQueue.main.async(execute: {
            // work Needs to be done
            self.present(slideMenu, animated: true, completion: nil)
        })
        
        
    }
}

extension LoginVC:CountryPickerDelegate
{
    
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        
        lblCountryCode.text = countryCode
        lblPhCode.text = phoneCode
        ivCountry.image = flag
        phoneCd = phoneCode
    }
    
    
}

extension LoginVC:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
}


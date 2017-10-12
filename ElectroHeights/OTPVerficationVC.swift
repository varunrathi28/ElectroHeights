//
//  OTPVerficationVC.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 11/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class OTPVerficationVC: UIViewController {
    
    @IBOutlet weak var lbltimer:UILabel!
    @IBOutlet weak var lblInfo:UILabel!
    @IBOutlet weak var lblCompanyName:UILabel!
    @IBOutlet weak var lblOTPText:UILabel!
    @IBOutlet weak var lblOneTime:UILabel!
    @IBOutlet weak var tfOTP:UITextField!
    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var btnCancel:UIButton!
    @IBOutlet weak var btnResend:UIButton!
    @IBOutlet weak var ivImage:UIImageView!
    
    
   // var gDataManager = CDataManager.sharedManager
    var timer:Timer = Timer()
    var counter:Int!
    let kMaxOTPTime = 120
    var currentOTP:String?
    var isOtpFetched:Bool = false
    var userInfoDic:[String:AnyObject]!
    let apiManager = RestApiManager.sharedInstance
    
    var dateCompFormatter:DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute,.second]
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        //tfOTP.keyboardType = .numberPad
       
        callWebServiceSendOtp(mobile: userInfoDic["MobileNo"]! as! String)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         setUpTimer()
       
    }
    
    func setUpUI()
    {
        lblInfo.text = StringConstants.kOtpInfo
        lblInfo.textColor = AppTheme.kTextColorLightGray
        lblOneTime.textColor = AppTheme.kTextColorDarkGray
        lblOTPText.textColor = AppTheme.kTextColorDarkGray
        lbltimer.textColor = AppTheme.kTextColorLightGray
        btnCancel.layer.cornerRadius = 5.0
        btnCancel.layer.masksToBounds = true
        btnSubmit.layer.cornerRadius = 5.0
        btnSubmit.layer.masksToBounds = true
    }
    
    // MARK: Timer functions
    
    func setUpTimer()
    {
        counter = kMaxOTPTime
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrement), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func resetTimer()
    {
        setUpTimer()
    }
    
    func stopTimer()
    {
        timer.invalidate()
        
    }
    
    func decrement()
    {
        lbltimer.text = secondsToMinutesSeconds(seconds: counter)
        counter = counter - 1;
        if counter == 0
        {
            stopTimer()
            return
        }
    }
    
    func secondsToMinutesSeconds(seconds:Int)->String
    {
        let min = (seconds % 3600) / 60
        let sec = (seconds % 3600) % 60
        return String(format: "%02d:%02d",min,sec)
    }
    
    //MARK: IBActions
    
    @IBAction func btnSubmitClicked(sender:AnyObject)
    {
        
        guard let enteredOtp = tfOTP.text, isOtpFetched == true  else {
            return
        }

        stopTimer()
        
        if enteredOtp == currentOTP
        {
            self.callWebServiceInsertCustomer()
        }
        else
        {
            
        }
    }
    
    @IBAction func btnResendOTPClicked(sender:AnyObject)
    {
        currentOTP = ""
        tfOTP.text = ""
        callWebServiceSendOtp(mobile: userInfoDic["MobileNo"]! as! String)
        stopTimer()
        setUpTimer()
    }
    
 
    
    //MARK:- WEB Service
    
    
    func callWebServiceInsertCustomer()
    {
        let parameterStr = Utility.getStringForRequestBodyWithPararmeters(dict: self.userInfoDic)
        let url = Utility.getUrlForEndPoint(endPoint: URLEndPoints.kInsertCustomer)
        apiManager.post(urlString: url, parameters: parameterStr) { (json, error, status) in
            if status == true
            {
                 let statusCode = json.intValue
                
                if statusCode > 0
                {
                    
                    self.openHomeCollection()
                    
                }
                else
                {
                    
                }
            }
            else
            {
                
            }
        }
        
    }
    
    func callWebServiceSendOtp(mobile :String)
    {
        if mobile.characters.count != 12 {
            return
        }
        
        var dic = [String:AnyObject]()
        dic["MobileNo"] = mobile as AnyObject
        let parameterStr = Utility.getStringForRequestBodyWithPararmeters(dict: dic)
        
        let urlStr = URLConstant.kBaseURL + URLEndPoints.kSendOtpEndPoint
        apiManager.post(urlString: urlStr, parameters: parameterStr) { (json, error, status) in
            
            if status == true
            {
                self.isOtpFetched = true
                self.currentOTP = json.stringValue
        
            }
            else
            {
                
            }
        }
        
        
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

extension OTPVerficationVC : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

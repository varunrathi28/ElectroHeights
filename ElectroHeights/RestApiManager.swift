//
//  RestApiManager.swift
//  ElectroHeights
//
//  Created by Varun Rathi on 13/09/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit
import SwiftyJSON

typealias ServiceResponse = (JSON, NSError?,Bool) -> Void

class RestApiManager: NSObject {
    static let sharedInstance = RestApiManager()
    
    
    func get(query:String,endPoint:String,onCompletion:@escaping ServiceResponse)
    {
        let urlStr = URLConstant.kBaseURL + endPoint + query
        
        let request = NSMutableURLRequest(url:URL(string: urlStr)!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            let json = JSON(data as? Data)
            if(error == nil)
            {
                onCompletion(json,nil,true )
            }
        }
        task.resume()
    }
    
    func post(urlString:String,parameters:[String:Any],onCompletion:@escaping ServiceResponse)
    {
        let request = NSMutableURLRequest(url: URL(string: urlString)!)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        do
        {
            let httpData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            request.httpBody = httpData
        }
            
        catch
        {
            print("Error in Parsing from Dic to data")
            
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            let json:JSON = JSON(data as Data!)
            if let httpResponse = response as? HTTPURLResponse
            {
                if httpResponse.statusCode == 200
                {
                    onCompletion(json,error as NSError?,true)
                }
                else
                {
                    onCompletion(json,error! as NSError,true)
                }
            }
            
        }
        task.resume()
    }
    
}

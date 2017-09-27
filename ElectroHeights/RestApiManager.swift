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
    
    func post(urlString:String,parameters:String,onCompletion:@escaping ServiceResponse)
    {
        
        let fullURL = URLConstant.kBaseURL + urlString
        let request = NSMutableURLRequest(url: URL(string: fullURL)!)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")  // the request is JSON
        request.setValue(URLConstant.BasicAuth, forHTTPHeaderField: "Basic")
        request.httpMethod = "POST"
        do
        {
            let httpData =  parameters.data(using: .utf8)
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

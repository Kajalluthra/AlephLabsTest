//
//  APIManager.swift
//  AlephLabsTest
//
//  Created by Kajal on 21/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

import Foundation

class APIManager {
    
    struct ApiRequest {
        static let BaseURL = "http://dev.aleph-labs.com/ios_assignment/"
    }
    
    class func shared() -> APIManager {
        return APIManager()
    }
    
    // MARK:- API Method
    func articleSearchApi(apiName: String, completed:@escaping (_ success: Bool, _ response: Any?, _ error: String?) -> Void)  {
        
        let urlString = "\(ApiRequest.BaseURL)\(apiName).json"
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            if let errorOcccurs = error {
                completed(false, nil, errorOcccurs.localizedDescription)
                return
            } else {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    if let responseDict = jsonObj?.value(forKey: "products") {
                        completed(true, responseDict, nil)
                    } else {
                        completed(false, nil, error?.localizedDescription)
                    }
                }
            }
            
        }).resume()
        
    }
    
}

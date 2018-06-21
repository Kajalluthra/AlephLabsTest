//
//  Constants.swift
//  AlephLabsTest
//
//  Created by Kajal on 21/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

import Foundation
import UIKit

public var arrayPreviousSearch = NSMutableArray()

struct Constants {
    
    static let AppName = "AlephLabsTest"
    static let ApiApple = "apple"
    static let ApiAndroid = "android"
  
}

func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        completion(data, response, error)
        }.resume()
}

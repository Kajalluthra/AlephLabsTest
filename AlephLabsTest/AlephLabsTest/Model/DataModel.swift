//
//  DataModel.swift
//  AlephLabsTest
//
//  Created by Kajal on 21/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

import Foundation
import UIKit

class ProductDataModel: NSObject {

    var title: String?
    var price: String?
    var image: URL?
    
    override init() {
        title = ""
        price = ""
        image = URL(string: "")
    }
    
    convenience init(info: AnyObject) {
        self.init()
        
        let titleStr: String? = info.value(forKey: "title") as? String
        self.title = titleStr != nil ? titleStr : ""
     
        let priceStr: String? = info.value(forKey: "price") as? String
        self.price = priceStr != nil ? priceStr : ""
    
        let imageStr: String? = info.value(forKey: "image") as? String
        if imageStr != nil{
            self.image = URL(string: imageStr!)
        }
        else{
            self.image = URL(string: "")
        }
    }

}



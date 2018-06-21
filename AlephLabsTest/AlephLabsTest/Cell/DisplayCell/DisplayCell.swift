//
//  DisplayCell.swift
//  AlephLabsTest
//
//  Created by Kajal on 21/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

import UIKit

class DisplayCell: UICollectionViewCell {

    @IBOutlet weak var labelName: UILabel?
    @IBOutlet weak var labelPrice: UILabel?
    @IBOutlet weak var imageProduct: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(currentProduct: ProductDataModel){
        
        labelName?.text = String(format: "%@", currentProduct.title!)
        labelPrice?.text = String(format: "%@", currentProduct.price!)
        downloadImage(url: currentProduct.image!)
    }
    
    func downloadImage(url: URL) {
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            
            DispatchQueue.main.async() {
                self.imageProduct?.image = UIImage(data: data)
            }
        }
    }
    

}

//
//  ViewController.swift
//  AlephLabsTest
//
//  Created by Kajal on 21/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonApple : UIButton!
    @IBOutlet weak var buttonAndroid: UIButton!
    @IBOutlet weak var redViewX : NSLayoutConstraint!
    
    let animation = Animation()
    var productArray : [ProductDataModel] = [ProductDataModel]()
    
    //    MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibMenuVenue = UINib(nibName: "DisplayCell", bundle: nil)
        collectionView.register(nibMenuVenue, forCellWithReuseIdentifier: "productcell")
        
        self .apiRequest(value: Constants.ApiApple)
    } 
    
    //    MARK:- APICall
    func apiRequest(value: String) {
        
        let apiRequest = APIManager()
        apiRequest.articleSearchApi(apiName: value) { (success, response, error) in
            
            if success {
                
                let dictResponse = response  as? NSDictionary
                let news_array = dictResponse?.value(forKey: "items") as! NSArray
                
                self.productArray = [ProductDataModel]()
                for news in news_array {
                    let dictProduct = news as! NSDictionary
                    let model = ProductDataModel(info: dictProduct)
                    self.productArray.append(model)
                }                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.animation.reload(collectionView: self.collectionView, type: Direction.Left)
                }
                
            }else {
                self.showAlertPopUp(message: error!)
            }
        }
    }
}

//    MARK:- IBAction
extension ViewController {
    
    @IBAction func ButtonClicked(_ sender: UIButton) {
        
        self.animation.reload(collectionView: self.collectionView, type: Direction.Right)
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                        self.redViewX.constant = sender == self.buttonApple ? 0:sender.frame.width
                        self.view.layoutIfNeeded()
        }, completion: { (finished) -> Void in
            
            self.apiRequest(value: sender == self.buttonApple ? Constants.ApiApple : Constants.ApiAndroid)
        })
    }
}

//    MARK:- UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productcell", for: indexPath)  as! DisplayCell
        let model = productArray[indexPath.row] as ProductDataModel
        cell.updateCell(currentProduct: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120 , height: 185)
    }
    
}

//
//  Animation.swift
//  AlephLabsTest
//
//  Created by Kajal on 21/6/18.
//  Copyright © 2018 kajal. All rights reserved.
//

import Foundation
import UIKit

enum Direction {
    case Left
    case Right
}

class Animation  {
    
   func reload(collectionView: UICollectionView, type: Direction) {
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        let cells = collectionView.visibleCells
        var index = 0
        let tableHeight: CGFloat = collectionView.bounds.size.width
        for i in cells {
            let cell: UICollectionViewCell = i as UICollectionViewCell
            
            switch type {
            case .Left:
                cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                UIView.animate(withDuration: 0.5, delay: 0.15 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0);
                }, completion: nil)
                index += 1
                break
            case .Right:
                cell.transform = CGAffineTransform(translationX: -tableHeight, y: 0)
                UIView.animate(withDuration: 0.7, delay: 0.2 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                    cell.transform = CGAffineTransform(translationX: tableHeight, y: 0);
                }, completion: nil)
                index -= cells.count
                break
            }
           
        }
    }
    
}


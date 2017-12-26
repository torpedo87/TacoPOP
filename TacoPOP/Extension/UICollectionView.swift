//
//  UICollectionView.swift
//  TacoPOP
//
//  Created by junwoo on 2017. 12. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit

extension UICollectionView {
  
  func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
    
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
      fatalError()
    }
    return cell
  }
}

extension UICollectionViewCell: ReusableView {}

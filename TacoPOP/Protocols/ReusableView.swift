//
//  ReusableView.swift
//  TacoPOP
//
//  Created by junwoo on 2017. 12. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit

protocol ReusableView: class {
  
}

extension ReusableView where Self: UIView {
  
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

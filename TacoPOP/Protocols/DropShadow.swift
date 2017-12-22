//
//  DropShadow.swift
//  TacoPOP
//
//  Created by junwoo on 2017. 12. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit

protocol DropShadow {}


//특정 타입에 익스텐션 적용할 때
extension DropShadow where Self: UIView {
  
  func addDropShadow() {
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.7
    layer.shadowOffset = CGSize.zero
    layer.shadowRadius = 5
  }
}

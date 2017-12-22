//
//  Taco.swift
//  TacoPOP
//
//  Created by junwoo on 2017. 12. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import Foundation

enum TacoShell: Int {
  case Flour = 1
  case Corn = 2
}

enum TacoProtein: String {
  case Beef
  case Chicken
  case Brisket
  case Fish
}

enum TacoCondiment: Int {
  case Loaded = 1
  case Plain = 2
}

struct Taco {
  private var _id: Int!
  private var _productName: String!
  private var _shellId: TacoShell!
  private var _proteinId: TacoProtein!
  private var _condimentId: TacoCondiment!
  
  // computed property
  var id: Int {
    return _id
  }
  
  var productName: String {
    return _productName
  }
  
  var shellId: TacoShell {
    return _shellId
  }
  
  var proteinID: TacoProtein {
    return _proteinId
  }
  
  var condimentId: TacoCondiment {
    return _condimentId
  }
  
  init(id: Int, productName: String, shellId: Int, proteinId: Int, condimentId: Int) {
    self._id = id
    self._productName = productName
    
    switch shellId {
    case 2: self._shellId = TacoShell.Corn
    default: self._shellId = TacoShell.Flour
    }
    
    switch proteinId {
    case 2: self._proteinId = TacoProtein.Chicken
    case 3: self._proteinId = TacoProtein.Brisket
    case 4: self._proteinId = TacoProtein.Fish
    default: self._proteinId = TacoProtein.Beef
    }
    
    switch condimentId {
    case 2: self._condimentId = TacoCondiment.Plain
    default: self._condimentId = TacoCondiment.Loaded
    }
    
  }
}

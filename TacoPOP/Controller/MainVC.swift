//
//  MainVC.swift
//  TacoPOP
//
//  Created by junwoo on 2017. 12. 21..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
  
  let topView: HeaderView = {
    let view = HeaderView()
    view.backgroundColor = UIColor.red
    view.addDropShadow()
    return view
  }()
  let imgView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "Taco-POP")
    view.contentMode = .scaleAspectFit
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  func setupView() {
    view.backgroundColor = UIColor.white
    view.addSubview(topView)
    topView.addSubview(imgView)
    
    topView.snp.makeConstraints { (make) in
      make.top.left.right.equalToSuperview()
      make.height.equalTo(80)
    }
    imgView.snp.makeConstraints { (make) in
      make.center.equalTo(topView)
      make.width.equalTo(150)
      make.height.equalTo(60)
    }
  }
}

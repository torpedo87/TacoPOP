//
//  TacoCell.swift
//  TacoPOP
//
//  Created by junwoo on 2017. 12. 22..
//  Copyright © 2017년 samchon. All rights reserved.
//

import UIKit

class TacoCell: UICollectionViewCell, Shakeable {
  
  let imgView: UIImageView = {
    let view = UIImageView()
    view.contentMode = .scaleAspectFit
    return view
  }()
  
  let label: UILabel = {
    let label = UILabel()
    label.adjustsFontSizeToFitWidth = true
    return label
  }()
  
  var taco: Taco!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(imgView)
    addSubview(label)
    
    imgView.snp.makeConstraints { (make) in
      make.left.top.right.equalToSuperview()
      make.height.equalTo(contentView.frame.size.height * 2 / 3)
    }
    
    label.snp.makeConstraints { (make) in
      make.left.right.equalToSuperview()
      make.bottom.equalToSuperview().offset(-5)
      make.top.equalTo(imgView.snp.bottom).offset(5)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureCell(taco: Taco) {
    self.taco = taco
    imgView.image = UIImage(named: taco.proteinID.rawValue)
    label.text = taco.productName
  }
}

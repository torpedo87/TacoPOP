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
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    view.backgroundColor = UIColor.clear
    view.collectionViewLayout = layout
    view.register(TacoCell.self, forCellWithReuseIdentifier: TacoCell.reuseIdentifier)
    view.dataSource = self
    view.delegate = self
    return view
  }()
  
  //single ton
  var dataService: DataService = DataService.instance
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataService.delegate = self
    dataService.loadDeliciousTacoData()
    dataService.tacoArray.shuffle()
    
    setupView()
  }
  
  func setupView() {
    view.backgroundColor = UIColor.white
    view.addSubview(topView)
    topView.addSubview(imgView)
    view.addSubview(collectionView)
    
    topView.snp.makeConstraints { (make) in
      make.top.left.right.equalToSuperview()
      make.height.equalTo(80)
    }
    imgView.snp.makeConstraints { (make) in
      make.center.equalTo(topView)
      make.width.equalTo(150)
      make.height.equalTo(60)
    }
    
    collectionView.snp.makeConstraints { (make) in
      make.top.equalTo(topView.snp.bottom).offset(20)
      make.bottom.equalToSuperview().offset(-20)
      make.left.right.equalToSuperview()
    }
  }
}

extension MainVC: DataServiceDelegate {
  func deleciousTacoDataLoaded() {
    print("loaded")
    collectionView.reloadData()
  }
}

extension MainVC: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataService.tacoArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as TacoCell
    let taco = dataService.tacoArray[indexPath.row]
    cell.configureCell(taco: taco)
    
    return cell
  }
}

extension MainVC: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cell = collectionView.cellForItem(at: indexPath) as? TacoCell else { fatalError() }
    cell.shake()
  }
}

extension MainVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 95, height: 95)
  }
}

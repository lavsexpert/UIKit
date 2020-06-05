//
//  ViewController.swift
//  UICollectionView
//
//  Created by Sergey Lavrov on 05.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  
  var menuArray: [Menu] = {
    var menu1 = Menu()
    menu1.name = "Закат 1"
    menu1.imageName = "1"
    var menu2 = Menu()
    menu2.name = "Закат 2"
    menu2.imageName = "2"
    var menu3 = Menu()
    menu3.name = "Закат 3"
    menu3.imageName = "3"
    return [menu1, menu2, menu3]
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showVC"{
      if let vc = segue.destination as? DetailViewController {
        let menu = sender as? Menu
        print(menu ?? "nil")
        vc.menu = menu
      }
    }
  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return menuArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
      cell.menu = menuArray[indexPath.row]
      cell.frame.size = CGSize(width: 100, height: 100)
      return cell
    }
    return UICollectionViewCell()
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let menu = menuArray[indexPath.row]
    performSegue(withIdentifier: "showVC", sender: menu)
  }
  
}


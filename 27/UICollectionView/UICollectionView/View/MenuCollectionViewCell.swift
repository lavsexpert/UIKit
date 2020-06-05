//
//  MenuCollectionViewCell.swift
//  UICollectionView
//
//  Created by Sergey Lavrov on 05.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  var menu: Menu? {
    didSet {
      nameLabel.text = menu?.name
      if let image = menu?.imageName {
        imageView.image = UIImage(named: image)
      }
    }
  }
  
}

//
//  ViewController.swift
//  UIImageView
//
//  Created by Sergey Lavrov on 02.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imgView: UIImageView!
  
  var imageView = UIImageView()
  let image = UIImage(named: "1")

  override func viewDidLoad() {
    super.viewDidLoad()

    imgView.layer.borderWidth = 2
    imgView.layer.borderColor = UIColor.blue.cgColor
    imgView.layer.cornerRadius = 150
    imgView.clipsToBounds = true
    
    imageView = UIImageView(image: image)
    imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    imageView.contentMode = .scaleAspectFit
    imageView.center = view.center
    view.addSubview(imageView)
    
    
  }


}


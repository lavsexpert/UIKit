//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Sergey Lavrov on 25.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var segments = UISegmentedControl()
    var menuArray = ["1.jpg", "2.jpg", "3.jpg"]
    var imageView = UIImageView()
    var imageArray = [UIImage(named: "1.jpg"),
                      UIImage(named: "2.jpg"),
                      UIImage(named: "3.jpg")]
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создание сегмент контрола
        segments = UISegmentedControl(items: menuArray)
        segments.frame = CGRect(x: 0, y: 30, width: view.frame.width, height: 30)
        segments.selectedSegmentIndex = 0
        segments.addTarget(self, action: #selector(selectSegment(target:)), for: .valueChanged)
        view.addSubview(segments)
        
        // Создание изображения
        imageView.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height/2)
        imageView.image = imageArray[0]
        view.addSubview(imageView)
        
        // Показ надписи
        label.frame = CGRect(x: 0, y: view.frame.height/2 + 60, width: view.frame.width, height: 30)
        label.font = UIFont(name: "System", size: 30)
        label.text = menuArray[0]
        label.textAlignment = NSTextAlignment.center
        view.addSubview(label)
    }

    // Переключение сегментов с показом фотографий
    @objc func selectSegment(target: UISegmentedControl){
        if target == segments {
            imageView.image = imageArray[target.selectedSegmentIndex]
            label.text = menuArray[target.selectedSegmentIndex]
        }
    }
}


//
//  ViewController.swift
//  UILabel
//
//  Created by Sergey Lavrov on 30.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelFrame = CGRect(x: 0, y: 0, width: 120, height: 50)
        label.frame = labelFrame
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Пример текста для проверки переносов на новые строки"
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .blue
        label.shadowColor = .green
        label.shadowOffset = CGSize(width: 2, height: 2)
        label.center = view.center
        view.addSubview(label)
    }


}


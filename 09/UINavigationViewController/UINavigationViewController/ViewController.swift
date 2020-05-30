//
//  ViewController.swift
//  UINavigationViewController
//
//  Created by Sergey Lavrov on 30.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var displaySecondButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Первый"
        displaySecondButton = UIButton(type: .system)
        displaySecondButton.setTitle("Второй", for: .normal)
        displaySecondButton.sizeToFit()
        displaySecondButton.center = view.center
        displaySecondButton.addTarget(self, action: #selector(showSecondVC(param:)), for: .touchUpInside)
        view.addSubview(displaySecondButton)
    }
    
    @objc func showSecondVC(param: Any){
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}


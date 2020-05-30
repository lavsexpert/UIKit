//
//  ViewController.swift
//  UITabBarController
//
//  Created by Sergey Lavrov on 30.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        title = "Первый"
    }
}


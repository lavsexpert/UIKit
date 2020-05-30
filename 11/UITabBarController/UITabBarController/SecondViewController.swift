//
//  SecondViewController.swift
//  UITabBarController
//
//  Created by Sergey Lavrov on 30.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        title = "Второй"
        tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
    }
}

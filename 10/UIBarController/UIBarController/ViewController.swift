//
//  ViewController.swift
//  UIBarController
//
//  Created by Sergey Lavrov on 30.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createImageTitle()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushAdd(param:)))
        
        let switcher = UISwitch()
        switcher.isOn = true
        switcher.addTarget(self, action: #selector(switcherChange(param:)), for: .valueChanged)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: switcher)
        
        let items = ["Вверх", "Вниз"]
        let segments = UISegmentedControl(items: items)
        //segments.isMomentary = true
        segments.addTarget(self, action: #selector(segmentChange(param:)), for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segments)
    }

    //MARK: - Method
    fileprivate func createImageTitle() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "apple")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    @objc func pushAdd(param: UIBarButtonItem){
        print("Добавлен")
    }

    @objc func switcherChange(param: UISwitch){
        if param.isOn {
            print("Включен")
        } else {
            print("Выключен")
        }
    }
    
    @objc func segmentChange(param: UISegmentedControl){
        switch param.selectedSegmentIndex {
        case 0:
            print("Вверх")
        case 1:
            print("Вниз")
        default:
            break
        }
    }
}


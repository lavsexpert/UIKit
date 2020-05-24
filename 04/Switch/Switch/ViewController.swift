//
//  ViewController.swift
//  Switch
//
//  Created by Sergey Lavrov on 24.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mySwitch = UISwitch()
    let mySwitch2 = UISwitch()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создали свич, включили его и добавили обработчик изменения состояния
        self.mySwitch.frame = CGRect(x: 100, y: 100, width: 0, height: 0)
        self.view.addSubview(self.mySwitch)
        self.mySwitch.setOn(true, animated: true)
        self.mySwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
        
        // Добавили второй свич и настроили цвета
        self.mySwitch2.frame = CGRect.zero
        self.mySwitch2.center = self.view.center
        self.view.addSubview(self.mySwitch2)
        self.mySwitch2.tintColor = UIColor.blue
        self.mySwitch2.thumbTintColor = UIColor.orange
        self.mySwitch2.onTintColor = UIColor.yellow
        self.mySwitch2.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
        
        // Создали кнопку
        self.button.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        self.button.backgroundColor = UIColor.red
        self.button.setTitle("OK", for: .normal)
        self.button.setTitle("Нажата", for: .highlighted)
        self.view.addSubview(self.button)
    }

    @objc func switchChange(paramTarget: UISwitch){
        if paramTarget.isOn{
            print("Switch on")
        } else {
            print("Switch off")
        }
    }
    
    @objc func isOn(target: UISwitch){
        if target.isOn{
            self.button.isUserInteractionEnabled = false
        } else {
            self.button.isUserInteractionEnabled = true
        }
    }
}


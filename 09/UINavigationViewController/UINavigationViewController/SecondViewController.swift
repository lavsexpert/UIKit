//
//  SecondViewController.swift
//  UINavigationViewController
//
//  Created by Sergey Lavrov on 30.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Второй"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    
    @objc func goBack() {
        //navigationController?.popViewController(animated: true)
        
        //Получаем текущий массив контроллеров
        var currentControllerArray = navigationController?.viewControllers
        
        //Удаляем последний контроллер в массиве
        currentControllerArray?.removeLast()
        
        //Присвоим
        if let newController = currentControllerArray{
            navigationController?.viewControllers = newController
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

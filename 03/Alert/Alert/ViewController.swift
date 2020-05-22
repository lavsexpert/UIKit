//
//  ViewController.swift
//  Alert
//
//  Created by Sergey Lavrov on 22.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showButton(_ sender: Any) {
        self.alert(title: "Внимание", message: "Введите ваше имя", style: .alert)
    }
    
    @IBAction func showSheet(_ sender: Any) {
        self.alert(title: "Меню", message: "", style: .actionSheet)
    }
    
    func alert(title: String, message: String, style:UIAlertController.Style){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            if (style == .alert){
                let text = alertController.textFields?.first?.text
                if(text == ""){
                    self.hiLabel.text = "Hi!"
                } else {
                    self.hiLabel.text = "Hi, " + (text!) + "!"
                }
            }
        }
        alertController.addAction(action)
        if (style == .alert){
            alertController.addTextField{ (textField) in
                textField.isSecureTextEntry = true
            }
        }
        self.present(alertController, animated: true, completion: nil)
    }
}


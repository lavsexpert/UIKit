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
        self.alert(title: "Внимание", message: "Введите логин и пароль")
    }
    
    @IBAction func showSheet(_ sender: Any) {
        self.menu()
    }
    
    func alert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            let text = alertController.textFields?.first?.text
            if(text == ""){
                self.hiLabel.text = "Привет!"
            } else {
                self.hiLabel.text = "Привет, " + (text!) + "!"
            }
        }
        alertController.addAction(action)
        alertController.addTextField()
        alertController.addTextField{ (passwordField) in
            passwordField.isSecureTextEntry = true
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func menu(){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Один", style: .default))
        alertController.addAction(UIAlertAction(title: "Два", style: .default))
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        self.present(alertController, animated: true, completion: nil)
    }
}


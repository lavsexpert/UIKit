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
        self.alert(title: "Внимание", message: "Введите логин и пароль", auth: true)
    }
    
    @IBAction func showSheet(_ sender: Any) {
        self.menu()
    }
    
    func alert(title: String, message: String, auth: Bool){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            if (auth){
                let text = alertController.textFields?.first?.text
                if(text == ""){
                    self.hiLabel.text = "Привет!"
                } else {
                    self.hiLabel.text = "Привет, " + (text!) + "!"
                }
            }
        }
        if (auth){
            alertController.addTextField()
            alertController.addTextField{ (passwordField) in
                passwordField.isSecureTextEntry = true
            }
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func menu(){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Один", style: .default){(action) in
            self.alert(title: "Один", message: "Первое действие", auth: false)
        })
        alertController.addAction(UIAlertAction(title: "Два", style: .default){(action) in
            self.alert(title: "Два", message: "Второе действие", auth: false)
        })
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        self.present(alertController, animated: true, completion: nil)
    }
}


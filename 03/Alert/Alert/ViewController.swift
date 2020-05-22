//
//  ViewController.swift
//  Alert
//
//  Created by Sergey Lavrov on 22.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert", message: "Ahtung", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            let text = alertController.textFields?.first?.text
            print(text ?? "nil text")
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)

    }
    
    @IBAction func showSheet(_ sender: Any) {
        let alertController = UIAlertController(title: "Menu", message: "Hi", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in

        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}


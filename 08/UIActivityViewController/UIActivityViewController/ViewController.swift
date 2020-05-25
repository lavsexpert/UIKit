//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by Sergey Lavrov on 25.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var buttonShare = UIButton()
    var textField = UITextField()
    var activity: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
    }

    //MARK: - Method
    // Добавляем поле для ввода текста
    func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        textField.center = view.center
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.placeholder = "Введите текст"
        textField.delegate = self
        view.addSubview(textField)
    }
    
    func createButton() {
        buttonShare = UIButton(type: .roundedRect)
        buttonShare.frame = CGRect(x: 0, y: 350, width: view.frame.width, height: 50)
        buttonShare.setTitle("Расшарить", for: .normal)
        buttonShare.addTarget(self, action: #selector(share(sender:)), for: .touchUpInside)
        view.addSubview(buttonShare)
    }
    
    @objc func share(sender: Any){
        let text = textField.text
        if text?.count == 0 {
            let message = "Сначала введите текст, потом нажмите кнопку"
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
        activity = UIActivityViewController(activityItems: [textField.text ?? "Неизвестно"], applicationActivities: nil)
        present(activity!, animated: true, completion: nil)
    }
    
    //MARK: - Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


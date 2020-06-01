//
//  ViewController.swift
//  UITextView
//
//  Created by Sergey Lavrov on 01.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var textView = UITextView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    createTextView()
  }

  func createTextView() {
    textView = UITextView(frame: CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: view.bounds.height / 2))
    textView.text = "Какой-то текст"
    textView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    textView.font = UIFont.systemFont(ofSize: 17)
    textView.backgroundColor = .white
    view.addSubview(textView)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    textView.resignFirstResponder()
  }
  
  @objc func updateTextView(param: Notification) {
    // Получаем фрейм выезжающей клавиатуры
    let userInfo = param.userInfo
    let keyboardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let keyboardFrame = view.convert(keyboardRect, to: view.window)
    
    // В зависимости от показа клавиатуры - двигаем
    if param.name == UIResponder.keyboardWillHideNotification {
      textView.contentInset = UIEdgeInsets.zero
      textView.backgroundColor = .white
    } else {
      textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
      textView.scrollIndicatorInsets = textView.contentInset
      textView.backgroundColor = .yellow
    }
    textView.scrollRangeToVisible(textView.selectedRange)
  }

}


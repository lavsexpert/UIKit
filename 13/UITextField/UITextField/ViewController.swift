//
//  ViewController.swift
//  UITextField
//
//  Created by Sergey Lavrov on 30.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  var textField = UITextField()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createTextField()
    textField.delegate = self
    textField.becomeFirstResponder()
    
    NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChange(param:)), name: UITextField.textDidChangeNotification, object: nil)
    
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (notification) in
      self.view.frame.origin.y = -200
    }
    
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (notification) in
      self.view.frame.origin.y = 0
    }
  }
  
  //MARK: - CreateUI
  func createTextField(){
    let frame = CGRect(x: 0, y: 0, width: 200, height: 31)
    textField = UITextField(frame: frame)
    textField.borderStyle = .roundedRect
    textField.contentVerticalAlignment = .center
    textField.textAlignment = .center
    textField.placeholder = "Я разработчик Swift"
    textField.center = view.center

    //let topConstraint = NSLayoutConstraint(item: textField, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
    //view.addConstraint(topConstraint)
    //let leftConstraint = NSLayoutConstraint(item: textField, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
    //view.addConstraint(leftConstraint)
    view.addSubview(textField)
  }
  
  //MARK: - UITextFieldDelegate
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    print("textFieldShouldBeginEditing - можно ли редактировать поле")
    return true
  } // return NO to disallow editing.

  func textFieldDidBeginEditing(_ textField: UITextField) {
    print("textFieldDidBeginEditing - началось редактирование")
  } // became first responder

  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    print("textFieldShouldEndEditing - перед завершением редактирования")
    return true
  } // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end

  func textFieldDidEndEditing(_ textField: UITextField) {
    print("textFieldDidEndEditing - закончилось редактирование")
  } // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    print("textFieldDidEndEditing - закончилось редактирование с доп.параметром")
  } // if implemented, called in place of textFieldDidEndEditing:

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print("textField - ввели букву = \(string)")
    return true
  } // return NO to not change text

  func textFieldDidChangeSelection(_ textField: UITextField) {
    print("textFieldDidChangeSelection - изменили выделение")
  }

  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    print("textFieldShouldClear - очистили")
    return true
  } // called when clear button pressed. return NO to ignore (no notifications)

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    print("textFieldShouldReturn - хотите убрать клавиатуру")
    textField.resignFirstResponder()
    return true
  } // called when 'return' key pressed. return NO to ignore.

  
  //MARK: - Notification
  @objc func textFieldTextDidChange(param: NSNotification){
    print("textFieldTextDidChange = \(param)")
  }
}


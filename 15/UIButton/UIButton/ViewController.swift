//
//  ViewController.swift
//  UIButton
//
//  Created by Sergey Lavrov on 02.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var buttons: [UIButton]!
  
  var myButton = UIButton()
  var imageButton = UIButton()
  let normalImage = UIImage(named: "1")
  let highlightedImage = UIImage(named: "2")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    for button in buttons {
      button.setTitleColor(.red, for: .normal)
    }
    
    myButton = UIButton(type: .roundedRect)
    myButton.frame = CGRect(x: 110, y: 200, width: 100, height: 44)
    myButton.setTitle("Нажми", for: .normal)
    myButton.setTitle("Упс", for: .highlighted)
    myButton.addTarget(self, action: #selector(buttonIsPressed(sender:)), for: .touchDown)
    myButton.addTarget(self, action: #selector(buttonIsTapped(sender:)), for: .touchUpInside)
    view.addSubview(myButton)

    imageButton = UIButton(type: .roundedRect)
    imageButton.frame = CGRect(x: 110, y: 400, width: 100, height: 100)
    imageButton.setTitle("1", for: .normal)
    imageButton.setBackgroundImage(normalImage, for: .normal)
    imageButton.setTitle("2", for: .highlighted)
    imageButton.setBackgroundImage(highlightedImage, for: .highlighted)
    view.addSubview(imageButton)


  }
  
  @objc func buttonIsPressed(sender: UIButton){
    print("Кнока нажата")
  }
  
  @objc func buttonIsTapped(sender: UIButton){
    print("Кнопка тапнута")
  }

  @IBAction func buttonAction(_ sender: Any) {
    let button = sender as! UIButton
    if button.titleLabel?.text == "Button1" {
      print("Это первая кнопка")
    } else if button.tag == 3 {
      print("Это кнопка 3")
    }
  }
  
}


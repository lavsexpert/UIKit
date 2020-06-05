//
//  TableEditController.swift
//  UITableViewController
//
//  Created by Sergey Lavrov on 05.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class TableEditController: UITableViewController {

  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var profTextField: UITextField!
  @IBOutlet weak var isPushSwitch: UISwitch!
  @IBOutlet weak var sexSegment: UISegmentedControl!
  
  let userDefaults = UserDefaults()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let name = userDefaults.object(forKey: "name"){
      nameTextField.text = name as? String
    }
    if let lastName = userDefaults.object(forKey: "lastName"){
      lastNameTextField.text = lastName as? String
    }
    if let prof = userDefaults.object(forKey: "prof"){
      profTextField.text = prof as? String
    }
    if let isSwitch = userDefaults.object(forKey: "push"){
      isPushSwitch.isOn = isSwitch as! Bool
    }
    if let sex = userDefaults.object(forKey: "sex"){
      sexSegment.selectedSegmentIndex = sex as! Int
    }
  }

  @IBAction func saveButton(_ sender: Any) {
    userDefaults.setValue(nameTextField.text, forKey: "name")
    userDefaults.setValue(lastNameTextField.text, forKey: "lastName")
    userDefaults.setValue(profTextField.text, forKey: "prof")
    userDefaults.set(isPushSwitch.isOn, forKey: "push")
    userDefaults.set(sexSegment.selectedSegmentIndex, forKey: "sex")
    print("Сохранение прошло")
    profTextField.resignFirstResponder()
  }
  
}

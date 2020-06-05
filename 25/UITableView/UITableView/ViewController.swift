//
//  ViewController.swift
//  UITableView
//
//  Created by Sergey Lavrov on 04.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  let identifier = "MyCell"
  var array = ["Альфа", "Бета", "Гамма", "Дельта"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func editTable(_ sender: Any) {
    tableView.isEditing = !tableView.isEditing
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    let number = array[indexPath.row]
    cell.textLabel?.text = number
    return cell
  }
  
  // Удаление
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .delete
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      array.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .left)
    }
  }
  
  // Перемещение
  func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let item = array[sourceIndexPath.row]
    array.remove(at: sourceIndexPath.row)
    array.insert(item, at: destinationIndexPath.row)
  }
  
  // Контекстное меню: копирование и вставка
  func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
    if action == #selector(copy(_:)){
      print("Копирование")
      return true
    } else if action == #selector(paste(_:)){
      print("Вставка")
      return true
    }
    return false
  }
  
  func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
    if action == #selector(copy(_:)){
      let cell = tableView.cellForRow(at: indexPath)
      let pasteBoard = UIPasteboard.general
      pasteBoard.string = cell?.textLabel?.text
    } else if action == #selector(paste(_:)){
      let cell = tableView.cellForRow(at: indexPath)
      let pasteBoard = UIPasteboard.general
      cell?.textLabel?.text = pasteBoard.string
    }
  }
}

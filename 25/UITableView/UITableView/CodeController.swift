//
//  CodeViewController.swift
//  UITableView
//
//  Created by Sergey Lavrov on 05.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class CodeController: UIViewController, UITableViewDelegate, UITableViewDataSource{

      var myTableView = UITableView()
      let indentifire = "MyCell"
      var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      
      override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
      }
      
      func createTable(){
        myTableView = UITableView(frame: view.bounds, style: .plain)
        //myTableView = UITableView(frame: view.bounds, style: .grouped)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(myTableView)
      }

      //MARK: - UITableViewDataSource
      func numberOfSections(in tableView: UITableView) -> Int {
        return 3
      }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
          return 3
        case 1:
          return 5
        case 2:
          return 8
        default:
          return 0
        }
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        cell.textLabel?.text = "Секция: \(array[indexPath.section]) - Строка: \(array[indexPath.row])"
        cell.accessoryType = .detailDisclosureButton
        switch indexPath.section {
        case 0:
          cell.backgroundColor = .red
        case 1:
          cell.backgroundColor = .orange
        case 2:
          cell.backgroundColor = .yellow
        default:
          break
        }
        return cell
      }
      
      //MARK: - UITableViewDelegate
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
      }
      
      func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Путь = ", indexPath)
        let cell = tableView.cellForRow(at: indexPath)
        print("Заголовок = ", cell?.textLabel?.text ?? "nil")
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = array[indexPath.row]
        print(number)
      }
    }

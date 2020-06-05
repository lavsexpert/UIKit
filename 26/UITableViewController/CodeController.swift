//
//  CodeController.swift
//  UITableViewController
//
//  Created by Sergey Lavrov on 05.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class CodeController: UIViewController {

  let tableVC = UITableViewController(style: .plain)
  var refresh = UIRefreshControl()
  var list = ["Альфа", "Бета", "Гамма"]
  //var list = [Date]()
  var identifier = "Cell"

  
  override func viewDidLoad() {
    super.viewDidLoad()
    createTableView()
    refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    refresh.tintColor = .orange
    tableVC.tableView.addSubview(refresh)
    view.addSubview(tableVC.tableView)
  }
  
  func createTableView(){
    tableVC.tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
    tableVC.tableView.delegate = self
    tableVC.tableView.dataSource = self
  }
  
  @objc func handleRefresh(){
    let item = list[list.count % 3]
    list.append(item)
    refresh.endRefreshing()
    let indexPath = IndexPath(row: list.count - 1, section: 0)
    tableVC.tableView.insertRows(at: [indexPath], with: .automatic)
  }
}

extension CodeController: UITableViewDelegate, UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    let item = list[indexPath.row]
    cell.textLabel?.text = item
    return cell
  }
}

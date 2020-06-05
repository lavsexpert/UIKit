//
//  TableController.swift
//  UITableViewController
//
//  Created by Sergey Lavrov on 05.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  var list = [Model]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let item = Model(name: "Иван", lastName: "Иванов", prof: "Водитель", push: false, sex: 0)
    list.append(item)
  }

  // MARK: - Table view data source

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell{
      let item = list[indexPath.row]
      cell.refresh(item)
      return cell
    }
    return UITableViewCell()
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}

//
//  TableViewCell.swift
//  UITableViewController
//
//  Created by Sergey Lavrov on 05.06.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var detailLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

  public func refresh(_ model: Model){
    nameLabel.text = "\(model.name) \(model.lastName)"
    detailLabel.text = model.prof
  }
}

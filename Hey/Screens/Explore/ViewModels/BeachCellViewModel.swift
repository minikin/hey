//
//  BeachCellViewModel.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 15.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import Services

struct BeachCellViewModel {

  // MARK: - Properties

  let imagePath: String
  let name: String
  let imageHeight: String

  // MARK: - Initialisation

  init(_ beach: Beach) {
    self.imagePath = Environment.baseUrlPath + beach.imagePath
    self.name = beach.name
    self.imageHeight = beach.imageHeight
  }
}

extension BeachCellViewModel {
  func configureBeacCell(_ cell: BeachCell) {
    guard let url = URL(string: imagePath) else {
      return
    }
    print("BeachCellViewModel", url)
    cell.beachPhoto.setImageWith(url)
    cell.beachNameLabel.text = name
  }
}

extension BeachCellViewModel {
  var beachCellDescriptor: CellDescriptor {
    return CellDescriptor(reuseIdentifier: "BeachCell", configure: self.configureBeacCell)
  }
}

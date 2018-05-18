//
//  BeachCellState.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 15.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services
import UIKit

struct BeachCellState {

    // MARK: - Properties

    let imagePath: String
    let name: String
    let imageHeight: String

    // MARK: - Initialisation

    init(_ beach: Beach) {
        imagePath = beach.imagePath
        name = beach.name
        imageHeight = beach.imageHeight
    }
}

extension BeachCellState {
    func configureBeacCell(_ cell: BeachCell) {
        guard let url = ApiRouter.image(imagePath: imagePath).urlRequest?.url else {
            return
        }
        cell.beachPhoto.setImageWith(url)
        cell.beachNameLabel.text = name
    }
}

extension BeachCellState {
    var beachCellDescriptor: CellDescriptor {
        return CellDescriptor(reuseIdentifier: "BeachCell", configure: configureBeacCell)
    }
}

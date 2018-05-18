//
//  BeachCellState.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 15.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services
import UIKit

struct BeachCellItem {

    // MARK: - Properties

    private(set) var imagePath: String
    private(set) var name: String
    private(set) var imageHeight: String

    // MARK: - Initialisation

    init(_ beach: Beach) {
        imagePath = beach.imagePath
        name = beach.name
        imageHeight = beach.imageHeight
    }
}

extension BeachCellItem {
    func configureBeacCell(_ cell: BeachCell) {
        guard let url = ApiRouter.image(imagePath: imagePath).urlRequest?.url else {
            return
        }
        cell.beachPhoto.setImageWith(url)
        cell.beachNameLabel.text = name
    }
}

extension BeachCellItem {
    var beachCellDescriptor: CellDescriptor {
        return CellDescriptor(reuseIdentifier: "BeachCell", configure: configureBeacCell)
    }
}

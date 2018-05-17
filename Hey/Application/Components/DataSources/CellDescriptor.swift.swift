//
//  CellDescriptor.swift.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

/// Generic UICollectionViewCell helper class.
struct CellDescriptor {

    // MARK: - Properties

    let cellClass: UICollectionViewCell.Type
    let reuseIdentifier: String
    let configure: (UICollectionViewCell) -> Void

    // MARK: - Object lifecycle

    init<Cell: UICollectionViewCell>(reuseIdentifier: String, configure: @escaping (Cell) -> Void) {
        cellClass = Cell.self
        self.reuseIdentifier = reuseIdentifier
        self.configure = { cell in
            // swiftlint:disable:next force_cast
            configure(cell as! Cell)
        }
    }
}

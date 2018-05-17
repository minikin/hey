//
//  BeachCell.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class BeachCell: UICollectionViewCell {

    // MARK: - Instance Properties

    @IBOutlet var beachNameLabel: UILabel!
    @IBOutlet var beachPhoto: UIImageView!

    // MARK: - Cell lifeCycle

    override func prepareForReuse() {
        super.prepareForReuse()
        beachPhoto.image = nil
    }
}

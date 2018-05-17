//
//  UIImageView+Extensions.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

private var imageCache: [URL: UIImage] = [:]

extension UIImageView {
    func setImageWith(_ url: URL) {
        if let image = imageCache[url] {
            return self.image = image
        }

        let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data,
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageCache[url] = image
                    self.image = image
                }
            }
        }
        dataTask.resume()
    }
}

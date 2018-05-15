//
//  String+Extension.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 15.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

extension String {
  func cgFloat() -> CGFloat? {
    guard let doubleValue = Double(self) else {
      return nil
    }
    return CGFloat(doubleValue)
  }
}

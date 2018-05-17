//
//  UserDefaults+Utility.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 17.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

extension UserDefaults {
  private enum Keys: String {
    case logged
  }

  static var logged: Bool {
    get {
      return UserDefaults.standard.bool(forKey: Keys.logged.rawValue)
    }
    set {
      UserDefaults.standard.set(newValue, forKey: Keys.logged.rawValue)
    }
  }
}

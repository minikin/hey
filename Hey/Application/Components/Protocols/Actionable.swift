//
//  Actionable.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 12.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

protocol Actionable: class {
  associatedtype ActionType
  associatedtype Delegate

  func notify(_ action: ActionType)
}

extension Actionable {
  func notify(_ action: ActionType) -> () -> Void {
    return { [weak self] in
      self?.notify(action)
    }
  }
}

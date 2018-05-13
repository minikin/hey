//
//  Coordinator.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import Services

protocol Coordinator {
  /// A child coordinators spun off by this coordinator.
  /// Important to keep a reference to prevent deallocation.
  var childCoordinators: [Coordinator] { get set }

  /// Start any action this coordinator should take. Often, this is
  /// presenting/pushing a new controller, or starting up a
  /// child coordinator.
  ///
  /// - Parameters:
  ///   - animated: whether to animate any transitions.
  ///   - completion: a completion block.
  func start(animated: Bool, completion: VoidClosure?)

  /// Clean up after this coordinator. Should get the app back to the
  /// state it was in when this coordinator started.
  ///
  /// - Parameters:
  ///   - animated: whether to animate any transitions.
  ///   - completion: a completion block.
  func cleanup(animated: Bool, completion: VoidClosure?)
}

extension Coordinator {
  /// ChildCoordinators is an optional
  var childCoordinators: [Coordinator] {
    get {
      return []
    } set {
      // We need to provide an empty one. Nothing to set here.
    }
  }
}

//
//  AuthCoordinator.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import Services

private enum State {
  case authenticated
  case none
}

final class AuthCoordinator: Coordinator {

  // MARK: - Instance Properties

  var childCoordinators: [Coordinator] = []
  let baseController: UIViewController
  weak var delegate: Delegate?

  // MARK: - Initialization

  init(_ baseController: UIViewController) {
    self.baseController = baseController
  }

  func start(animated: Bool, completion: VoidClosure?) {

  }

  func cleanup(animated: Bool, completion: VoidClosure?) {
    childCoordinators.first?.cleanup(animated: animated, completion: completion)
  }

}

// MARK: - Actionable

extension AuthCoordinator: Actionable {
  enum Action {
    case didSignIn
    case didFailToSignIn
    case authenticated
  }
}

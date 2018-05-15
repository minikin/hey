//
//  AuthCoordinator.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services
import UIKit

private enum State {
  case authenticated
  case none
}

final class AuthCoordinator: Coordinator {

  // MARK: - Instance Properties

  var childCoordinators: [Coordinator] = []
  let baseController: UIViewController
  weak var delegate: Delegate?

  private var userIsAuthenticated: Bool {
    return false
  }

  private var state: State {
    if userIsAuthenticated {
      return .authenticated
    } else {
      return .none
    }
  }

  // MARK: - Initialization

  init(_ baseController: UIViewController) {
    self.baseController = baseController
  }

  func start(animated: Bool, completion: VoidClosure?) {
    switch state {
    case .authenticated:
      notify(.authenticated)
    case .none:
      let signInCoordinator = SignInCoordinator(baseController)
      signInCoordinator.delegate = self
      signInCoordinator.start(animated: animated, completion: completion)
      childCoordinators = [signInCoordinator]
    }
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

// MARK: - SignInCoordinatorDelegate

extension AuthCoordinator: SignInCoordinatorDelegate {
  func signInCoordinator(_ coordinator: SignInCoordinator, didNotify action: SignInCoordinator.Action) {
    switch action {
    case .didSignIn:
      notify(.didSignIn)
    }
  }
}

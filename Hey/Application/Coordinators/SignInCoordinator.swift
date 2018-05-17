//
//  SignInCoordinator.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 14.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import Services

final class SignInCoordinator: Coordinator {

  // MARK: - Instance Properties

  let baseController: UIViewController
  var childCoordinators: [Coordinator] = []
  weak var delegate: Delegate?
  private var singInViewController: SignInViewController?

  // MARK: - Initialization
  
  init(_ baseController: UIViewController) {
    self.baseController = baseController
  }

  func start(animated: Bool, completion: VoidClosure?) {
    singInViewController = StoryboardScene.SignIn.initialScene.instantiate()
    singInViewController?.delegate = self
    self.baseController.present(singInViewController!, animated: animated, completion: completion)
  }

  func cleanup(animated: Bool, completion: VoidClosure?) {
    baseController.dismiss(animated: animated, completion: completion)
  }
}

// MARK: - Actionable

extension SignInCoordinator: Actionable {
  enum Action {
    case didSignIn
  }
}

// MARK: - SignInViewControllerDelegate

extension SignInCoordinator: SignInViewControllerDelegate {
  func signInViewController(_ vc: SignInViewController, didNotify action: SignInViewController.Action) {
    switch action {
    // Just for simplicity. In a real app it probably will different scenarios
    case .didSignIn, .didSingUp:
      notify(.didSignIn)
    default:
      print(action)
    }
  }
}

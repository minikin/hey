//
//  AppCoordinator.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import  Services

final class AppCoordinator: Coordinator {

  // MARK: - Instance Properties

  private let window: UIWindow
  private let rootController: UIViewController
  var childCoordinators: [Coordinator] = []

  // MARK: - Initialization

  init(window: UIWindow) {
    self.window = window
    let rootController = UIViewController()
    rootController.view.backgroundColor = .white
    self.rootController = rootController
  }

  func start(animated: Bool, completion: VoidClosure?) {
    // Configure window/root view controller
    window.setRootViewController(rootController, animated: false, completion: {
      self.window.makeKeyAndVisible()

      // Spin off auth coordinator
//      let authCoordinator = AuthCoordinator(self.rootController)
//      authCoordinator.delegate = self
//      self.childCoordinators = [authCoordinator]
//      authCoordinator.start(animated: animated, completion: completion)
    })
  }

  func cleanup(animated: Bool, completion: VoidClosure?) {
    completion?()
  }

}

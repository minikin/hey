//
//  ContentCoordinator.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import Services

final class ContentCoordinator: Coordinator {

  // MARK: - Instance Properties

  let baseController: UIViewController
  var childCoordinators: [Coordinator] = []

  // MARK: - Initialization

  init(_ baseController: UIViewController) {
    self.baseController = baseController
  }

  func start(animated: Bool, completion: VoidClosure?) {
    //let tabBarVC = UITabBarController()
  }

  func cleanup(animated: Bool, completion: VoidClosure?) {
    baseController.dismiss(animated: animated, completion: completion)
  }
}

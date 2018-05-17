//
//  AppCoordinator.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services
import UIKit

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
            let authCoordinator = AuthCoordinator(self.rootController)
            authCoordinator.delegate = self
            self.childCoordinators = [authCoordinator]
            authCoordinator.start(animated: animated, completion: completion)
        })
    }

    func cleanup(animated _: Bool, completion: VoidClosure?) {
        completion?()
    }
}

// MARK: - AuthCoordinatorDelegate

extension AppCoordinator: AuthCoordinatorDelegate {
    func authCoordinator(_ coordinator: AuthCoordinator, didNotify action: AuthCoordinator.Action) {
        switch action {
        case .didSignIn:
            guard let authCoordinator = childCoordinators.first as? AuthCoordinator else {
                preconditionFailure("AppCoordinator should have an AuthCoordinator as a child.")
            }
            childCoordinators = []
            authCoordinator.cleanup(animated: true) {
                let contentCoordinator = ContentCoordinator(self.rootController)
                self.childCoordinators = [contentCoordinator]
                contentCoordinator.start(animated: true, completion: nil)
            }
        case .didFailToSignIn:
            // Not implemnent
            return
        case .authenticated:
            childCoordinators = []
            let contentCoordinator = ContentCoordinator(rootController)
            childCoordinators = [contentCoordinator]
            coordinator.delegate = self
            contentCoordinator.start(animated: true, completion: nil)
        }
    }
}

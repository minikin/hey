//
//  ContentCoordinator.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services
import UIKit

final class ContentCoordinator: Coordinator {

    // MARK: - Instance Properties

    let baseController: UIViewController
    var childCoordinators: [Coordinator] = []
    weak var delegate: Delegate?

    // MARK: - Initialization

    init(_ baseController: UIViewController) {
        self.baseController = baseController
    }

    func start(animated: Bool, completion: VoidClosure?) {
        let tabBarVC = UITabBarController()
        tabBarVC.view.tintColor = .red

        let exploreVC = StoryboardScene.ExploreBeaches.initialScene.instantiate()
        exploreVC.tabBarItem = TabBarItem.explore.item

        let favoriteVC = StoryboardScene.Favorite.initialScene.instantiate()
        favoriteVC.tabBarItem = TabBarItem.favorite.item

        let myProfileVC = StoryboardScene.MyProfile.initialScene.instantiate()
        myProfileVC.delegate = self
        myProfileVC.tabBarItem = TabBarItem.myProfile.item

        tabBarVC.viewControllers = [exploreVC, favoriteVC, myProfileVC]
        tabBarVC.selectedIndex = 0

        tabBarVC.modalTransitionStyle = .crossDissolve
        baseController.present(tabBarVC, animated: animated, completion: completion)
    }

    func cleanup(animated: Bool, completion: VoidClosure?) {
        baseController.dismiss(animated: animated, completion: completion)
    }
}

// MARK: - Actionable

extension ContentCoordinator: Actionable {
    enum Action {
        case didSignOut
    }
}

// MARK: - MyProfileViewControllerDelegate

extension ContentCoordinator: MyProfileViewControllerDelegate {
    // TODO: - Implementation is not finished ⚠️
    func myProfileViewController(_: MyProfileViewController, didNotify action: MyProfileViewController.Action) {
        switch action {
        case .didSignOut:
          childCoordinators = []
          cleanup(animated: true) {
            let authCoordinator = AuthCoordinator(self.baseController)
            authCoordinator.start(animated: true, completion: nil)
          }
        }
    }
}

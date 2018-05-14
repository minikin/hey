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
    let tabBarVC = UITabBarController()
    tabBarVC.view.tintColor =  .red

    let exploreVC = StoryboardScene.ExploreBeaches.initialScene.instantiate()
    exploreVC.tabBarItem = UITabBarItem(title: L10n.Explore.Uitabbaritem.Title.explore,
                                        image: Asset.Explore.explore.image,
                                        tag: 0)

    let favoriteVC = StoryboardScene.Favorite.initialScene.instantiate()
    favoriteVC.tabBarItem = UITabBarItem(title: L10n.Favorite.Uitabbaritem.Title.favorite,
                                         image: Asset.Favorite.favorite.image,
                                         tag: 1)

    let myProfileVC = StoryboardScene.MyProfile.initialScene.instantiate()
    myProfileVC.tabBarItem = UITabBarItem(title: L10n.Profile.Uitabbaritem.Title.myProfile,
                                          image: Asset.Profile.profile.image,
                                          tag: 2)

    tabBarVC.viewControllers = [exploreVC, favoriteVC, myProfileVC]
    tabBarVC.selectedIndex = 0

    tabBarVC.modalTransitionStyle = .crossDissolve
    baseController.present(tabBarVC, animated: animated, completion: completion)
  }

  func cleanup(animated: Bool, completion: VoidClosure?) {
    baseController.dismiss(animated: animated, completion: completion)
  }
}

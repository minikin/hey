//
//  TabBarItems.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 20.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

enum TabBarItem {
    case explore, favorite, myProfile
}

extension TabBarItem {
    static var all: [TabBarItem] = [.explore, .favorite, .myProfile]
}

extension TabBarItem {
    var item: UITabBarItem {
        switch self {
        case .explore:
            return UITabBarItem(title: L10n.Explore.Uitabbaritem.Title.explore,
                                image: Asset.Explore.explore.image,
                                tag: 0)
        case .favorite:
            return UITabBarItem(title: L10n.Favorite.Uitabbaritem.Title.favorite,
                                image: Asset.Favorite.favorite.image,
                                tag: 1)
        case .myProfile:
            return UITabBarItem(title: L10n.Profile.Uitabbaritem.Title.myProfile,
                                image: Asset.Profile.profile.image,
                                tag: 2)
        }
    }
}

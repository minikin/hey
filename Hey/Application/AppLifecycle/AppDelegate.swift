//
//  AppDelegate.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 12.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var coordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions _: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        startAppCoordinator()

        return true
    }

    private func startAppCoordinator() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        coordinator = AppCoordinator(window: window)
        coordinator.start(animated: true) {
            // Do additional set-up.
        }
    }
}

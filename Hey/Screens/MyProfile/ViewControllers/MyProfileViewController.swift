//
//  MyProfileViewController.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 12.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private var userIdLabel: UILabel!
    @IBOutlet private var userEmailLabel: UILabel!
    @IBOutlet private var logOutButton: UIButton!

    // MARK: - Properties

    weak var delegate: Delegate?
    private let viewModel = UserProfileViewModel(UserProfileAPI())

    // MARK: - ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserData()
    }

    // MARK: - Helpers

    private func fetchUserData() {
        viewModel.getUserData()

        viewModel.showLoading = { [weak self] in
            self?.logOutButton.isEnabled = false
        }

        viewModel.succseed = { [weak self] in
            self?.configureViewWithSuccess()
        }

        viewModel.failedWithError = { [weak self] error in
            self?.logOutButton.isEnabled = true
            print(error)
        }
    }

    private func configureViewWithSuccess() {
        logOutButton.isEnabled = true
        userIdLabel.text = viewModel.userId
        userEmailLabel.text = viewModel.userEmial
    }

    // MARK: - IBActions

    @IBAction private func logOutDidPressed(_: UIButton) {
        viewModel.logOut()
        notify(.didSignOut)
    }
}

// MARK: - Actionable

extension MyProfileViewController: Actionable {
    enum Action {
        case didSignOut
    }
}

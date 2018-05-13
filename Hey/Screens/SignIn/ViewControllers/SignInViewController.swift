//
//  SignInViewController.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 12.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController {

  // MARK: - IBOutlets

  @IBOutlet var userEmailTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var signInButton: LoginButton!

  // MARK: - Properties

  weak var delegate: Delegate?

  // MARK: - ViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Helpers

  private func signInSuccessed() {
    self.notify(.didSignIn)
  }

  private func loginFailured() {
    self.notify(.didFailToSignIn)
  }

  // MARK: - IBActions

  @IBAction func loginButtonDidPressed(_ sender: LoginButton) {

  }
}

// MARK: - Actionable
extension SignInViewController: Actionable {
  enum Action {
    case didSignIn
    case didFailToSignIn
  }
}

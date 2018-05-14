//
//  SignInViewController.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 12.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import Services

final class SignInViewController: UIViewController {

  // MARK: - IBOutlets

  @IBOutlet private var userEmailTextField: UITextField!
  @IBOutlet private var passwordTextField: UITextField!
  @IBOutlet private var signInButton: UIButton!
  @IBOutlet private var signInOrSignUpButton: UIButton!

  // MARK: - Properties

  weak var delegate: Delegate?
  private var signInIsEnable = true

  // MARK: - ViewController LifeCycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setButtonsTittle()
  }

  // MARK: - IBActions

  @IBAction func loginButtonDidPressed(_ sender: UIButton) {
  }

  @IBAction func toggleSignInOrSignUpDidPressed(_ sender: UIButton) {
    signInIsEnable.toggle()
    setButtonsTittle()
  }

  // MARK: - Helpers

  private func setButtonsTittle() {
    if signInIsEnable {
      signInButton.setTitle(L10n.SignIn.Signin.Button.Title.signIn, for: UIControlState())
      signInOrSignUpButton.setTitle(L10n.SignIn.Signinorsignup.Button.Title.signUp, for: UIControlState())
    } else {
      signInButton.setTitle(L10n.SignIn.Signin.Button.Title.signUp, for: UIControlState())
      signInOrSignUpButton.setTitle(L10n.SignIn.Signinorsignup.Button.Title.signIn, for: UIControlState())
    }
  }

  private func signInSuccessed() {
    self.notify(.didSignIn)
  }

  private func loginFailed() {
    self.notify(.didFailToSignIn)
  }

  private func signUpSuccessed() {
    self.notify(.didSingUp)
  }

  private func signUFailedd() {
    self.notify(.didFailSingUp)
  }

}

// MARK: - Actionable
extension SignInViewController: Actionable {
  enum Action {
    case didSignIn
    case didFailToSignIn
    case didSingUp
    case didFailSingUp
  }
}

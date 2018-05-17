//
//  SignInViewController.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 12.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services
import UIKit

final class SignInViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private var userEmailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var signInButton: UIButton!
    @IBOutlet private var signInOrSignUpButton: UIButton!

    // MARK: - Properties

    weak var delegate: Delegate?
    private var signInIsEnable = true
    private let authState = AuthState(AuthAPI())

    // MARK: - ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonsTittle()
    }

    // MARK: - IBActions

    @IBAction func loginButtonDidPressed(_: UIButton) {
        guard let userEmail = userEmailTextField.text,
            let userPassword = passwordTextField.text,
            !userEmail.isEmpty,
            userPassword.count > 5 else {
            showAlert()
            return
        }

        userEmailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()

        if signInIsEnable {
            signIn(userEmail, password: userPassword)
        } else {
            signUp(userEmail, password: userPassword)
        }
    }

    @IBAction func toggleSignInOrSignUpDidPressed(_: UIButton) {
        signInIsEnable.toggle()
        setButtonsTittle()
    }

    // MARK: - Helpers

    //  test1@gmail.com  - 123456
    private func signIn(_ email: String, password: String) {
        authState.signIn(email, password: password)
        authState.succseed = { [weak self] in
            self?.signInSuccessed()
        }
        authState.failedWithError = { [weak self] _ in
            self?.signInFailed()
        }
    }

    private func signUp(_ email: String, password: String) {
        authState.signUp(email, password: password)
        authState.succseed = { [weak self] in
            self?.signUpSuccessed()
        }
        authState.failedWithError = { [weak self] _ in
            self?.signUpFailed()
        }
    }

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
        notify(.didSignIn)
    }

    private func signInFailed() {
        showAlert()
        notify(.didFailToSignIn)
    }

    private func signUpSuccessed() {
        notify(.didSingUp)
    }

    private func signUpFailed() {
        showAlert()
        notify(.didFailSingUp)
    }

    private func showAlert() {
        let alertView = UIAlertController(title: L10n.SignIn.Signinviewcontroller.Alert.title,
                                          message: L10n.SignIn.Signinviewcontroller.Alert.message,
                                          preferredStyle: .alert)
        let okAction = UIAlertAction(title: L10n.SignIn.Signinviewcontroller.Alert.Action.title, style: .default)
        alertView.addAction(okAction)
        present(alertView, animated: true)
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

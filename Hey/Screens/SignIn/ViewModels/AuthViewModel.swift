//
//  AuthViewModel.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 17.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services

final class AuthViewModel {

  // MARK: - Properties

  private let client: ApiClient
  private let defaults = UserDefaults.standard
  var showLoading: VoidClosure?
  var succseed: VoidClosure?
  var failedWithError: ((Error) -> Void)?

  var isLoading: Bool = false {
    didSet {
      showLoading?()
    }
  }

  // MARK: - Initialisation

  init(_ client: ApiClient) {
    self.client = client
  }

  // MARK: - Helpers

  func signIn(_ email: String, password: String) {
    if let client = client as? AuthAPI {
      isLoading = true
      client.signIn(email, pasword: password) { result in
        switch result {
        case .success(let account):
          self.isLoading = false
          self.succseed?()
          self.defaults.set(email, forKey: UserKey.email)
          Keychain.saveToken(email, token: account.accessToken)
          UserDefaults.logged = true
        case .failure(let error):
          self.isLoading = false
          self.failedWithError?(error)
          print(error)
        }
      }
    }
  }

  func signUp(_ email: String, password: String) {
    if let client = client as? AuthAPI {
      isLoading = true
      client.signUp(email, pasword: password) { result in
        switch result {
        case .success(let account):
          self.isLoading = false
          self.succseed?()
          print(account)
          self.defaults.set(email, forKey: UserKey.email)
          Keychain.saveToken(email, token: account.accessToken)
          UserDefaults.logged = true
        case .failure(let error):
          self.isLoading = false
          self.failedWithError?(error)
          print(error)
        }
      }
    }
  }
}

//
//  UserProfileState.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 17.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services

final class UserProfileState {

    // MARK: - Properties

    private let client: ApiClient
    private let defaults = UserDefaults.standard
    private(set) var userId = ""
    private(set) var userEmail = ""
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

    private func readTockenFromKeyChain() -> String {
        guard let userEmail = defaults.value(forKey: UserKey.email) as? String else {
            fatalError("Error can't find value for user email")
        }
        return Keychain.readToken(userEmail)
    }

    private func deleteTockenFromKeyChain() {
        guard let userEmail = defaults.value(forKey: UserKey.email) as? String else {
            fatalError("Error can't find value for user email")
        }
        let keyToRemove = userEmail
        Keychain.removeToken(keyToRemove)
        defaults.removeObject(forKey: userEmail)
        defaults.synchronize()
    }

    func getUserData() {
        if let client = client as? UserProfileAPI {
            isLoading = true
            client.fetchUserInfo(readTockenFromKeyChain()) { result in
                switch result {
                case let .success(user):
                    self.isLoading = false
                    self.userId = user.id
                    self.userEmail = user.email
                    self.succseed?()
                case let .failure(error):
                    self.isLoading = false
                    self.failedWithError?(error)
                    print(error)
                }
            }
        }
    }

    func logOut() {
        deleteTockenFromKeyChain()
        UserDefaults.logged = false
    }
}

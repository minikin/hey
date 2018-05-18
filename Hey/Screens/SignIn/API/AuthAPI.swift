//
//  AuthAPI.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services

final class AuthAPI: ApiClient {
    func signUp(_ email: String, pasword: String, completion: @escaping ApiComplitionBlock<Account>) {
        guard let request = ApiRouter.signUpUser(email: email, password: pasword).urlRequest else {
            fatalError("Can't build request to sign up user!")
        }
        authItem(with: request, completion: completion)
    }

    func signIn(_ email: String, pasword: String, completion: @escaping ApiComplitionBlock<Account>) {
        guard let request = ApiRouter.signInUser(email: email, password: pasword).urlRequest else {
            fatalError("Can't build request to sign in user!")
        }
        authItem(with: request, completion: completion)
    }
}

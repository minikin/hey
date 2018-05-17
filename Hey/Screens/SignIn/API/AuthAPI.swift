//
//  AuthAPI.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services

class AuthAPI: ApiClient {
    func signUp(_ email: String, pasword: String, completion: @escaping ApiComplitionBlock<Account>) {
        let request = ApiRouter.signUpUser(email: email, password: pasword).urlRequest
        authItem(with: request!, completion: completion)
    }

    func signIn(_ email: String, pasword: String, completion: @escaping ApiComplitionBlock<Account>) {
        let request = ApiRouter.signInUser(email: email, password: pasword).urlRequest
        authItem(with: request!, completion: completion)
    }
}

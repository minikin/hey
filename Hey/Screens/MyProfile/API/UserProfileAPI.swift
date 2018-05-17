//
//  UserProfileAPI.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services

class UserProfileAPI: ApiClient {
    func logOutUser(_ token: String, completion _: @escaping VoidClosure) {
        _ = ApiRouter.logOutUser(token: token).urlRequest
    }

    func fetchUserInfo(_ token: String, completion: @escaping ApiComplitionBlock<User>) {
        let request = ApiRouter.readUser(token: token).urlRequest
        getItem(with: request!, completion: completion)
    }
}

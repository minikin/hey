//
//  UserProfileAPI.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services

final class UserProfileAPI: ApiClient {
    func logOutUser(_ token: String, completion _: @escaping VoidClosure) {
        _ = ApiRouter.logOutUser(token: token).urlRequest
    }

    func fetchUserInfo(_ token: String, completion: @escaping ApiComplitionBlock<User>) {
        guard let request = ApiRouter.readUser(token: token).urlRequest else {
            fatalError("Can't build request to fetchUserInfo!")
        }
        getItem(with: request, completion: completion)
    }
}

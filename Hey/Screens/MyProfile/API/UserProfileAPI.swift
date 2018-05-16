//
//  UserProfileAPI.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Services

class UserProfileAPI: ApiClient {
  func fetchBeachList(_ page: Int = 1, completion: @escaping ApiComplitionBlock<[User]>) {
    let url = URL(string: "http://techtest.lab1886.io:3000/user/me")!
    let request = URLRequest(url: url)
    getItem(with: request, completion: completion)
  }
}

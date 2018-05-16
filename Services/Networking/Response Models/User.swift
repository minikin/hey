//
//  User.swift
//  Services
//
//  Created by Sasha Prokhorenko on 15.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

public struct User: Codable {

  // MARK: - Properties
  
  let id: String
  let email: String

  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case email = "email"
  }
}

//
//  BeachResponse.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

typealias Beaches = [BeachResponse]

struct BeachResponse: Codable {
  let id: String
  let name: String
  let imagePath: String

  enum CodingKeys: String, CodingKey {
    case id = "_id"
    case name = "name"
    case imagePath = "url"
  }
}

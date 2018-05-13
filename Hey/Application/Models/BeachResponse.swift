//
//  BeachResponse.swift
//  Hey
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

typealias Beaches = [BeachResponse]

struct BeachResponse: Codable {
  let name: String
  let imagePath: String

  enum CodingKeys: String, CodingKey {
    case name = "name"
    case imagePath = "url"
  }
}

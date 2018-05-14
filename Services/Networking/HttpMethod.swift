//
//  HttpMethod.swift
//  Services
//
//  Created by Sasha Prokhorenko on 14.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

enum HttpMethod<Body> {
  case get
  case post(Body)
}

extension HttpMethod {
  var method: String {
    switch self {
    case .get:
      return "GET"
    case .post:
      return "POST"
    }
  }

  func map<B>(f: (Body) -> B) -> HttpMethod<B> {
    switch self {
    case .get:
      return .get
    case .post(let body):
      return .post(f(body))
    }
  }
}

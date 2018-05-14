//
//  URLRequest+Extensions.swift
//  Services
//
//  Created by Sasha Prokhorenko on 14.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

extension URLRequest {
   init<A>(resource: Resource<A>) {
    self.init(url: resource.url)
    httpMethod = resource.method.method
    if case let .post(data) = resource.method {
      httpBody = data
    }
  }
}

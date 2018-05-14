//
//  Resource.swift
//  Services
//
//  Created by Sasha Prokhorenko on 14.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

public struct Resource<A> {
  let url: URL
  let method: HttpMethod<Data>
  let parse: (Data) -> A?
}

public extension Resource where A: Decodable {
  init(url: URL) {
    self.url = url
    self.method = HttpMethod.get
    self.parse = { try? JSONDecoder().decode(A.self, from: $0) }
  }
}

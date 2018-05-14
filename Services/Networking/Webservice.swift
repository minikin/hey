//
//  Webservice.swift
//  Services
//
//  Created by Sasha Prokhorenko on 14.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

public class Webservice {
  public init() {}
  public func load<A>(resource: Resource<A>, completion: @escaping (A?) -> Void) {
    let request = URLRequest(resource: resource)
    URLSession.shared.dataTask(with: request) { data, _, _ in
      completion(data.flatMap(resource.parse))
    }
    .resume()
  }
}

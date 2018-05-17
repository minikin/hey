//
//  Dictionary+Extensions.swift
//  Services
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

public extension Dictionary {
  /**
     This computed property returns a query parameters string from the given Dictionary.
     For example, if the input is ["day":"Tuesday", "month":"January"], the output
     string will be "day=Tuesday&month=January".
  */
  public var queryParameters: String {
    var parts: [String] = []
    for (key, value) in self {
      let part = String(format: "%@=%@",
                        String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                        String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
      parts.append(part)
    }
    return parts.joined(separator: "&")
  }
}

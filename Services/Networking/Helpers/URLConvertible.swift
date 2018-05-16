//
//  URLConvertible.swift
//  Services
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

/// Types adopting the `URLConvertible` protocol can be used to construct URLs, which are then used to construct
/// URL requests.
public protocol URLConvertible {
  func asURL() throws -> URL
}

extension String: URLConvertible {
  /// Returns a URL if `self` represents a valid URL string that conforms to RFC 2396 or throws an `ApiError`.
  public func asURL() throws -> URL {
    guard let url = URL(string: self) else { throw ApiError.invalidURL(url: self) }
    return url
  }
}

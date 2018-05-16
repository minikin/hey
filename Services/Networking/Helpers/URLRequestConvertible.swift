//
//  URLRequestConvertible.swift
//  Services
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

/// Types adopting the `URLRequestConvertible` protocol can be used to construct URL requests.
public protocol URLRequestConvertible {
  func asURLRequest() throws -> URLRequest
}

extension URLRequestConvertible {
  /// The URL request.
  public var urlRequest: URLRequest? { return try? asURLRequest() }
}

extension URLRequest: URLRequestConvertible {
  /// Returns a URL request or throws if an `Error` was encountered.
  public func asURLRequest() throws -> URLRequest { return self }
}

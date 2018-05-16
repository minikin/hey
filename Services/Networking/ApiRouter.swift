//
//  ApiRouter.swift
//  Services
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: Any]

public enum ApiRouter: URLRequestConvertible {
  case createUser(email: String, password: String)
  case signInUser(email: String, password: String)
  case readUser(parameters: Parameters)
  case destroyUser(parameters: Parameters)
  case readBeaches(page: Int)

  static let baseURLString = "http://techtest.lab1886.io:3000/"

  var method: HTTPMethod {
    switch self {
    case .createUser, .signInUser:
      return .post
    case .destroyUser:
      return .delete
    case .readBeaches, .readUser:
      return .get
    }
  }

  var path: String {
    switch self {
    case .createUser:
      return "user/register"
    case .signInUser:
      return "user/login"
    case .readUser:
      return "user/me"
    case .destroyUser:
      return "user/logout"
    case .readBeaches:
      return "beaches"
    }
  }

  var url: URL? {
    let url = try? ApiRouter.baseURLString.asURL()

    switch self {
    case .readBeaches(let page):
      guard var components = URLComponents(url: (url!.appendingPathComponent(path)), resolvingAgainstBaseURL: false) else {
        break
      }
      components.queryItems = [URLQueryItem(name: "page", value: page.description)]
      return components.url
    default:
      break
    }

    return url
  }

  public func asURLRequest() throws -> URLRequest {
    guard let finalUrl = url else {
      throw ApiError.invalidRequestURL(url: url)
    }
    var urlRequest = URLRequest(url: finalUrl)
    urlRequest.httpMethod = method.rawValue
    print(urlRequest.httpMethod, urlRequest)
    return urlRequest
  }
}

//
//  Endpoint.swift
//  Services
//
//  Created by Sasha Prokhorenko on 14.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

protocol Endpoint {
  var baseUrl: String { get }
  var path: String { get }
  var urlParameters: [URLQueryItem] { get }
}

extension Endpoint {
  var urlComponent: URLComponents {
    var urlComponent = URLComponents(string: baseUrl)
    urlComponent?.path = path
    urlComponent?.queryItems = urlParameters
    return urlComponent!
  }

  var request: URLRequest {
    return URLRequest(url: urlComponent.url!)
  }
}

//
//  ApiClient.swift
//  Services
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//
// Abstract:
// A protocol for making generic network requests.

import Foundation

public protocol ApiClient {
  var session: URLSession { get }
  func getItem<T: Codable>(with request: URLRequest, completion: @escaping ApiComplitionBlock<T>)
  func getListOfItems<T: Codable>(with request: URLRequest, completion: @escaping ApiComplitionBlock<[T]>)
}

public extension ApiClient {
  var session: URLSession {
    return URLSession.shared
  }

  public func getItem<T: Codable>(with request: URLRequest, completion: @escaping ApiComplitionBlock<T>) {
    let task = session.dataTask(with: request) { data, response, error in
      if let e = error {
        ApiResult.failure(.connectionError(e)) -=> completion
      } else {
        // swiftlint:disable:next force_cast
        let http = response as! HTTPURLResponse
        switch http.statusCode {
        case 200:
          let jsonDecoder = JSONDecoder()
          do {
            let value = try jsonDecoder.decode(T.self, from: data!)
            ApiResult.success(value) -=> completion
          } catch let e {
            print(e)
            let bodyString = String(data: data!, encoding: .utf8)
            ApiResult.failure(.responseFormatInvalid(bodyString ?? "<no body>")) -=> completion
          }
        default:
          ApiResult.failure(.serverError(http.statusCode)) -=> completion
        }
      }
    }
    task.resume()
  }

  public func getListOfItems<T: Codable>(with request: URLRequest, completion: @escaping ApiComplitionBlock<[T]>) {
    let task = session.dataTask(with: request) { data, response, error in
      if let e = error {
        ApiResult.failure(.connectionError(e)) -=> completion
      } else {
        // swiftlint:disable:next force_cast
        let http = response as! HTTPURLResponse
        switch http.statusCode {
        case 200:
          let jsonDecoder = JSONDecoder()
          do {
            let value = try jsonDecoder.decode([T].self, from: data!)
            ApiResult.success(value) -=> completion
          } catch let e {
            print(e)
            let bodyString = String(data: data!, encoding: .utf8)
            ApiResult.failure(.responseFormatInvalid(bodyString ?? "<no body>")) -=> completion
          }
        default:
          ApiResult.failure(.serverError(http.statusCode)) -=> completion
        }
      }
    }
    task.resume()
  }

  public func authItem(with request: URLRequest, completion: @escaping ApiComplitionBlock<Account>) {
    let task = session.dataTask(with: request) { _, response, error in
      if let e = error {
        ApiResult.failure(.connectionError(e)) -=> completion
      } else {
        // swiftlint:disable:next force_cast
        let http = response as! HTTPURLResponse
        switch http.statusCode {
        case 200:
          guard let token = http.allHeaderFields["x-auth"] as? String else {
            return ApiResult.failure(.invalidHeader(http.allHeaderFields)) -=> completion
          }
          ApiResult.success(Account(token)) -=> completion
        default:
          ApiResult.failure(.serverError(http.statusCode)) -=> completion
        }
      }
    }
    task.resume()
  }
}

//
//  ApiResult.swift
//  Services
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

public enum ApiResult<T: Codable> {
  case success(T)
  case failure(ApiError)
}

public enum ApiError: Error {
  case notFound    // 404
  case serverError(Int) // 5xx
  case requestError // 4xx
  case responseFormatInvalid(String)
  case connectionError(Error)
}

public typealias ApiComplitionBlock<T: Codable> = (ApiResult<T>) -> Void

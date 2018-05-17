//
//  ApiError.swift
//  Services
//
//  Created by Sasha Prokhorenko on 16.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

public enum ApiError: Error {
  case notFound    // 404
  case serverError(Int) // 5xx
  case requestError // 4xx
  case responseFormatInvalid(String)
  case connectionError(Error)
  case invalidURL(url: URL?)
  case invalidHeader([AnyHashable: Any])
}

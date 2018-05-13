//
//  Result.swift
//  Services
//
//  Created by Sasha Prokhorenko on 12.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

public enum Result<Value> {
  case success(Value)
  case failure(Error)

  public func unwrap() throws -> Value {
    switch self {
    case let .success(value):
      return value
    case let .failure(error):
      throw error
    }
  }
}

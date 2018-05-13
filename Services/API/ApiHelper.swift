//
//  ApiHelper.swift
//  Services
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

infix operator -=>

public
func -=> <T>(result: ApiResult<T>, complition: @escaping ApiComplitionBlock<T>) {
  DispatchQueue.main.async {
    complition(result)
  }
}

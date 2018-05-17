//
//  ApiHelper.swift
//  Services
//
//  Created by Sasha Prokhorenko on 13.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

infix operator -=>

/// Function wich is always return ApiResult<T> on the main thread.
func -=> <T>(result: ApiResult<T>, complition: @escaping ApiComplitionBlock<T>) {
    DispatchQueue.main.async {
        complition(result)
    }
}

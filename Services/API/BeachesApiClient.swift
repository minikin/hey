//
//  BeachesApiClient.swift
//  Services
//
//  Created by Sasha Prokhorenko on 15.05.18.
//  Copyright © 2018 Sasha Prokhorenko. All rights reserved.
//

import Foundation

public class BeachesClient {

  let session: URLSession

  public init(session: URLSession) {
    self.session = session
  }

  public func fetchBeachList(completion: @escaping ApiComplitionBlock<[Beach]>) {

    let url = URL(string: "http://techtest.lab1886.io:3000/beaches?page=1")!
    let req = URLRequest(url: url)

    let task = session.dataTask(with: req) { (data, response, error) in
      if let e = error {
        ApiResult.failure(.connectionError(e)) -=> completion
      } else {
        //swiftlint:disable:next force_cast
        let http = response as! HTTPURLResponse
        switch http.statusCode {
        case 200:
          let jsonDecoder = JSONDecoder()
          do {
            let coinList = try jsonDecoder.decode([Beach].self, from: data!)
            ApiResult.success(coinList) -=> completion
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

  public func fetchUserInfo() {

  }

  public func signUpUser() {

  }

  public func signInUser() {

  }

  public func logOutUser() {

  }
}
